-- The below query joins two tables on the basis of household_key. The query retrives columns that are important to understand the sales by customer earnings;
-- We have added all the transactions (SALES_VALUE) grouping by the household key. In this manner, the addition will be confined to the household_keys as opposed to everything
-- so you cannot get the individual basket values but the total  value of alll the baskets per household
Select transaction_data.household_key, SUM(transaction_data.Total_Sales) as TOT_Sales, hh_demographic.INCOME_DESC
FROM transaction_data
         Inner join hh_demographic
                    on
                        transaction_data.household_key = hh_demographic.household_key
GROUP BY transaction_data.household_key, hh_demographic.INCOME_DESC
ORDER BY TOT_Sales ;

--While we have got 2500 household_keys, we only got 801 rows because, we only have the details of the demographics of 801 household keys. So, it's fair to proceed with just these transactions 
--keeping in mind the granularity







-- Want to understand the average Basket Value per Store

SELECT
    DISTINCT STORE_ID,
             COUNT(DISTINCT BASKET_ID) AS Total_Transactions,
             AVG(SALES_VALUE) AS Average_Basket_Value
FROM
    transaction_data
GROUP BY
    STORE_ID;

--Average Basket Value per store based on unique baskets
-- This query below looks at the average basket value per store. I started writing the query above and reaised that the Average_Basket_Value is calculated on
--individual item basis.But I wanted to calculate the  unique Basket value as opposed to the individual item average. So I created a temporary table with the
--expression WITH and named it as basket totals and executed a query that calculates the total basket vale grouped by Distinct Basket ID as opposed to
-- all the basket ID's.
--::store Id was also in the group by clause because it is a non aggregated column and we are retriving it in the select statement.
-- if we don't add it in the group by, query gets confused as on what basis the aggregation must be done.::
-- Now that Basket_id's are stored as Baskets as opposed to individual values, we can use the temporary table to retrive data.

WITH BasketTotals AS (
    SELECT
        BASKET_ID,
        STORE_ID,
        SUM(SALES_VALUE) AS Total_Basket_Value
    FROM
        transaction_data
    GROUP BY
        BASKET_ID, STORE_ID
)
SELECT
    STORE_ID,
    COUNT(DISTINCT BASKET_ID) AS Total_Transactions,
    AVG(Total_Basket_Value) AS Average_Basket_Value
FROM
    BasketTotals
GROUP BY
    STORE_ID;