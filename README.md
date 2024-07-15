# **IntroMovies by Cipo Team**

## **Click here to go to IntroMovies**: http://127.0.0.1:5500/frontend/

---

## **Install**

```bash
python3 -m venv venv
source venv/bin/activate
pip install flask
```

## **Run back part**

First, change to the directory where the path 'cipo' is

```bash
cd ./back
python3 main.py
```

## Run front part

By using the app Visual Studio Code, you can install the extension 'Live Server' so you can click a button on the bottom part of the window app that says 'Go Live'. That would take you to an Internet app (for example Mozilla Firefox) and show you our website.

If you want to see our website just using shell commands without installing anything, you should open another bash terminal and write the following lines:

```bash
cd ./frontend
http-server -p 3000
```

## Database use

We have the database information inside 'mi_base_de_datos_backup.sql' so you can create both tables and also download the information of the movies. There are no reviews in that file so no movie would have a review initially. Don't worry, people would submit them for you!

---

## Report

At first, we thought that dividing tasks would be easier to develop our website. After trying to assemble the backend and frontend parts, we discovered that is easier to programming together so we could find and avoid the mistakes that we were making.

### Database

The idea of the database is to relate a movie with a lot of reviews, so that a review only can have a movie related. We decided to use serial type columns with autoicrement values so the id can be generate by itself. Althought something that we skipped is that when you delete a review the id there will be jumps between the id numbers.

- Primary keys: in movies_descriptions table is `id_movie`; in reviews table is `id_review`
- Foreign keys: in reviews table is `id_movie`

### Backend

We use database session querys to add, update and delete reviews. Also we implement the following methods: 'GET', 'POST', 'PUT', 'DELETE'. 

Flask Server Functions for Movie and Review Management

#### list_of_movies()
Route: /movies  
Method: GET  
Description: Retrieves the list of all available movies from the database.  
Returns: A JSON with the information of all movies or an error message if no movies are available.  

#### reviews_of_a_movie(id_movie)
Route: /movies/<id_movie>/reviews
Method: GET
Description: Retrieves the reviews of a specific movie along with the average score.
Parameters:
- id_movie: ID of the movie.
Returns: A JSON with the information of the movie and its reviews or an error message if the movie is not found.

#### movies_by_genre(genre)
Route: /movies/<genre>
Method: GET
Description: Retrieves the list of all movies of a specific genre.
Parameters:
- genre: Genre of the movies.
Returns: A JSON with the information of the movies of the specified genre or an error message if no movies are available in that genre.

#### create_new_review(id_movie)
Route: /movies/<id_movie>/new_review
Method: POST
Description: Creates a new review for a specific movie.
Parameters:
- id_movie: ID of the movie.
- JSON with the new review data (comments, score, reviewer_name).
Returns: A success message or an error message if there is an issue adding the review.

#### delete_review(id_movie, id_review)
Route: /movies/<id_movie>/reviews/<id_review>
Method: DELETE
Description: Deletes a specific review of a movie.
Parameters:
- id_movie: ID of the movie.
- id_review: ID of the review.
Returns: A success message or an error message if the review is not found or there is an issue deleting it.

#### update_review(id_movie, id_review)
Route: /movies/<id_movie>/reviews/<id_review>
Method: PUT
Description: Updates the details of a specific review of a movie.
Parameters:
- id_movie: ID of the movie.
- id_review: ID of the review.
- JSON with the updated review data (comments, score, reviewer_name).
Returns: A success message or an error message if the review is not found or there is an issue updating it.

#### Run the application
Description: Starts the Flask server on the specified port.
```python
if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True, port=5000)
```

### Frontend

#### frontend/index.html

This contains a welcome page and the button to see all movies.

#### frontend/all_movies/index.html

This page shows you all the movies with their descriptions that the database has, and a filter by genre.

#### frontend/movie_detail/index.html

This one shows a closer look to the image of the movie, the average score, and the reviews related to it. In addition, there are some buttons that allows you to add, update or delete a review.
