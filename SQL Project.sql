select * from users;
select username,created_at from users order by created_at limit 5;
select * from users u left join photos p on p.user_id=u.id where p.image_url is null order by u.username;
select u.username from users u left join photos p on p.user_id=u.id where p.image_url is null order by u.username;
select * from likes,photos,users;
select likes.photo_id,users.username, count(likes.user_id) as no_of_likes
from likes inner join photos on likes.photo_id=photos.id
inner join users on photos.user_id=users.id group by
likes.photo_id,users.username order by no_of_likes desc;
select * from photo_tags,tags;
select t.tag_name,count(p.photo_id) as h_tag from photo_tags p inner join tags t on t.id=p.tag_id group by t.tag_name order by h_tag desc;
select t.tag_name,count(p.photo_id) as h_tag from photo_tags p inner join tags t on t.id=p.tag_id group by t.tag_name order by h_tag desc limit 5;
select date_format((created_at), '%w') as day,count(username) from users group by 1 order by 2 desc;	
select * from photos,users;
with base as( 
select u.id as userid,count(p.id) as photoid from users u left join  photos p on p.user_id=u.id group by u.id)
select sum(photoid) as total_photos,count(userid) as total_users,sum(photoid)/count(userid) as photo_per_user from base;
select * from users,likes;
with base as(
select u.username,count(l.photo_id) as liked from likes l inner join users u on u.id=l.user_id
group by u.username) select username,liked from base where liked=(select count(*) from photos) order by username;