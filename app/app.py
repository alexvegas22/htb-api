from flask import Flask
from flask_cors import CORS

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = 'static/uploads'


from app.src.routes.post_routes import post_routes
from app.src.routes.images_routes import images_routes

CORS(app)
app.register_blueprint(post_routes)
app.register_blueprint(images_routes)

@app.route('/')
def index():
    return 'Index Page' 

if __name__ == "__main__":
    app.run()
