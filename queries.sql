--1
SELECT SUM(sub.Tot_Price) as Tot_Sell, SUM(sub.ctr) as count, 'sport' AS type
  FROM (
        SELECT product.ID AS ID, product.Price*cart_content.Count as Tot_Price, cart_content.Count as ctr
  FROM (product JOIN cart_content)
  WHERE product.ID = cart_content.Product_ID
       ) sub JOIN sport_product
WHERE sub.ID = sport_product.Product_ID
UNION
SELECT SUM(sub.Tot_Price), SUM(sub.ctr) as count, 'home' AS type
  FROM (
        SELECT product.ID AS ID, product.Price*cart_content.Count as Tot_Price, cart_content.Count as ctr
  FROM (product JOIN cart_content)
  WHERE product.ID = cart_content.Product_ID
       ) sub JOIN home_product
WHERE sub.ID = home_product.Product_ID
UNION
SELECT SUM(sub.Tot_Price), SUM(sub.ctr) as count, 'digital' AS type
  FROM (
        SELECT product.ID AS ID, product.Price*cart_content.Count as Tot_Price, cart_content.Count as ctr
  FROM (product JOIN cart_content)
  WHERE product.ID = cart_content.Product_ID
       ) sub JOIN product
WHERE sub.ID = product.ID AND NOT EXISTS (SELECT product_ID
                                                 FROM home_product
                                                 WHERE product.ID = home_product.Product_ID) AND
                                                 NOT EXISTS (SELECT product_ID
                                                 FROM sport_product
                                                 WHERE product.ID = sport_product.Product_ID)

--2
SELECT person.Fname, registered_customer.registerDate
FROM registered_customer JOIN customer JOIN person
WHERE registered_customer.Customer_ID = customer.ID and customer.Person_ID = person.ID

--3
SELECT Fname, Lname, UserName
FROM Employee NATURAL JOIN customer NATURAL JOIN person
WHERE Employee.Company_ID = '2'

--4
SELECT delivery.ID as shenase, customer.UserName, purchase.DateTime, person_address.Address, delivery.dateDelivered
FROM driver JOIN delivery JOIN purchase JOIN cart JOIN customer JOIN person JOIN person_address
WHERE driver.ID = delivery.Driver_ID AND delivery.Purchase_ID = purchase.ID AND purchase.ID = cart.Purchase_ID AND
  customer.ID = cart.Customer_ID AND customer.Person_ID = person.ID AND
  person.ID = person_address.Person_ID AND delivery.dateDelivered > NOW() - INTERVAL 1 MONTH
GROUP BY driver.ID

--5
SELECT *
FROM deleted_registered_customer

--6
SELECT AVG(product_Rating.Rating), product_Rating.product_ID
FROM product_Rating join sport_product
WHERE product_Rating.Product_ID = sport_product.product_ID
GROUP BY product_Rating.product_ID

--7
SELECT *
FROM Operator
WHERE Operator.HireDate > NOW() - INTERVAL 1 MONTH
GROUP BY Operator.Company_ID

--8
SELECT purchase.ID as codeRahgiri, purchase.DateTime, person.Fname, person.Lname, customer.UserName
FROM purchase join cart join customer join person
WHERE purchase.id = cart.id AND purchase.type = true AND customer.ID = cart.Customer_ID AND person.ID = customer.Person_ID
GROUP BY customer.ID

--9
SELECT Status_Support.Support_ID as ID, Chat.ChatDate
FROM Status_Support join Chat
WHERE Chat.Support_ID = Status_Support.Support_ID
GROUP BY Chat.ChatDate

--10
SELECT product.Name, product.Product_Code, product.Discount, (product.Price*((100 - product.Discount) / 100)) as newPrice, 'Home' AS type
FROM product join home_product
WHERE product.ID = home_product.Product_ID AND product.Discount > 0
UNION
SELECT product.Name, product.Product_Code, product.Discount, (product.Price*((100 - product.Discount) / 100)) as newPrice, 'Sport' AS type
FROM product join sport_product
WHERE product.ID = sport_product.Product_ID AND product.Discount > 0
UNION
SELECT product.Name, product.Product_Code, product.Discount, (product.Price*((100 - product.Discount) / 100)) as newPrice, 'Digital' AS type
FROM product
WHERE NOT EXISTS (SELECT product_ID
                  FROM home_product
                  WHERE product.ID = home_product.Product_ID) AND
                  NOT EXISTS (SELECT product_ID
                  FROM sport_product
                  WHERE product.ID = sport_product.Product_ID) AND product.Discount > 0

--11
SELECT Status_Support.Status_DateTime as TimeStamp, Status_Support.Support_ID
FROM Status_Support
WHERE Status_Support.Status_DateTime > NOW() - INTERVAL 1 MONTH
GROUP BY Status_Support.Support_ID

--12
SELECT Sum(purchase.TotalPrice) as Income
FROM purchase
WHERE purchase.DateTime > NOW() - INTERVAL 2 MONTH

--13
SELECT Sum(purchase.Tax) as Tax
FROM purchase
WHERE purchase.DateTime > NOW() - INTERVAL 1 MONTH

--14
SELECT (registered_customer.Credit/10) as Gift, registered_customer.Customer_ID
FROM registered_customer  
GROUP BY registered_customer.Customer_ID

--15
SELECT person.Fname, person.Lname, 'not Registered' as type
FROM cart_content join cart join customer join person
WHERE cart_content.Product_ID = 2 and cart_content.cart_ID = cart.ID and cart.Customer_ID = customer.ID and customer.Person_ID = person.ID and
  NOT EXISTS (SELECT registered_customer.Customer_ID
              FROM registered_customer
              WHERE registered_customer.Customer_ID = customer.ID)
UNION
SELECT person.Fname, person.Lname, 'Registered' as type
FROM cart_content join cart join customer join person join registered_customer
WHERE cart_content.Product_ID = 2 and cart_content.cart_ID = cart.ID and cart.Customer_ID = customer.ID and customer.Person_ID = person.ID and
  registered_customer.Customer_ID = customer.ID

--16
SELECT product.Product_Code, product.Name, product.Count
FROM home_product join product
WHERE home_product.Product_ID = product.ID

--17
SELECT Sum(purchase.TotalPrice)
FROM Employee_Purchase join purchase
WHERE Employee_Purchase.Purchase_ID = purchase.ID and purchase.DateTime > NOW() - INTERVAL 1 MONTH

