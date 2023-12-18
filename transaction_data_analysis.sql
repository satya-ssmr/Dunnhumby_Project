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