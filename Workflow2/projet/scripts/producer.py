import requests
from confluent_kafka import Producer
import time
import json

# Set up Kafka Producer
conf = {
    'bootstrap.servers': 'localhost:9092',  # Replace with your Kafka broker's address
    'client.id': 'products_data_producer'
}
producer = Producer(conf)

# Define the API URL
api_url = 'http://127.0.0.1:5000/products/page{}'  # Replace with your API endpoint

# Function to fetch data from the API and send items to Kafka
def fetch_data_and_produce(page_number):
    response = requests.get(api_url.format(page_number))
    if response.status_code == 200:
        product_data = response.json()
        if product_data and 'results' in product_data:
            for item in product_data['results']:
                # Replace NaN or nan with null in the JSON string
                json_string = json.dumps(item).replace("NaN", "null").replace("nan", "null")
                producer.produce('products', value=json_string)
                producer.flush()
                product_id = item["product"]["productId"]
                print(f"{product_id} sent to Kafka from Page {page_number}")
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
