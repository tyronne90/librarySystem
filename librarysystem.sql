CREATE DATABASE IF NOT EXISTS librarysystem;

USE librarysystem;

DROP TABLE books;

CREATE TABLE IF NOT EXISTS books(
	id INT AUTO_INCREMENT PRIMARY KEY,
    bookId VARCHAR(10),
    bookName VARCHAR(20),
    bookDescription VARCHAR(40),
	mainclass VARCHAR(20),
	subclass VARCHAR(20),
    isbn VARCHAR(20),
    author VARCHAR(40)
);

INSERT INTO books
(bookId,bookName,bookDescription,mainclass,subclass,isbn,author)
VALUES
('b001', 'Chemistry', 'part1', 'Maths', 'Sub', 'w2342423r','we');

SELECT * FROM books;
SELECT * FROM mainclassification;
SELECT * FROM subclassification;

CREATE TABLE IF NOT EXISTS mainclassification(
	id INT AUTO_INCREMENT PRIMARY KEY,
	mainclass VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS subclassification(
	id INT AUTO_INCREMENT PRIMARY KEY,
	subclass VARCHAR(20),
	mainclass VARCHAR(20)
);

INSERT INTO mainclassification (mainclass) VALUES ('Science'),('Maths'),('History');

INSERT INTO subclassification (subclass,mainclass) VALUES ('Astro','Science'),('Trignometry','Maths'),('Algebra','Maths');






