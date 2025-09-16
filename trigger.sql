DROP TABLE Library;
DROP TABLE Library_Audit;
CREATE TABLE Library (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255),
    Author VARCHAR(255),
    PublishedYear INT
);

INSERT INTO Library (BookID, Title, Author, PublishedYear)
VALUES (1, 'Programming in Java', 'John Doe', 2015);

INSERT INTO Library (BookID, Title, Author, PublishedYear)
VALUES (2, 'Rich Dad Poor Dad', 'Robert T. Kiyosaki', 1997);

INSERT INTO Library (BookID, Title, Author, PublishedYear)
VALUES (3, 'Atomic Habits', 'James Clear', 2018);

INSERT INTO Library (BookID, Title, Author, PublishedYear)
VALUES (4, 'Too Good to Be True', 'Carola Lovering', 2021);

INSERT INTO Library (BookID, Title, Author, PublishedYear)
VALUES (5, 'Clean Code', 'Robert C. Martin', 2008);

CREATE TABLE Library_Audit (
    ActionType VARCHAR(10),                  
    BookID INT,
    Title VARCHAR(255),
    Author VARCHAR(255),
    PublishedYear INT,
    ActionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE OR REPLACE TRIGGER update_trigger
AFTER UPDATE ON Library
FOR EACH ROW
BEGIN
    INSERT INTO Library_Audit (ActionType, BookID, Title, Author, PublishedYear)
    VALUES ('UPDATE', :OLD.BookID, :OLD.Title, :OLD.Author, :OLD.PublishedYear);
END;
/


CREATE OR REPLACE TRIGGER delete_trigger
AFTER DELETE ON Library
FOR EACH ROW
BEGIN
    INSERT INTO Library_Audit (ActionType, BookID, Title, Author, PublishedYear)
    VALUES ('DELETE', :OLD.BookID, :OLD.Title, :OLD.Author, :OLD.PublishedYear);
END;
/


