

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
        except:
                return jsonify({"error": "Something went wrong"})

@app.route("/movies/<id_movie>/new_review")