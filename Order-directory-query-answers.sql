-- 3) Display the number of the customer group by their genders who have placed any order of amount greater than or equal to Rs.3000.

select * from orders;
select * from customer inner join orders on orders.CUS__ID=customer.CUS__ID;
select cg.cus_gender, COUNT(cus_gender) from (select cus_gender from customer c inner join `orders` o on o.CUS__ID=c.CUS__ID where o.ORD_AMOUNT>=3000) as cg group by cus_gender;

-- 4) Display all the orders along with the product name ordered by a customer having Customer_Id=2.

select * from orders where CUS__ID = 2;
select o.ORD_ID, o.ORD_AMOUNT, o.DATE, p.PRO_ID, p.PRO_NAME from orders o inner join product p on p.PRO_ID = o.PROD_ID and CUS__ID = 2;

-- 5) Display the Supplier details who can supply more than one product.

select * from supplier;
select * from product;
select * from productdetails;
select * from supplier where SUPP_ID in (select SUPP_ID from productdetails GROUP BY SUPP_ID HAVING COUNT(PROD_ID) > 1);

-- 6) Find the category of the product whose order amount is minimum.

select c.CAT_NAME from product p inner join category c on c.CAT_ID = p.CAT_ID where p.PRO_ID in (select PROD_ID from orders where ORD_AMOUNT = (select MIN(ORD_AMOUNT) from orders));

-- 7) Display the Id and Name of the Product ordered after “2021-10-05”.

select * FROM orders where DATE > '2021-10-05';
select PRO_ID, PRO_NAME from product p inner join orders o on o.PROD_ID = p.PRO_ID where o.DATE > '2021-10-05';

-- 8) Print the top 3 supplier name and id and their rating on the basis of their rating along with the customer name who has given the rating.

select supplier.supp_id, supplier.supp_name, customer.cus_name, rating.rat_ratstars from rating inner join supplier on rating.supp_id = supplier.supp_id inner join customer on rating.cus__id = customer.cus__id order by rating.rat_ratstars desc limit 3;

-- 9) Display customer name and gender whose names start or end with character 'A'.

select * from customer where CUS_NAME like 'A%' or CUS_NAME like '%A';

-- 10) Display the total order amount of the male customers.

select sum(ord_amount) from orders o inner join customer c on c.cus__id = o.cus__id where c.cus_gender='M';

-- 11) Display all the Customers left outer join with the orders.

select customer.cus_name from customer LEFT JOIN orders ON customer.cus__ID = orders.cus__ID ORDER BY customer.cus_name;

-- 12) Create a stored procedure to display the Rating for a Supplier if any along with the Verdict on that rating if any like if rating >4 then “Genuine Supplier” if rating >2 “Average Supplier” else “Supplier should not be considered”.

call supp_rating();