CREATE TABLE IF EXISTS artist (
	artist_id SERIAL PRIMARY KEY,
	alias VARCHAR(40) NOT NULL
);

CREATE TABLE IF EXISTS musical_genre (
	genre_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL
);

CREATE TABLE IF EXISTS album (
	album_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	release_year date
);

CREATE TABLE IF EXISTS music_track (
	track_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	duration DECIMAL(3, 2),
	album_id INTEGER NOT NULL REFERENCES album(album_id)
);

CREATE TABLE IF EXISTS collections (
	collection_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	release_date date
);

CREATE TABLE IF EXISTS artist_genre (
	artist_id INTEGER NOT NULL REFERENCES artist(artist_id),
	genre_id INTEGER NOT NULL REFERENCES musical_genre(genre_id),
	constraint artist_genre_pk PRIMARY KEY (artist_id, genre_id)
);

CREATE TABLE IF EXISTS artist_album (
	artist_id INTEGER NOT NULL REFERENCES artist(artist_id),
	album_id INTEGER NOT NULL REFERENCES album(album_id),
	constraint artist_album_pk PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE IF EXISTS track_collection (
	track_id INTEGER NOT NULL REFERENCES music_track(track_id),
	collection_id INTEGER NOT NULL REFERENCES collections(collection_id),
	constraint track_collection_pk PRIMARY KEY (track_id, collection_id)
);