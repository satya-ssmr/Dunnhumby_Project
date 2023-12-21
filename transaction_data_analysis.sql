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

-- AVG
Select transaction_data.household_key, AVG(transaction_data.Total_Sales) as TOT_Sales, transaction_data.BASKET_ID, hh_demographic.INCOME_DESC
FROM transaction_data
         Inner join hh_demographic
                    on
                        transaction_data.household_key = hh_demographic.household_key
GROUP BY transaction_data.household_key, hh_demographic.INCOME_DESC, transaction_data.BASKET_ID
ORDER BY BASKET_ID DESC



-- something(the way I did not calculate the Basket size) is wrong with the above query(FIXED IT) (AVG per visit or per whole basket)
Select transaction_data.household_key, AVG(transaction_data.Total_Sales) as TOT_Sales, count(DISTINCT transaction_data.BASKET_ID) as Basket_IDS, hh_demographic.INCOME_DESC
FROM transaction_data
         Inner join hh_demographic
                    on
                        transaction_data.household_key = hh_demographic.household_key
GROUP BY  transaction_data.household_key, hh_demographic.INCOME_DESC
ORDER BY TOT_Sales


--test:  No if items per Basket for the household_key 239
Select COUNT(*) as Products_per_Basket, BASKET_ID from transaction_data where household_key = 239 GROUP BY BASKET_ID




--no_of_times_over_2_years
Select transaction_data.household_key, SUM(transaction_data.Total_Sales) as TOT_Sales, count(DISTINCT transaction_data.BASKET_ID), hh_demographic.INCOME_DESC
FROM transaction_data
         Inner join hh_demographic
                    on
                        transaction_data.household_key = hh_demographic.household_key
GROUP BY transaction_data.household_key, hh_demographic.INCOME_DESC
ORDER BY TOT_Sales

--test: to check the total transaction value with tesco over the span of 2 years) (successful)
Select sum(Total_Sales) from transaction_data where household_key = 1604 Group by household_key

--test: to check the total no of products per transaction  for the household_key 1604
Select household_key, COUNT(BASKET_ID) as product_per_transaction, BASKET_ID from transaction_data where household_key = 1604 GROUP BY household_key, BASKET_ID

--test: to check the total no of baskets per household
Select household_key, COUNT(DISTINCT BASKET_ID), SUM(Total_Sales) BASKET_ID, STORE_ID from transaction_data where household_key = 1604 GROUP BY BASKET_ID, household_key, STORE_ID

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