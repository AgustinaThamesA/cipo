from flask import Flask, render_template, request, jsonify, session, current_app, redirect
from movies_and_reviews import db, app, Movie, Review
from flask_cors import CORS

CORS(app)
port = 5000

@app.route("/movies", methods=["GET"])
def list_of_movies():
        try:
                movies = db.session.query(Movie).all()

                print(movies)
                movies_data = []
                for (movie) in movies:
                        movie_data = {
                                'id_movie': movie.id_movie,
                                'title': movie.title,
                                'genre': movie.genre,
                                'adult': movie.adult,
                                'budget': movie.budget,
                                'origin_country': movie.origin_country,
                                'release_date': movie.release_date,
                                'revenue': movie.revenue,
                                'runtime': movie.runtime,
                                'image': movie.image
                        }
                        movies_data.append(movie_data)
                return jsonify(movies_data)
        except Exception as error:
                print('Error', error)
                return jsonify({'message': 'There are no movies available...'}), 500


@app.route("/movies/<id_movie>/reviews", methods=["GET"])
def reviews_of_a_movie(id_movie):
    try:
        # Obtener la película correspondiente
        movie = db.session.query(Movie).filter(Movie.id_movie == id_movie).first()
        if not movie:
            return jsonify({'message': 'Movie nott found'}), 404

        # Obtener las reseñas de la película
        reviews = db.session.query(Review).filter(Review.id_movie == id_movie).all()

        reviews_data = []
        for review in reviews:
            review_data = {
                'id_movie': review.id_movie,
                'id_review': review.id_review,
                'comments': review.comments,
                'score': review.score,
                'reviewer_name': review.reviewer_name
            }
            reviews_data.append(review_data)

        # Preparar la respuesta final
        movie_data = {
            'id_movie': movie.id_movie,
            'image': movie.image,
            'title': movie.title,
            'reviews': reviews_data
        }

        return jsonify(movie_data)
    except Exception as error:
        print('Error', error)
        return jsonify({'message': 'An error occurred while retrieving reviews'}), 500

@app.route("/movies/<genre>", methods=["GET"])
def movies_by_genre(genre):
    try:
        movies_by_genre = db.session.query(Movie).filter(Movie.genre == genre).all()

        print(movies_by_genre)
        movies_by_genre_data = []
        for movie_by_genre in movies_by_genre:
            movie_data = {
                'id_movie': movie_by_genre.id_movie,
                'title': movie_by_genre.title,
                'genre': movie_by_genre.genre,
                'adult': movie_by_genre.adult,
                'budget': movie_by_genre.budget,
                'origin_country': movie_by_genre.origin_country,
                'release_date': movie_by_genre.release_date,
                'revenue': movie_by_genre.revenue,
                'runtime': movie_by_genre.runtime,
                'image': movie_by_genre.image,
            }
            movies_by_genre_data.append(movie_data)
        return jsonify(movies_by_genre_data)
    except Exception as error:
        print('Error', error)
        return jsonify({'message': 'There are no movies with this genre...'}), 500


@app.route("/movies/<id_movie>/new_review", methods=["POST"])
def create_new_review(id_movie):
    try:
        data = request.json
        new_review = Review(
            id_movie=id_movie,
            comments=data['comments'],
            score=data['score'],
            reviewer_name=data['reviewer_name']
        )
        db.session.add(new_review)
        db.session.commit()
        return jsonify({"message": "Review added successfully!"}), 200
    except Exception as error:
        print('Error:', error)
        return jsonify({"message": "An error occurred while adding the review."}), 500

        
      
@app.route("/movies/<id_movie>/reviews/<id_review>", methods=["DELETE"])
def delete_review(id_movie, id_review):
    try:
        review = db.session.query(Review).filter(Review.id_movie == id_movie, Review.id_review == id_review).first()
        if review:
            db.session.delete(review)
            db.session.commit()
            return jsonify({"message": "Review deleted successfully!"}), 200
        else:
            return jsonify({"message": "Review not found."}), 404
    except Exception as error:
        print('Error:', error)
        return jsonify({"message": "An error occurred while deleting the review."}), 500


@app.route("/movies/<id_movie>/reviews/<id_review>", methods=["PUT"])
def update_review(id_movie, id_review):
    try:
        data = request.json
        review = db.session.query(Review).filter(Review.id_movie == id_movie, Review.id_review == id_review).first()
        if review:
            review.comments = data.get('comments', review.comments)
            review.score = data.get('score', review.score)
            review.reviewer_name = data.get('reviewer_name', review.reviewer_name)
            db.session.commit()
            return jsonify({"message": "Review updated successfully!"}), 200
        else:
            return jsonify({"message": "Review not found."}), 404
    except Exception as error:
        print('Error:', error)
        return jsonify({"message": "An error occurred while updating the review."}), 500


if __name__ == '__main__':
        app.run(host='0.0.0.0', debug=True, port=port)
