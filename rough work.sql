"""
Created on Wed Dec 13 23:44:50 2023

@author: Satya
"""

'''
Data Cleaning is an extremely important job. It consists of defining the right
 data types and finding out the null values.
After Data Cleaning We can start understanding the main file from the datasets

Why the main file?
Let me explain it by the dataset I am analysing.

The file we will be analysing is the transaction_data of the retail giant Tesco
First  step: Understand the Data

SELECT * FROM transaction_data ;

This query displays all the tables in the table transaction_data. But we d


SELECT * FROM transaction_data order by DAY ;


Select TOP 5 QUANTITY, SALES_VALUE, Total_Sales, household_key, BASKET_ID, PRODUCT_ID from transaction_data order by Total_Sales desc ;
This query displays the top 5 rows of the table transaction_data in descending order of Total_Sales.


'''