from flask import Flask, jsonify, render_template
from model import db, Melon, MelonType, connect_to_db

app = Flask(__name__)
app.secret_key = 'replace_this_with_an_actual_secret'


@app.route('/')
def home():

    return render_template('index.html')

@app.route('/login')
def login():

    return render_template('index.html')

# this will likely be for users to see all their appointments
@app.route('/<path>')
def route(path):

    return render_template('index.html')

# we need a page for displaying the results of the appointment search
@app.route('/api/melons')
def get_melons():
    melons = Melon.query.all()
    return jsonify({melon.melon_code: melon.to_dict() for melon in melons})

# we need a page to search for appointments
@app.route('/<path>/<code>')
def nested_route(path, code):

    return render_template('index.html')


@app.route('/api/melon/<melon_code>')
def get_melon(melon_code):

    melon = Melon.query.get(melon_code)
    return jsonify(melon.to_dict())


if __name__ == '__main__':
    connect_to_db(app)
    app.run('0.0.0.0', port='5001', debug=True)
