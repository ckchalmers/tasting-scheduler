from flask import Flask, jsonify, render_template
from model import db, Tasting, User, connect_to_db

app = Flask(__name__)
app.secret_key = 'replace_this_with_an_actual_secret'


@app.route('/')
def home():

    return render_template('index.html')

# users can log in by providing a user name
@app.route('/login')
def login():

    return render_template('index.html')

# @app.route('/<path>')
# def route(path):

#     return render_template('index.html')

# @app.route('/<path>/<code>')
# def nested_route(path, code):

#     return render_template('index.html')

# a page to display all tastings (limit to available once working)
@app.route('/api/tastings')
def get_tastings():
    tastings = Tasting.query.all()
    return jsonify({tasting.tasting_id: tasting.to_dict() for tasting in tastings})

#show user info (once working, add all the appointments for a user)
@app.route('/api/user/<user_id>')
def get_user(user_id):

    user = User.query.get(user_id)
    return jsonify(user.to_dict())


if __name__ == '__main__':
    connect_to_db(app)
    app.run('0.0.0.0', port='5001', debug=True)
