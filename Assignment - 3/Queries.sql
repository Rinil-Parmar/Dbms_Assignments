--Assignment - 3

--Fetch all users name from database.
SELECT username FROM users;

--Fetch all tweets of user by user id most recent tweets first.
SELECT * FROM tweets WHERE userid = 1 ORDER BY created_at DESC;

--Fetch like count of particular tweet by tweet id.
SELECT tweetid,COUNT(*) AS like_count
FROM Likes
WHERE tweetid = 1;

--Fetch retweet count of particular tweet by tweet id.
SELECT original_tweetid_for_retweet,COUNT(*) AS retweet_count
FROM Tweets
WHERE original_tweetid_for_retweet = 1;

--Fetch comment count of particular tweet by tweet id.
SELECT parent_tweetid_for_comment,COUNT(*) AS comment_count
FROM Tweets
WHERE parent_tweetid_for_comment = 3;

--Fetch all user’s name who have retweeted particular tweet by tweet id.
SELECT Users.username
FROM Users
JOIN Tweets ON Users.userid = Tweets.userid
WHERE Tweets.original_tweetid_for_retweet = 1;

--Fetch all commented tweet’s content for particular tweet by tweet id.
SELECT content AS comment_content
FROM Tweets
WHERE parent_tweetid_for_comment = 3;

--Fetch user’s timeline (All tweets from users whom I am following with tweet content and user name who has tweeted it)
SELECT Users.username, Tweets.content
FROM Users
JOIN Tweets ON Users.userid = Tweets.userid
JOIN Followers ON Users.userid = Followers.following_userid
WHERE Followers.follower_userid = 1;
