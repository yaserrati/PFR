import findspark
findspark.init()
from flask import Flask, jsonify, request, render_template
from pyspark.ml.recommendation import ALSModel
from pyspark.sql import SparkSession
from dotenv import load_dotenv
import os

load_dotenv()

app = Flask(__name__)

# Load Spark session
spark = SparkSession.builder.appName("ProductRecommendation").getOrCreate()

# Load the ALS model
model_path = os.getenv('BASE_PROJECT_PATH') + 'ALS/best_model'
als_model = ALSModel.load(model_path)


def get_product_details(product_id):
    # Replace this with your logic to get product details based on the product_id
    # For now, returning dummy details
    return {
        "id": product_id,
        "name": f"Product {product_id}",
    }

def get_top_recommendations_for_user(user_id, num_recommendations=6):
    user_df = spark.createDataFrame([(user_id,)], ["userId"])
    recommendations = als_model.recommendForUserSubset(user_df, num_recommendations)
    product_ids = [row.product for row in recommendations.collect()[0]["recommendations"]]
    return product_ids

def get_top_recommendations_for_users(user_ids, num_recommendations=6):
    user_recommendations = []
    for user_id in user_ids:
        user_df = spark.createDataFrame([(user_id,)], ["userId"])
        recommendations = als_model.recommendForUserSubset(user_df, num_recommendations)
        product_ids = [row.product for row in recommendations.collect()[0]["recommendations"]]
        user_recommendations.append((user_id, product_ids))
    return user_recommendations

@app.route("/", methods=["GET"])
def home():
    return render_template("index.html")

@app.route("/recommendation/user", methods=["GET"])
def get_recommendations_for_user():
    user_id = int(request.args.get("userId"))
    recommendations = get_top_recommendations_for_user(user_id)
    
    # Get product details for each recommended product
    products = [get_product_details(product) for product in recommendations]
    
    return render_template("recommendation.html", products=products)

@app.route("/recommendation/users", methods=["POST"])
def get_recommendations_for_users():
    user_ids = request.json["userIds"]
    recommendations = get_top_recommendations_for_users(user_ids)
    
    # Get product details for each recommended product
    products = [get_product_details(product) for user, products in recommendations for product in products]
    
    return render_template("recommendation.html", products=products)

if __name__ == "__main__":
    app.run(debug=True)
