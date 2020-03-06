/* ACTOR (Act_id, Act_Name, Act_Gender) 
DIRECTOR (Dir_id, Dir_Name, Dir_Phone)
MOVIES (Mov_id, Mov_Title, Mov_Year, Mov_Lang, Dir_id)
MOVIE_CAST (Act_id, Mov_id, Role) 
RATING (Mov_id, Rev_Stars)
‌*/


create table actor(act_id integer, act_name varchar2(20), act_gender varchar2(20), primary key(act_id));

create table director(dir_id integer, dir_name varchar2(20), dir_phone integer, primary key(dir_id));

create table movies(mov_id integer, mov_title varchar2(20), mov_year date, mov_lang varchar2(20), dir_id integer, primary key(mov_id), foreign key(dir_id) references director(dir_id));

create table movie_cast(act_id integer, mov_id integer, role varchar2(20),primary key(act_id, mov_id), foreign key(act_id) references actor(act_id), foreign key(mov_id) references movies(mov_id));

create table rating(mov_id integer, rev_stars integer, primary key(mov_id), foreign key(mov_id) references movies(mov_id));

insert into actor values(&act_id, '&act_name', '&ct_gender');
select * from actor;

insert into director values (&dir_id, '&dir_name', &dir_phone);
select * from director;

insert into movies values(&mov_id,'&mov_title', &mov_year, '&mov_lang', &dir_id);
alter table movies modify mov_year integer;
select * from movies;

insert into MOVIE_CAST values(&act_id, &mov_id,'&role');
select * from movie_cast;

insert into rating values(&mov_id, '&rev_stars');
select * from rating

select mov_title from movies where dir_id in (select dir_id from director where dir_name = 'Hitchcock');

select mov_title from movies m, movie_cast mv where m.mov_id=mv.mov_id and act_id in (select act_id from movie_cast group by act_id having count (act_id)>1) group by mov_title having count (*)>1;

select act_name, mov_title, mov_year from actor a join movie_cast c on a.act_id=c.act_id join movies m on c.mov_id=m.mov_id where m.mov_year not between 2000 and 2015;

select a.act_name, a.act_name, c.mov_title, c.mov_year from actor a, movie_cast b, movies c where a.act_id=b.act_id and b.mov_id=c.mov_id and c.mov_year not between 2000 and 2015; 

select mov_title, max (rev_stars) from movies inner join rating using (mov_id) group by mov_title having max (rev_stars)>0 order by mov_title; 

update rating set rev_stars=5 where mov_id in (select mov_id from movies where dir_id in (select dir_id from director where dir_name = 'Steven Spielberg'));
