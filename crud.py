"""CRUD operations."""

from model import db, User, Tasting, connect_to_db


def create_user(name):
    """Create and return a new user."""

    user = User(name=name)

    return user

def return_all_users():
    """Return all users."""
    return User.query.all()

def get_user_by_id(user_id): 
    """Return user detail with a given id"""
    return User.query.get(user_id)

def get_user_by_name(name): 
    """Return user detail with a given name"""
    return User.query.filter(User.name == name).first()

# def create_movie(title, overview, release_date, poster_path):
#     """Create and return a new movie."""

#     movie = Movie(
#         title=title,
#         overview=overview,
#         release_date=release_date,
#         poster_path=poster_path,
#     )

#     return movie

def return_all_tastings():
    """Return all tastings."""
    return Tasting.query.all()

def get_tasting_by_id(tasting_id): 
    """"Return title of movie with a given id"""
    return Tasting.query.get(tasting_id)

def get_tastings_by_date(date): 
    """"Return movie object from a given id"""
    return Tasting.query.filter(Tasting.date == date).all()

def get_tasting_by_date_and_time(date, time): 
    """"Return movie object from a given id"""
    return Tasting.query.filter(Tasting.date == date, Tasting.time == time).first()

def get_tastings_in_range(date, start_time, end_time): 
    """"Return tastings from a given date and time range"""
    return Tasting.query.filter(Tasting.date == date, Tasting.time > start_time, Tasting.time <end_time).all()

def get_tastings_by_user(user): 
    """"Return movie object from a given id"""
    return Tasting.query.filter(Tasting.user == user).all()

def update_tasting(date, time, user):
    """Create and return a new rating."""
    # get tasting_id based on date & time
    target_tasting = get_tasting_by_date_and_time(date, time)
    tasting_id = target_tasting.tasting_id
    tasting = Tasting(tasting_id=tasting_id, user=user)

    return tasting

def get_ratings(user_id):
    """Return all ratings for a given user."""
    # user = get_user_by_id(user_id)

    user_ratings = Rating.query.filter(Rating.user_id == user_id).all()

    return user_ratings
    

if __name__ == '__main__':
    from server import app
    connect_to_db(app)