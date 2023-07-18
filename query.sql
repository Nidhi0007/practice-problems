-- Create a new database called "dummy_db" and a table called "users" with columns: "id" (INT), "name" (VARCHAR), and "age" (INT). Insert two rows of dummy data into the "users" table. Create another table called "orders" with columns: "id" (INT), "user_id" (INT), and "product" (VARCHAR). Insert some dummy data into the "orders" table.

create table user (id integer, name varchar(100), age varchar(100));
create table orders (id integer, user_id INT, product varchar(100));

INSERT INTO users (id, name, age) VALUES
    (1, 'John', 25),
    (2, 'Jane', 31),
    (3, 'Shyam', 34),
    (4, 'RAM', 30),
    (5, 'Joe', 52);

INSERT INTO orders (id, user_id, product) VALUES (1, 1, 'Product A'), (2, 2, 'Product B'), (3, 1, 'Product C'),(3,3, 'Product D')
	
--1.  Updating Data: Update the age of the user with id=1 to 30
    Update users  set age=30 where id=1


-- 2. Deleting Data: Delete all users with an age greater than 40 from the "users" table.

    delete from users where age > 40


--3.  Data Filtering: Retrieve the names of users whose age is between 25 and 35.
SELECT * from users where age >25 AND age<35;
--4. Data Sorting: Display the names of users in alphabetical order.
SELECT name from users order by name asc;

--5 Data Aggregation: Calculate the average age of all users.
select Avg(age) as averageAge from users;
    --6 Joining Tables: Write a query to retrieve the names of users who have placed orders.?

select u.name from users u inner join orders o on u.id = o.user_id;

    --7 Grouping and Aggregation: Calculate the total number of orders placed by each user.

select count(*), u.name from orders o inner join users u on u.id= o.user_id group by u.name;

    --8 : Write a query to retrieve the names of users who have placed more than 3 orders.

select u.name , count(o.id) as count from users u inner join orders o on u.id=o.user_id group by u.name HAVING o.count < 3 ; 

-- 9. Subqueries: Write a query to retrieve the names of users who have not placed any orders.
SELECT name from users WHERE users.id NOT IN (SELECT user_id from orders)



-- 10 Adding Another Table: Create a table called "order_details" with columns: "id" (INT), "order_id" (INT), "product_name" (VARCHAR), and "price" (DECIMAL). Insert some dummy data into the "order_details" table.

CREATE TABLE order_details ( id INT, order_id INT, product_name VARCHAR, price DECIMAL)


INSERT INTO order_details (id, order_id, product_name, price) VALUES
    (1,1, 'soap', 25),
    (2,2, 'mobile', 31),
    (3,3, 'laptop', 34),
    (4,1 ,'keys', 30),
    (5, 2,'bottle', 52);

    -- Join Operations: Write a query to retrieve the names of users along with their order details.
    select u.name, od.id, od.order_id, od.product_name, od.price from users as u inner join orders as o on u.id =o.user_id 
    inner join order_details as od on o.id =od.order_id

    -- Finding the Last 5 Orders: Retrieve the details of the 5 most recent orders, including the user's name and the order details.

 
    SELECT * from (SELECT * FROM Orders ORDER BY ID DESC LIMIT 2) AS lasts  INNER JOIN users as u on lasts.user_id=u.id INNER join order_details od on od.order_id =lasts.id;


    -- Retrieving n+1 Orders using Joins: Given a specific order ID, write a query to retrieve the user's name, order details, and the next order's details based on the order ID.