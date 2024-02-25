import psycopg2
from sqlalchemy import create_engine

conn = psycopg2.connect(
    host="localhost", database="db_club_film", user="postgres", password="0803"
)

target = create_engine(
    "postgresql+psycopg2://postgres:0803@localhost:5432/db_club_film"
)

source = create_engine(
    "mysql+pymysql://root:0803@localhost:3306/sakila?charset=utf8mb4"
)
