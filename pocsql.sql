create database taskdb;

use taskdb;

create table author (
id int primary key,
name varchar(100)
);

create table post(
id int primary key,
name varchar(100),
authorid int,
createdts datetime,
foreign key(authorid) references author(id) on delete cascade
);


create table user (
id int primary key,
name varchar(100)
);

create table comment (
id int primary key,
content varchar(1000),
postid int, 
createdts datetime,
userid int,
foreign key(userid) references user(id) on delete cascade,
foreign key(postid) references post(id) on delete cascade
);

insert into author(id,name) values(1,"James Bond"),(2,"Yuva"),(3,"Appu");
select * from author;

insert into user(id,name) values(1,"Chahal"),(2,"Jamison"),(3,"Gill"),(4,"Ricky");
select * from user;

insert into post(id,name,authorid,createdts) values(1,"Post1",1,'2022-02-01 12:20:30'),(2,"Post2",1,'2022-01-31 16:30:45'),(3,"Post3",2,'2022-01-30 10:10:10'),(4,"Post4",3,'2022-02-01 01:07:23');
select * from post;

insert into comment(id,content,postid,createdts,userid) values(1,"′Classic′ – a book which people praise and don’t read.",1,'2022-01-30 14:31:23',3),
(3,"Sleep is good, he said, and books are better.",1,'2022-01-30 13:13:23',1),(5,"Books are the quietest and most constant of friends;",1,'2022-01-30 15:21:09',1),(7,"Many people, myself among them, feel better at the mere sight of a book.",1,'2022-01-30 15:08:01',3),
(9,"The library is inhabited by spirits that come out of the pages at night.",1,'2022-01-30 14:23:45',1),(11,"If you don’t like to read, you haven’t found the right book.",1,'2022-01-30 12:31:33',4),(13,"When I have a little money, I buy books; and if I have any left, I buy food and clothes.",1,'2022-01-30 21:45:25',4),
(15,"Fill your house with stacks of books, in all the crannies and all the nooks.",1,'2022-01-30 18:07:56',1),(17,"That’s the thing about books. They let you travel without moving your feet.",1,'2022-01-30 17:54:32',4),(19,"A book is a version of the world. If you do not like it, ignore it; or offer your own version in return.",1,'2022-01-30 19:37:24',2),
(2,"I love the smell of book ink in the morning.",2,'2022-01-31 18:42:54',2),(6,"Rainy days should be spent at home with a cup of tea and a good book.",2,'2022-02-01 01:21:34',4),(4,"It is is better to know one book intimately than a hundred superficially.",2,'2022-01-31 19:56:50',1),
(8,"There is more treasure in books than in all the pirate’s loot on Treasure Island.",2,'2022-01-31 20:40:00',1),(10,"The America I love still exists at the front desks of our public libraries.",2,'2022-02-01 10:20:30',3),(20,"Books were my pass to personal freedom.",2,'2022-01-31 18:24:43',1),
(21,"No man can be called friendless who has God and the companionship of good books.",2,'2022-01-31 23:02:32',2),(22,"A half-read book is a half-finished love affair.",2,'2022-02-01 02:27:45',1),(23,"If you would tell me the heart of a man, tell me not what he reads, but what he rereads.",2,'2022-01-31 18:42:54',4),
(24,"Some of these things are true and some of them lies. But they are all good stories.",2,'2022-01-31 17:34:12',3),(12,"A children’s story that can only be enjoyed by children is not a good children’s story in the slightest",3,'2022-01-30 12:20:30',2),(16,"Wear the old coat and buy the new book.",3,'2022-01-30 13:24:35',1),
(14,"The best books… are those that tell you what you know already.",4,'2022-02-01 02:24:32',4),(18,"Reading one book is like eating one potato chip.",4,'2022-02-01 02:25:34',3),
(31,"Recent Comment",1,'2022-02-01 12:31:23',1);


select * from comment;

-- answer

select * from 
(select p.id as pid,p.name,p.createdts as pdates,p.authorid,c.id as cid,c.content,c.createdts as cdates,c.userid,
row_number() OVER (PARTITION BY p.id Order by p.createdts DESC) AS Sno  
from post p left join comment c on c.postid=p.id 
where c.postid in 
(select p.id from post p left join author a on a.id=p.authorid 
where a.name="James Bond") 
order by c.postid,c.createdts desc)aliasname where Sno<=10;











