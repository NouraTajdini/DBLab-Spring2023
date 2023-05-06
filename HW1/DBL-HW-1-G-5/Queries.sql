
CREATE TABLE DINING_HALL (
HallID serial not null ,
HallName varchar(255),
Address text,
Capacity int,
Active boolean,
primary key (HallID)
);

INSERT INTO DINING_HALL (HallName, Address, Capacity, Active)
	VALUES ('سلف مرکزی','دانشگاه گیلان، جاده تهران', 100, true);
    
    
INSERT INTO DINING_HALL (HallName, Address, Capacity, Active)
	VALUES('سلف علوم پایه','دانشگاه گیلان، منظریه ', 50, true);

INSERT INTO DINING_HALL (HallName, Address, Capacity, Active)
	VALUES('سلف تربیت بدنی ','دانشگاه گیلان، جاده تهران ', 30, false);
    
SELECT * FROM dining_hall;


CREATE TABLE FOOD (
	FoodID serial not null,
    Name varchar(255),
    Price int,
    Description text,
    primary key (FoodID)
    );
    
INSERT INTO FOOD (Name, Price, Description)
	VALUES ('قیمه', 15000, 'به همراه ماست');
    
INSERT INTO FOOD (Name, Price, Description)
	VALUES ('کتلت', 65000, 'به همراه ترشی');

INSERT INTO FOOD (Name, Price, Description)
	VALUES ('سبزی پلو با ماهی', 25000, 'ماهی سفید');
    
select * from FOOD;




CREATE TABLE STUDENT (
	StudentId serial not null,
    Name varchar(255),
    Balance int default 0,
    Phone varchar(20),
    primary key (StudentID)
);

INSERT INTO STUDENT (Name, Phone)
	Values('امیرمحمد فلاح', '09123456789');
    
INSERT INTO STUDENT (Name, Phone)
	Values('John Doe', '09123456790');
    
SELECT * FROM STUDENT;

UPDATE STUDENT
SET Balance=10000
WHERE StudentId=1;




CREATE DOMAIN meal_type varchar(20)
CHECK (
    VALUE IN ('breakfast', 'lunch', 'dinner')
);

create table menu_item (
	ItemID serial not null,
	HallID int,
	FoodID int,
	totalQTY int not null,
	MealType meal_type,
	ServeDate date,
	PRIMARY KEY(ItemId),
	FOREIGN KEY(HallID) REFERENCES dining_hall(HallID),
	FOREIGN KEY(FoodID) REFERENCES food(FoodID)
	);
	
insert into menu_item (HallID, FoodID, totalQTY, MealType, ServeDate)
values (1,1,100,'lunch','2023-01-20');

insert into menu_item (HallID, FoodID, totalQTY, MealType, ServeDate)
values (2,2,100,'lunch','2023-01-21');

insert into menu_item (HallID, FoodID, totalQTY, MealType, ServeDate)
values (3,3,50,'lunch','2023-01-21');


select * from menu_item;

select * from menu_item
inner join dining_hall on dining_hall.hallid = menu_item.hallid
inner join food on food.foodid = menu_item.foodid;



create table reserved_food (
	ReservID serial not null,
	StudentID int not null,
	ItemID int not null,
	PRIMARY KEY(ReservID),
	FOREIGN KEY(StudentID) REFERENCES student(StudentID),
	FOREIGN KEY(ItemID) REFERENCES menu_item(ItemID)
	);
	
insert into reserved_food (StudentID, ItemID)
values (1,1);

select * from reserved_food;

select mealtype, student.name, servedate, food.name, dining_hall.hallname from reserved_food
inner join menu_item on menu_item.itemid = reserved_food.itemid
inner join food on menu_item.foodid = food.foodid
inner join student on reserved_food.studentid = reserved_food.studentid
inner join dining_hall on menu_item.hallid = dining_hall.hallid
where student.studentid=1 and mealtype='lunch' and servedate='2023-01-20';


select count(*) from menu_item
where hallid=1 and mealtype='lunch' and servedate='2023-01-20';


