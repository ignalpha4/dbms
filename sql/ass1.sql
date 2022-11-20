create database practical;
use practical;

/*  table creation book */
create table BOOK(
Book_ISBN  int not null primary key, 
Title varchar(20) not null, 
Publisher_Name varchar(30), 
price int check (price>0), 
Date_Of_Publication date,
Book_Copy int
);

desc BOOK;

/*  table creation book authors */

create table BOOK_AUTHORS (Book_ISBN int ,
FOREIGN KEY(BOOK_ISBN) REFERENCES BOOK(BOOK_ISBN),
Author_Name varchar(30) NOT NULL primary key,
Author_City varchar(30)
); 



/*value insertion into book table */

desc BOOK_AUTHORS;

insert into BOOK values(1,'wings of fire','nirali',200,'2014-01-12',5);

insert into BOOK values(2,'Sherlock holmes','techneo',400,'2007-02-14',1);

insert into BOOK values(4,'rich dad poor dad','techknowledge',100,'2019-01-22',12);

select * from book;

/*value insertion into author table */

insert into book_authors values(1,'dr apj abdul kalam','rameshwaram');
insert into book_authors values(2,'RDJ','USA');
insert into book_authors values(4,'shubham','baramati');

select * from book_authors;


/* A) Create view BOOK_AUTHOR_INFO consisting Book_ISBN, Title from 
BOOK Table and Author_Name from BOOK_AUTHORS Table in ascending 
order of ISBN no.*/

create view book_author_info(Book_ISBN,title,Author_Name) as 
select b.Book_ISBN,b.title,a.Author_Name
FROM book b,book_authors a
where b.book_isbn=a.book_isbn
ORDER BY Book_ISBN asc;


select * from book_author_info;

/* B)Create an index on Book_Author on table on attribute “Author_Name”*/

create index author_name on book_authors(Author_name);

show index from book_authors;

/* C) Create table Book_Auto_Increment (BookID int Auto_increament=100, Book 
Name) insert five records in table.*/

Create table Book_Auto_Increment (BookID  int NOT NULL primary key  AUTO_INCREMENT,
Book_Name varchar(40)
);

ALTER TABLE Book_auto_increment AUTO_INCREMENT=100;

insert into Book_Auto_Increment(Book_Name) values('harry potter 1');
insert into Book_Auto_Increment(Book_Name) values('harry potter 2');
insert into Book_Auto_Increment(Book_Name) values('harry potter 3');

select * from Book_Auto_Increment;

drop table Book_auto_increment;

/*  d) Delete the book from Book table written by Author ‘Korth’ (not working)'*/

delete book from BOOK INNER JOIN book_authors ON book.book_isbn=book_authors.book_isbn  where book_authors.author_name='RDJ';


/* e) Select Book Names from table Book whose copies are in between 10 to 15.*/

select title from book where Book_copy BETWEEN 10 AND 15;


/******************************************* 1 Part B ***************************************/

/* a) Select Book_ISBN, Title, Author_Name from relations Book and Book_Authors 
INNER JOIN on attribute Book_ISBN.*/


select book.book_isbn,book.title,book_authors.Author_Name
from book
INNER JOIN book_authors ON book.book_isbn=book_authors.book_isbn;

/*	b) Select Book_ISBN, Title, Publisher, Author_Name from relations Book and 
Book_Authors LEFT OUTER JOIN on attribute Book_ISBN	*/

select book.book_isbn,book.title,book.Publisher_Name,book_authors.author_name
from book
LEFT OUTER JOIN book_authors ON book.book_isbn=book_authors.book_isbn;

/* c) Select Book_ISBN, Title, Publisher, Author_Name from relations Book and 
Book_Authors RIGHT OUTER JOIN on attribute Book_ISBN */

select book.book_isbn,book.title,book.Publisher_Name,book_authors.author_name
from book
RIGHT OUTER JOIN book_authors ON book.book_isbn=book_authors.book_isbn;

/* d) Select Book_ISBN, Title from relation Book whose author is living in City 
=’Baramati’. */

select b.book_isbn,b.title 
from book b,book_authors a where  b.book_isbn=a.book_isbn AND a.Author_City='Baramati';

/* e) Select Book_ISBN, Title from relation Book, which written by more than 2  Authors */

select book_isbn,title from book ;

/*----------------TYPE 3 -------------------*/

/* i) Display name of publishers as per no of books published by them in 
ascending order. */

select publisher_name from book group by publisher_name order by count(publisher_name);

/* ii) Get publisher names who published at least one book written by author name like ‘K%’ */

select Publisher_Name
from book b,book_authors a
where a.author_name like 'k%' and b.Book_ISBN=a.Book_ISBN;

/* iii) Get book name and Authors names where book written by maximum authors (wrong output)*/

select b.title,a.author_name 
from book b,book_authors a 
where b.Book_ISBN=a.Book_ISBN
group by b.Book_ISBN
having max(b.Book_ISBN);

/* iv)Get publisher names accordingly books published alphabetically*/

select publisher_name ,title
from book 
order by title asc ;

/*v) Find the no of books published in 01 Jan 2014 to till date.*/
 select count(title) 
 from book
 where date_of_publication 
 between '2014-01-01' and current_date();
 
 
 
 