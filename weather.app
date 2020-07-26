import requests
from flask import Flask,request
app = Flask(__name__)


@app.route('/city')
def search_city():
    API_KEY = 'e03b0e4011564a1a9e11eb7086d70d1e' 
    city = request.args.get('q') 


    url = f'http://api.openweathermap.org/data/2.5/weather?q=city&APPID=e03b0e4011564a1a9e11eb7086d70d1e'
    response = requests.get(url).json()

    if response.get('cod') != 200:
        message = response.get('message', '')
        return f'Error getting temperature for {city.title()}. Error message = {e03b0e4011564a1a9e11eb7086d70d1emessage}'

    # get current temperature and convert it into Celsius
    current_temperature = response.get('main', {}).get('temp')
    if current_temperature:
        current_temperature_celsius = round(current_temperature - 273.15, 2)
        return f'Current temperature of {city.title()} is {current_temperature_celsius} &#8451;'
    else:
        return f'Error getting temperature for {city.title()}'
@app.route('/')
def index():
    return '<h1>Welcome to weather app</h1>'


if __name__ == '__main__':
    app.run(debug=True)