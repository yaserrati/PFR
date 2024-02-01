from flask import Flask, jsonify, request, render_template
from pyspark.ml.recommendation import ALSModel
from pyspark.sql import SparkSession
from elasticsearch import Elasticsearch
from dotenv import load_dotenv
import os

load_dotenv()

app = Flask(__name__)

# Load Spark session
spark = SparkSession.builder.appName("MovieRecommendation").getOrCreate()

# Load the ALS model
model_path = os.getenv('BASE_PROJECT_PATH') + 'best_model'
als_model = ALSModel.load(model_path)

# Set up Elasticsearch connection
es = Elasticsearch(['http://localhost:9200'])  # Replace with your Elasticsearch host and port

# Create a dictionary to map movie IDs to names
movie_names_dict = {}
with open('C:\\Users\\Youcode\\Desktop\\Recommandation de Films Jay-Z Entertainment\\Jay-Z-Entertainment-Movie-Recommendation\\api\\data\\u.item', encoding='latin-1') as file:
    for line in file:
        fields = line.strip().split('|')
        movie_id = int(fields[0])
        movie_name = fields[1]
        movie_names_dict[movie_id] = movie_name

def get_movie_name(movie_id):
    # Use the dictionary to get the movie name
    return movie_names_dict.get(movie_id, 'Unknown')

def get_top_recommendations_for_user(user_id, num_recommendations=10):
    user_df = spark.createDataFrame([(user_id,)], ["userId"])
    recommendations = als_model.recommendForUserSubset(user_df, num_recommendations)
    movie_ids_and_ratings = [(r.movieId, r.rating) for r in recommendations.collect()[0]["recommendations"]]
    movie_names = [(get_movie_name(movie_id), rating) for movie_id, rating in movie_ids_and_ratings]
    return movie_names

def get_top_recommendations_for_users(user_ids, num_recommendations=3):
    user_df = spark.createDataFrame([(user_id,) for user_id in user_ids], ["userId"])
    recommendations = als_model.recommendForUserSubset(user_df, num_recommendations)
    user_recommendations = [
        (row.userId, [(get_movie_name(r.movieId), r.rating) for r in row.recommendations])
        for row in recommendations.collect()
    ]
    return user_recommendations

@app.route("/")
def index():
    return render_template('index.html')

@app.route("/recommendation/user", methods=["GET"])
def get_recommendations_for_user():
    user_id = int(request.args.get("userId"))
    recommendations = get_top_recommendations_for_user(user_id)
    return render_template('search_result.html', recommendations=recommendations)

@app.route("/recommendation/users", methods=["POST"])
def get_recommendations_for_users():  
    user_ids = request.json["userIds"]
    recommendations = get_top_recommendations_for_users(user_ids)
    return jsonify({"userRecommendations": recommendations})

if __name__ == "__main__":
    app.run(debug=True)
