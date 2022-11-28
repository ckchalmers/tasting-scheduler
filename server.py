from flask import Flask, jsonify, render_template, redirect, url_for
from datetime import date, time
import json, requests
from model import db, Tasting, User, connect_to_db

app = Flask(__name__)
app.secret_key = 'replace_this_with_an_actual_secret'

@app.route('/')
def home():
    # if logged in, show search.
    # if session.user_id:
     # return redirect(url_for('/search')) 
    # else, show login page.
     # return redirect(url_for('/login'))
    return render_template('index.html')

# users can log in by providing a user name
@app.route('/login')
def login():
    # look up user_id based on name entered, 
    # user_id = User.query.

    # and set user_id in session data
    # if not in database, add to database
    # redirect 'api/user/<user_id>'

    return render_template('index.html')

# a page to display all tastings 
@app.route('/api/tastings')
def get_tastings():
    tastings = Tasting.query.all()
    # return json.dumps(my_dictionary, indent=4, sort_keys=True, default=str)
    return json.dumps({tasting.tasting_id: tasting.to_dict() for tasting in tastings}, default=str)

#show user info (once working, add all the appointments for a user)
@app.route('/api/user/<user_id>')
def get_user(user_id):

    user = User.query.get(user_id)
    return jsonify(user.to_dict())

# a page to search for tastings in a specific timeframe
@app.route('/api/search)

def search_tastings():
    # date = request.args.get("date")
    # check database for if customer already has a tasting on that date
    # if so, alert error message
    # else, return tastings where user is null.
    tastings = Tasting.query.get(date)
    return jsonify({tasting.tasting_id: tasting.to_dict() for tasting in tastings})
    # implement additonal time range by passing in start_time and end_time as well
    # add WHERE clause to database query for times > start_time and < end_time.


@app.route('/shopping-cart', methods=["POST"])
def reserve_tasting():
    """Allow user to reserve a tasting."""

    user = crud.get_user_by_id(session['user_id'])
    selected_tasting_id = crud.get_tasting_by_id(request.form.get('tasting'))


    db_tasting = crud.update_tasting(user, selected_tasting_id)

    db.session.add(db_rating)
    db.session.commit()

    # flash(f'Movie rating for {selected_movie.title} submitted!')


if __name__ == '__main__':
    connect_to_db(app)
    app.run('0.0.0.0', port='5001', debug=True)
