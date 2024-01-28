-- System has three users. Vader, Leia and Obi-Wan.
INSERT INTO users (username,email,phone) VALUES ("Vader","vader@gmail.com","1234567890") , ("Leia","leia@gmail.com","1230456789") , ("Obi-Wan","obiwan@gmail.com","1234506789");
SELECT * FROM users;

-- Vader posts tweets with content “I find your lack of faith disturbing.”
INSERT INTO tweets(userid, content) VALUES (1,"I find your lack of faith disturbing.");
SELECT * FROM tweets;

-- Leia likes Vader’s tweet.
INSERT INTO likes(userid,tweetid) VALUES (2,1);
SELECT * FROM likes;

--Obi-Wan retweets Vader’s tweet.
INSERT INTO tweets(userid,content,original_tweetid_for_retweet) VALUES (3,"I find your lack of faith disturbing.",1);

-- Leia follows Vader and Vader follows Obi-Wan.
INSERT INTO follow(follower_userid,following_userid) VALUES (2,1) , (1,3);

-- Obi-Wan tweets with content “The Force will be with you. Always.”
INSERT INTO tweet(userid,content) VALUES (3,"The Force will be with you. Always.");

--Leia comments on Obi-Wan’s tweet with content “Help me, Obi-Wan Kenobi. You’re my only hope.”
INSERT INTO tweet(userid,content,parent_tweetid_for_comment) VALUES (2,"Help me, Obi-Wan Kenobi. You’re my only hope.",3);
