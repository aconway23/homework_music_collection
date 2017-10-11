DROP TABLE IF EXISTS artist;
DROP TABLE IF EXISTS album;


CREATE TABLE artist (
  id SERIAL8 PRIMARY KEY,
  composer VARCHAR(255),
  song_title VARCHAR(255)

);


CREATE TABLE album (
  id SERIAL8 PRIMARY KEY,
  album_title VARCHAR(255),
  year INT2,
  artist INT8 REFERENCES album(id)
);
