CREATE DATABASE university_db;

CREATE TABLE programs (
      id INT AUTO_INCREMENT PRIMARY KEY,
      name VARCHAR(100) NOT NULL,
      description TEXT,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE years (
       id INT AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(20) NOT NULL
);

CREATE TABLE students (
      id INT AUTO_INCREMENT PRIMARY KEY,
      name VARCHAR(100) NOT NULL,
      program_id INT NOT NULL,
      enrollment_date DATE,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      FOREIGN KEY (program_id) REFERENCES programs(id)
);

CREATE TABLE subjects (
      id INT AUTO_INCREMENT PRIMARY KEY,
      name VARCHAR(100) NOT NULL,
      program_id INT NOT NULL,
      year_id INT NOT NULL,
      description TEXT,
      credits INT,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      FOREIGN KEY (program_id) REFERENCES programs(id),
      FOREIGN KEY (year_id) REFERENCES years(id)
);

-- Insert sample data
INSERT INTO programs (name) VALUES
    ('Software Engineering'),
    ('Computer Science'),
    ('Information Technology');

INSERT INTO years (name) VALUES
     ('Year 1'),
     ('Year 2'),
     ('Year 3'),
     ('Year 4');

-- Insert sample subjects for Software Engineering
INSERT INTO subjects (name, program_id, year_id) VALUES
     ('Introduction to Programming', 1, 1),
     ('Discrete Mathematics', 1, 1),
     ('Data Structures', 1, 2),
     ('Algorithms', 1, 2),
     ('Software Architecture', 1, 3),
     ('Machine Learning', 1, 4);

-- Insert 20 Software Engineering students
INSERT INTO students (name, program_id, enrollment_date) VALUES
     ('John Smith', 1, '2023-09-01'),
     ('Emily Johnson', 1, '2023-09-01'),
     ('Michael Williams', 1, '2023-09-01'),
     ('Sarah Brown', 1, '2023-09-01'),
     ('David Jones', 1, '2023-09-01'),
     ('Jessica Garcia', 1, '2023-09-01'),
     ('Robert Miller', 1, '2023-09-01'),
     ('Jennifer Davis', 1, '2023-09-01'),
     ('Thomas Rodriguez', 1, '2023-09-01'),
     ('Lisa Martinez', 1, '2023-09-01'),
     ('William Hernandez', 1, '2022-09-01'),
     ('Nancy Lopez', 1, '2022-09-01'),
     ('James Gonzalez', 1, '2022-09-01'),
     ('Elizabeth Wilson', 2, '2022-09-01'),
     ('Charles Anderson', 2, '2022-09-01'),
     ('Patricia Thomas', 2, '2022-09-01'),
     ('Christopher Taylor', 2, '2021-09-01'),
     ('Linda Moore', 3, '2021-09-01'),
     ('Daniel Jackson', 3, '2021-09-01'),
     ('Karen Martin', 3, '2021-09-01');