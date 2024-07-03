from movies_and_reviews import app, db

@app.cli.command('create_db')
def create_db():
    db.create_all()
    print("Base de datos creada")

@app.cli.command('drop_db')
def drop_db():
    db.drop_all()
    print("Base de datos eliminada")

if __name__ == "__main__":
    app.run(debug=True)
