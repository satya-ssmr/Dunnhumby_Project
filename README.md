# Dunnhumby_Project

# First Commit

Transaction data analysis: data dictionary

In this transaction data, there is a **SALES_VALUE** column. It has the values
per quantity, not the total sum of the quantities.
So, while calculating the total value for the households it is important
to look at the total value as opposed to just adding the SALES_VALUE as I did 

_```WITH BASKETSALES AS
(
SELECT
BASKET_ID, household_key as household_id,
SUM(SALES_VALUE) AS Basket_Sales
FROM transaction_data
GROUP BY
BASKET_ID, household_key

	)
SELECT *
FROM BASKETSALES
ORDER BY Basket_Sales, household_id DESC, BASKET_ID;


SELECT
household_key as h,
SUM(SALES_VALUE) AS Total_Household_Sales
FROM transaction_data
GROUP BY household_key
ORDER BY Total_Household_Sales DESC, h;

SELECT SUM(SALES_VALUE) FROM transaction_data WHERE household_key = '1023';
SELECT * FROM transaction_data WHERE household_key='1023'


SELECT household_key as h, COUNT(DISTINCT BASKET_ID) AS NO_of_Baskets
FROM transaction_data
GROUP BY household_key
ORDER BY NO_of_Baskets DESC;
```_
So All the above queries are wrong.
