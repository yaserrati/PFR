from flask import Flask, jsonify, request
import pandas as pd
from datetime import datetime

date_now = datetime.now().strftime("%Y%m%d")
app = Flask(__name__)

# Define your secret token
SECRET_TOKEN = "your_secret_token"

def authenticate_request():
    # Check if the Authorization header is present
    if 'Authorization' not in request.headers:
        return False

    # Retrieve the token from the Authorization header
    token = request.headers['Authorization']

    # Validate the token (replace this with your actual token validation logic)
    return token == f"Bearer {SECRET_TOKEN}"

@app.route('/test', methods=['GET'])
def extract_data():
    try:
        # Authenticate the request
        if not authenticate_request():
            return jsonify({'success': False, 'error': 'Authentication failed'})

        # Load the CSV file with ISO-8859-1 encoding
        csv_file = f"C:\\Users\\Youcode\\Desktop\\descktop\\PFR\\data\\raw\\ecom_data_{date_now}.csv"
        data = pd.read_csv(csv_file, encoding='ISO-8859-1')

        # Convert the data to JSON format
        data_json = data.to_json(orient='records')

        # Return the JSON data directly
        return data_json, 200, {'Content-Type': 'application/json'}
    except Exception as e:
        return jsonify({'success': False, 'error': str(e)})

if __name__ == '__main__':
    app.run(debug=True)
