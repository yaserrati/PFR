from flask import Flask, jsonify
import pandas as pd
from datetime import datetime
    
date_now = datetime.now().strftime("%Y%m%d")

app = Flask(__name__)   

@app.route('/data', methods=['GET'])    
def extract_data():
    try:
        # Charger le fichier CSV avec l'encodage ISO-8859-1
        fichier_csv = f"C:\\Users\\Youcode\\Desktop\\descktop\\PFR\\data\\raw\\ecom_data_{date_now}.csv"
        donnees = pd.read_csv(fichier_csv, encoding='ISO-8859-1')

        # Convertir les données en format JSON
        donnees_json = donnees.to_json(orient='records')

        return jsonify({'success': True, 'donnees': donnees_json})
    except Exception as e:
        return jsonify({'success': False, 'erreur': str(e)})

if __name__ == '__main__':
    app.run(debug=True)
