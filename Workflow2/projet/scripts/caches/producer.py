import requests
from confluent_kafka import Producer
import time
import json  # Added to serialize the user_data dictionary

# Set up Kafka Producer
conf = {
    'bootstrap.servers': 'localhost:9092',  # Replace with your Kafka broker's address
    'client.id': 'movies_data_producer'
}
producer = Producer(conf)

# Define the API URL
api_url = 'http://127.0.0.1:5000/movies/page{}'  # Replace with your API endpoint

# Function to fetch data from the API and send items to Kafka
def fetch_data_and_produce(page_number):
    response = requests.get(api_url.format(page_number))
    if response.status_code == 200:
        movie_data = response.json()
        if movie_data and 'results' in movie_data:
            for item in movie_data['results']:
                # Serialize user_data dictionary to JSON
                user_data_json = json.dumps(item.get("user_data", {}))
                item["user_data"] = user_data_json
                producer.produce('movies', value=str(item))
                producer.flush()
                movie = item["movie"]["movieId"]
                print(f"{movie} sent to Kafka from Page {page_number}")
                time.sleep(1)
            return True
        else:
            print("No more data available.")
            return False
    else:
        print(f"Failed to fetch data from page {page_number}")
        return False

# Fetch data from API and send items to Kafka until no more data available
page_num = 1
while fetch_data_and_produce(page_num):
    page_num += 1
