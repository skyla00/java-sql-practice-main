CREATE TABLE Users (
    user_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Boards (
    board_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE Posts (
    post_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    user_id BIGINT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    board_id BIGINT,
    FOREIGN KEY (board_id) REFERENCES Boards(board_id),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Tags (
    tag_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Post_Tags (
    post_id BIGINT,
    FOREIGN KEY (post_id) REFERENCES Posts (post_id),
    tag_id BIGINT,
    FOREIGN KEY (tag_id) REFERENCES Tags (tag_id)
);

CREATE TABLE Comments (
    comment_id BigINT AUTO_INCREMENT PRIMARY KEY,
    content TEXT NOT NULL,
    user_id BIGINT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    post_id BIGINT,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);


