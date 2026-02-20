 use edith

 CREATE TABLE courses (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    description VARCHAR(255),
    level VARCHAR(50),
    status VARCHAR(20),
    created_at DATETIME DEFAULT GETDATE()
);

CREATE TABLE users (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20),
    created_at DATETIME DEFAULT GETDATE()
);

CREATE TABLE enrollments (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    user_id BIGINT NOT NULL,
    course_id BIGINT NOT NULL,
    enrolled_at DATETIME DEFAULT GETDATE()
);

SELECT * FROM courses;