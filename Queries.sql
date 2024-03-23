-- MENTOR
CREATE TABLE MENTOR (
  Mentor_Id INTEGER AUTO_INCREMENT PRIMARY KEY,
  Mentor_Name VARCHAR(255),
  Email VARCHAR(255),
  Mobile_Number VARCHAR(255)
);
INSERT INTO MENTOR (Mentor_Name,Email, Mobile_Number)
VALUES ('John','john@gmail.com','7896532410'),
       ('Paul','paul@gmail.com', '7894561425'),
       ('Joe','joe@gmail.com', '9652419871');

select * from MENTOR;

-- BATCH
CREATE TABLE BATCH (
  Batch_Id INTEGER AUTO_INCREMENT PRIMARY KEY,
  Batch_Name VARCHAR(255),
  Total_Student INTEGER,
  Mentor_Id INTEGER,
  FOREIGN KEY (Mentor_Id) REFERENCES MENTOR(Mentor_Id)
);
INSERT INTO BATCH (Batch_Name, Total_Student, Mentor_Id)
VALUES ('B55WD1', 25, 1),
       ('B55WD2', 23, 2),
       ('B55WD3', 18, 3);
select * from BATCH;

-- STUDENTS
CREATE TABLE STUDENTS (
  Student_Id INTEGER AUTO_INCREMENT PRIMARY KEY,
  Student_Name VARCHAR(255),
  Mobile_Number VARCHAR(255),
  Email VARCHAR(255),
  Mentor_Name VARCHAR(255),
  Batch_Id INTEGER,
  Batch_Name VARCHAR(255),
  FOREIGN KEY (Batch_Id) REFERENCES BATCH(Batch_Id)
);
INSERT INTO STUDENTS (Student_Name, Mobile_Number, Email, Mentor_Name, Batch_Id, Batch_Name)
VALUES ('Max', '7846783468', 'Max@gmail.com', 'John', 1, 'B55WD1'),
       ('Josy', '9846766834', 'josy@gmail.com', 'John', 1, 'B55WD1'),
       ('Atlas','9846766834', 'atlas@gmail.com', 'Paul', 2, 'B55WD2'),
       ('Reba','7806456788', 'reba@gmail.com', 'Joe', 3, 'B55WD3');

select * from STUDENTS;

-- TASK
CREATE TABLE TASK (
  Task_Id INTEGER AUTO_INCREMENT PRIMARY KEY,
  Task_Name VARCHAR(255),
  Student_Id INTEGER,
  Mentor_Id INTEGER,
  Mentor_Name VARCHAR(255),
  Batch_Name VARCHAR(255),
  FOREIGN KEY (Student_Id) REFERENCES STUDENTS(Student_Id),
  FOREIGN KEY (Mentor_Id) REFERENCES MENTOR(Mentor_Id)
);

INSERT INTO TASK (Task_Name, Student_Id, Mentor_Id, Mentor_Name, Batch_Name)
VALUES ('Task 1', 1, 1, 'John', 'B55WD1'),
       ('Task 2', 2, 1, 'John', 'B55WD1'),
       ('Task 3', 3, 2, 'Paul', 'B55WD2'),
       ('Task 4', 4, 3, 'Joe', 'B55WD3');
       
       SELECT * from TASK;

-- DASHBOARD
CREATE TABLE DASHBOARD (
  Dashboard_Id INTEGER AUTO_INCREMENT PRIMARY KEY,
  Student_Id INTEGER,
  Mentor_Id INTEGER,
  Batch_Id INTEGER,
  FOREIGN KEY (Student_Id) REFERENCES STUDENTS(Student_Id),
  FOREIGN KEY (Mentor_Id) REFERENCES MENTOR(Mentor_Id),
  FOREIGN KEY (Batch_Id) REFERENCES BATCH(Batch_Id)
);

INSERT INTO DASHBOARD (Student_Id, Mentor_Id, Batch_Id)
VALUES  (1, 1, 1),
        (2, 1, 1),
        (3, 2, 2);

SELECT * FROM DASHBOARD;

-- QUERY
CREATE TABLE QUERY (
  Query_Id INTEGER AUTO_INCREMENT PRIMARY KEY,
  QueryText TEXT,
  Student_Id INTEGER,
  Batch_Id INTEGER,
  FOREIGN KEY (Student_Id) REFERENCES STUDENTS(Student_Id),
  FOREIGN KEY (Batch_Id) REFERENCES BATCH(Batch_Id)
);

INSERT INTO QUERY (QueryText, Student_Id, Batch_Id)
VALUES ('How to do this task usimh contextAPI', 1, 1),
       ('Doubts clarification on React-redux topic?', 2, 1),
       ('Doubts clarification on Node JS topic?', 3, 2);
       
SELECT * FROM QUERY;