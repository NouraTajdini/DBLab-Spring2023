CREATE TABLE films (
    id integer NOT NULL,
    title character varying,
    release_year integer,
    country character varying,
    duration integer,
    language character varying,
    certification character varying,
    gross bigint,
    budget bigint
);

CREATE TABLE people (
    id integer NOT NULL,
    name character varying,
    birthdate date,
    deathdate date
);


CREATE TABLE reviews (
    id integer NOT NULL,
    film_id integer,
    num_user integer,
    num_critic integer,
    imdb_score real,
    num_votes integer,
    facebook_likes integer
);


CREATE TABLE roles (
    id integer NOT NULL,
    film_id integer,
    person_id integer,
    role character varying
);



ALTER TABLE ONLY films
    ADD CONSTRAINT films_pkey PRIMARY KEY (id);




ALTER TABLE ONLY people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);



ALTER TABLE ONLY reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);



ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);