DROP DATABASE IF EXISTS strumpor;
CREATE DATABASE strumpor;
\c strumpor;

CREATE TABLE strumpor (
	artikelnummer SERIAL PRIMARY KEY,
	bild VARCHAR,
	färg VARCHAR NOT NULL,
	lagersaldo SMALLINT CHECK (lagersaldo > -1),
	material VARCHAR NOT NULL,
	namn VARCHAR NOT NULL,
	passform VARCHAR NOT NULL,
	-- Pris upp till 1000 och avrundning till två decimaler.
	pris NUMERIC(5,2) CHECK (pris >= 0)
); 

CREATE TABLE kunder (
	efternamn VARCHAR NOT NULL,
	förnamn VARCHAR NOT NULL,
	kundnummer SERIAL PRIMARY KEY,
	mejladress VARCHAR NOT NULL
);

CREATE TABLE ordrar (
	orderdatum DATE DEFAULT CURRENT_DATE,
	ordernummer SERIAL PRIMARY KEY,
	orderstatus VARCHAR NOT NULL,
	kundnummer INTEGER REFERENCES kunder(kundnummer),
	leveransadress VARCHAR NOT NULL
);

CREATE TABLE orderinnehåll (
	ordernummer INTEGER PRIMARY KEY REFERENCES ordrar(ordernummer),
	artikelnummer INTEGER REFERENCES strumpor(artikelnummer)
);

CREATE TABLE administratörer (
	användarnamn VARCHAR PRIMARY KEY,
	lösenord VARCHAR NOT NULL
);