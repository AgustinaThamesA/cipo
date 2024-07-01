from flask import Flask, render_template, request, jsonify, session, current_app, redirect
from movies_and_reviews import db, Movie, Review

app = Flask(__name__)
port = 5000

@app.route("/")
def home():
        return render_template("home.html")

@app.route("/movies/<id_movie>/reviews", methods=["GET"])
def reviews_of_a_movie(id_movie):
        try:
                reviews = db.session.query(Review).filter(Review.id_movie == id_movie).all()

                print(reviews)
                reviews_data = []
                for (review) in reviews:
                        review_data = {
                                'id_movie': review.id_movie,
                                'id_review': review.id_review,
                                'comments': review.comments,
                                'score': review.score,
                                'reviewer_name': review.reviewer_name,
                        }
                        reviews_data.append(review_data)
                return jsonify(reviews_data)
        except Exception as error:
                print('Error', error)
                return jsonify({'message': 'There are no reviews on this movie...'}), 500

@app.route("/movies/<id_movie>/new_review", methods=["POST"])
def new_review(id_movie):
        try:
                data = request.json
                



if __name__ == '__main__':
        app.run(host='0.0.0.0', debug=True, port=port)