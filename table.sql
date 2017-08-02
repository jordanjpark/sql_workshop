.tables
actors            directors_genres  movies_directors  roles
directors         movies            movies_genres

CREATE TABLE "actors" (
  "id" int(11) NOT NULL DEFAULT '0',
  "first_name" varchar(100) DEFAULT NULL,
  "last_name" varchar(100) DEFAULT NULL,
  "gender" char(1) DEFAULT NULL,
  PRIMARY KEY ("id")
);

CREATE TABLE "roles" (
  "actor_id" int(11) DEFAULT NULL,
  "movie_id" int(11) DEFAULT NULL,
  "role" varchar(100) DEFAULT NULL
);


CREATE TABLE "movies" (
  "id" int(11) NOT NULL DEFAULT '0',
  "name" varchar(100) DEFAULT NULL,
  "year" int(11) DEFAULT NULL,
  "rank" float DEFAULT NULL,
  PRIMARY KEY ("id")
);

CREATE TABLE "movies_genres" (
  "movie_id" int(11) DEFAULT NULL,
  "genre" varchar(100) DEFAULT NULL
);

CREATE TABLE "directors" (
  "id" int(11) NOT NULL DEFAULT '0',
  "first_name" varchar(100) DEFAULT NULL,
  "last_name" varchar(100) DEFAULT NULL,
  PRIMARY KEY ("id")
);

CREATE TABLE "movies_directors" (
  "director_id" int(11) DEFAULT NULL,
  "movie_id" int(11) DEFAULT NULL
);
