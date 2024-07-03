import datetime
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Movie(db.Model):
        __tablename__ = 'movies_descriitions'
        id_movie = db.Column(db.Integer, primary_key=True)
        title = db.Column(db.String(255), nullable=False)
        genre = db.Column(db.String(255), nullable=False)
        adult = db.Column(db.Boolean, nullable=False)
        budget = db.Column(db.Integer)
        origin_country = db.Column(db.String(255), nullable=False)
        release_date = db.Column(db.Date, nullable=False)
        revenue = db.Column(db.Integer)
        runtime = db.Column(db.Integer, nullable=False)

class Review(db.Model):
        __tablename__ = 'reviews'
        id_review = db.Column(db.Integer, primary_key=True)
        id_movie = db.Column(db.Integer, db.ForeignKey('movies_descriptions.id_movie'))
        comments = db.Column(db.String(255), nullable=False)
        score = db.Column(db.Integer, nullable=False)
        reviewer_name = db.Column(db.String(255), nullable=False)