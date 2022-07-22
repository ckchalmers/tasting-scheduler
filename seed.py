from model import User, Tasting, connect_to_db, db
from server import app


def load_users():
    """Load users from data/users.csv into database."""

    for i, row in enumerate(open("data/users.csv")):
        name = row.rstrip()

        user = User(name=name)

        # We need to add to the session or it won't ever be stored
        db.session.add(user)

    # Once we're done, we should commit our work
    db.session.commit()

def load_tastings():
    """Load tastings from data/tastings.csv into database."""

    for i, row in enumerate(open("data/tastings.csv")):
        row = row.rstrip()
        date, time = row.split("|")

        tasting = Tasting(date=date, time=time)

        # We need to add to the session or it won't ever be stored
        db.session.add(tasting)

    # Once we're done, we should commit our work
    db.session.commit()


if __name__ == "__main__":
    connect_to_db(app)
    db.create_all()
    load_users()
    load_tastings()
