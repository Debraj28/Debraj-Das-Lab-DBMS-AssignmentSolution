CREATE DEFINER=`root`@`localhost` PROCEDURE `supp_rating`()
BEGIN
select supplier.supp_id, supplier.supp_name, rating.rat_ratstars,
case
when rating.rat_ratstars > 4 THEN 'Genuine Supplier'
when rating.rat_ratstars > 2 THEN 'Average Supplier'
Else 'Supplier not to be considered'
end as verdict from rating inner join supplier on rating.supp_id = supplier.supp_id;
END