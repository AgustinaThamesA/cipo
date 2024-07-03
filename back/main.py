from flask import Flask, render_template, request, jsonify, session, current_app, redirect
from movies_and_reviews import db, app, Movie, Review

port = 5000

@app.route("/")
def home():
        return """
        <html>
        <body>
        <h1>Welcome to my movies API</h1>
        <a href="/movies">Go to all movies</a>
        </body>
        </html>
        """

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
                        }
                        movies_data.append(movie_data)
                return jsonify(movies_data)
        except Exception as error:
                print('Error', error)
                return jsonify({'message': 'There are no movies available...'}), 500


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

@app.route("/movies/drama", methods=["GET"])
def movies_by_genre():
    try:
        movies_by_genre = db.session.query(Movie).filter(Movie.genre == 'Drama').all()

        print(movies_by_genre)
        movies_by_genre_data = []
        for movie in movies_by_genre:
            movie_by_genre_data = {
                'id_movie': movie.id_movie,
                'title': movie.title,
                'genre': movie.genre,
                'adult': movie.adult,
                'budget': movie.budget,
                'origin_country': movie.origin_country,
                'release_date': movie.release_date,
                'revenue': movie.revenue,
                'runtime': movie.runtime,
            }
            movies_by_genre_data.append(movie_by_genre_data)
        return jsonify(movies_by_genre_data)
    except Exception as error:
        print('Error', error)
        return jsonify({'message': 'There are no movies with this genre...'}), 500
                



if __name__ == '__main__':
        app.run(host='0.0.0.0', debug=True, port=port)