import os
import requests
from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__)

PEXELS_API_KEY = os.getenv("PEXELS_APIKEY")


def get_random_bike_image(page):
    url = f"https://api.pexels.com/v1/search?query=bike&per_page=1&page={page}"
    headers = {
        'Authorization': PEXELS_API_KEY
    }
    response = requests.get(url, headers=headers)
    if response.status_code == 200:
        data = response.json()
        if data['photos']:
            image_url = data['photos'][0]['src']['original']
            return image_url
    return None

@app.route('/')
def index():
    page = int(request.args.get('page', 1))  
    image_url = get_random_bike_image(page)
    return render_template('index.html', image_url=image_url, page=page)

@app.route('/next')
def next_image():
    page = int(request.args.get('page', 1)) + 1
    return redirect(url_for('index', page=page))

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=int("8080"))
