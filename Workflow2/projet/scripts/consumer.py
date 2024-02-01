from elasticsearch import Elasticsearch
from confluent_kafka import Consumer, KafkaError
import json
from datetime import datetime

# Set up Kafka Consumer
conf = {
    'bootstrap.servers': 'localhost:9092',  # Replace with your Kafka broker's address
    'group.id': 'products_data_consumer',
    'auto.offset.reset': 'earliest'
}
consumer = Consumer(conf)
consumer.subscribe(['products'])

# Set up Elasticsearch connection
es = Elasticsearch(['http://localhost:9200'])  # Replace with your Elasticsearch host and port

# Function to clean and preprocess data
def clean_data(data_dict):

    # # Convert timestamp to integer (if it's a string)
    # timestamp = int(data_dict.get('timestamp', 0))  # Replace 'timestamp' with the actual key in your data
    
    # # Format the timestamp
    # formatted_date = datetime.utcfromtimestamp(timestamp).strftime('%d-%m-%Y %H:%M:%S')
    # data_dict['formatted_date'] = formatted_date
    
    # Add user data to the Elasticsearch index
    user_data = data_dict.get('user_data', '{}')
    try:
        user_dict = json.loads(user_data)
    except json.JSONDecodeError:
        user_dict = {}
    
    # Include user age and gender in the processed_user_data field
    data_dict['processed_user_data'] = {
        'age': user_dict.get('age', None),
        'gender': user_dict.get('gender', None)
    }
    
    return data_dict

try:
    while True:
        msg = consumer.poll(1.0)
        if msg is None:
            continue
        if msg.error():
            print(f"Consumer error: {msg.error()}")
            continue

        # Decode the message value
        data_string = msg.value().decode('utf-8')
        json_string = data_string.replace("'", "\"")

        # Convert the JSON string to a Python dictionary
        try:
            data_dict = json.loads(json_string)
        except json.JSONDecodeError as e:
            print(f"Error decoding JSON: {e}")
            print(f"Invalid JSON string: {json_string}")
            continue

        # Clean and preprocess the data
        data_dict = clean_data(data_dict)

        # Index the cleaned data into Elasticsearch
        index_name = 'product1'
        es.index(index=index_name, body=data_dict)

        print(f"Indexed cleaned data into Elasticsearch: {data_dict}")
except KeyboardInterrupt:
    pass
finally:
    # Close Kafka consumer
    consumer.close()

