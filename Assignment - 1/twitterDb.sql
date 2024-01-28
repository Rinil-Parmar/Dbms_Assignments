-- Create the Users table
-- Users (1) to Tweets (Many) relationship
-- Users (Many) to Followers (Many) relationship
-- Users (1) to Likes (Many) relationship
CREATE TABLE Users (
    userid INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
);

-- Create the Tweets table
-- Tweets (Many) to Users (1) relationship
-- Tweets (Many) to Tweets (Many) relationship
-- Tweets (1) to Likes (Many) relationship
CREATE TABLE Tweets (
    tweetid INT PRIMARY KEY AUTO_INCREMENT,
    userid INT NOT NULL,
    content TEXT,
    original_tweetid_for_retweet INT,
    parent_tweetid_for_comment INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userid) REFERENCES Users(userid),
    FOREIGN KEY (original_tweetid_for_retweet) REFERENCES Tweets(tweetid),
    FOREIGN KEY (parent_tweetid_for_comment) REFERENCES Tweets(tweetid) 

);

-- Create the Followers table
CREATE TABLE Followers (
    followid INT PRIMARY KEY AUTO_INCREMENT,
    follower_userid INT,
    following_userid INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (follower_userid) REFERENCES Users(userid),
    FOREIGN KEY (following_userid) REFERENCES Users(userid),
    CHECK (follower_userid != following_userid)
);

-- Create the Likes table
CREATE TABLE Likes (
    likeid INT PRIMARY KEY AUTO_INCREMENT,
    userid INT,
    tweetid INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userid) REFERENCES Users(userid),
    FOREIGN KEY (tweetid) REFERENCES Tweets(tweetid)
);
