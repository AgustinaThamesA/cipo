from flask import Flask
from flask_sqlalchemy import SQLAlchemy
import os
from dotenv import load_dotenv
from flask_cors import CORS

load_dotenv()  # Cargar variables de entorno desde el archivo .env

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = os.getenv('DATABASE_URL')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

CORS(app)

db = SQLAlchemy(app)

class Movie(db.Model):
    __tablename__ = 'movies_descriptions'
    id_movie = db.Column(db.Integer, primary_key=True, autoincrement=True)
    title = db.Column(db.String(255), nullable=False)
    genre = db.Column(db.String(255), nullable=False)
    adult = db.Column(db.Boolean, nullable=False)
    budget = db.Column(db.Integer)
    origin_country = db.Column(db.String(255), nullable=False)
    release_date = db.Column(db.Date, nullable=False)
    revenue = db.Column(db.Integer)
    runtime = db.Column(db.Integer, nullable=False)
    image = db.Column(db.String, nullable=True)

class Review(db.Model):
    __tablename__ = 'reviews'
    id_review = db.Column(db.Integer, primary_key=True, autoincrement=True)
    id_movie = db.Column(db.Integer, db.ForeignKey('movies_descriptions.id_movie'))
    comments = db.Column(db.String(255), nullable=False)
    score = db.Column(db.Integer, nullable=False)
    reviewer_name = db.Column(db.String(255), nullable=False)

if __name__ == '__main__':
    app.run(debug=True)
