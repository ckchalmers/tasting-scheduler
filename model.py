from flask_sqlalchemy import SQLAlchemy


db = SQLAlchemy()

# for tastings, we need timeslot and date
# for users, we just need name
# a tasting can have one user, but users can have multiple tastings
# users can have only one tasting per day

class User(db.Model):
    """User"""

    __tablename__ = 'users'

    user_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    name = db.Column(db.String, nullable=False)

    def __repr__(self):
        return f'<User name={self.name}>'

    def to_dict(self):
        return {'user_id': self.type_id,
                'name': self.name}

class Tasting(db.Model):
    """Tasting"""

    __tablename__ = 'tastings'

    tasting_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    date = db.Column(db.Date, nullable=False)
    time = db.Column(db.Time, nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'))

    user = db.relationship('User', backref='tastings')

    def __repr__(self):
        return f'<Tasting Date={self.date}, Tasting Time={self.time}>'


    def to_dict(self):
        return {'tasting_id': self.tasting_id,
                'date': self.date,
                'time': self.time,
                'user': self.user.name}

# class Melon(db.Model):
#     """Melon"""

#     __tablename__ = 'melons'

#     melon_code = db.Column(db.String(8), primary_key=True)
#     name = db.Column(db.String, nullable=False)
#     price = db.Column(db.Float, nullable=False)
#     image_url = db.Column(db.String, nullable=False)
#     color = db.Column(db.String, nullable=False)
#     seedless = db.Column(db.Boolean, nullable=False)

#     melon_type_id = db.Column(db.Integer, db.ForeignKey('types.type_id'))

#     melon_type = db.relationship('MelonType', backref='melons')

#     def __repr__(self):
#         return f'<Melon melon_code={self.melon_code}>'

#     def to_dict(self):
#         return {'melon_code': self.melon_code,
#                 'name': self.name,
#                 'price': self.price,
#                 'image_url': self.image_url,
#                 'color': self.color,
#                 'seedless': self.seedless,
#                 'melon_type': self.melon_type.name}


# class MelonType(db.Model):
#     """Type of melon."""

#     __tablename__ = 'types'

#     type_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
#     name = db.Column(db.String, nullable=False)

#     def __repr__(self):
#         return f'<MelonType name={self.name}>'

#     def to_dict(self):
#         return {'type_id': self.type_id,
#                 'name': self.name}


def connect_to_db(app):

    app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///tastings'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    app.config['SQLALCHEMY_ECHO'] = True

    db.app = app
    db.init_app(app)

    print('Connected to database!')


if __name__ == '__main__':
    from server import app

    connect_to_db(app)
