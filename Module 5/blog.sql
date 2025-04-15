CREATE DATABASE blog;

USE blog;

CREATE TABLE users(
    id INT PRIMARY KEY AUTO_INCREAMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE posts(
    id INT PRIMARY KEY AUTO_INCREAMENT,
    title VARCHAR(255) NOT NULL UNIQUE,
    content TEXT NOT  NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFRENCES users(id) ON  DELETE CASCADE,
    password VARCHAR(255) NOT NULL,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE posts(
    id INT PRIMARY KEY AUTO_INCREAMENT,
    title VARCHAR(255) NOT NULL UNIQUE,
    content TEXT NOT  NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFRENCES users(id) ON  DELETE CASCADE,
    password VARCHAR(255) NOT NULL,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE comments(
    id INT PRIMARY KEY AUTO_INCREAMENT,
    comment TEXT NOT  NULL,
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    FOREIGN KEY (user_id) REFRENCES users(id) ON  DELETE CASCADE,
    FOREIGN KEY (post_id) REFRENCES posts(id) ON  DELETE CASCADE,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO users(email,password) VALUES ('panda@gmail.com', 'panda');

INSERT INTO posts (title, content, user_id) VALUES ('First Post', 'This is the content of the first post', 1);

INSERT INTO comments(comment, user_id, post_id) VALUES ('This is a comment on the first post.', 1, 1);


SELECT user.id AS user_id, user.email AS user_email
    post.id AS post_id, post.title AS post_title
    comment AS comment_id, comment.comment AS comment
FROM users AS user
JOIN posts AS post ON user.id = post.user_id
JOIN comments AS comment ON post.id = comment.post_id
WHERE comment.user_id = user.id;