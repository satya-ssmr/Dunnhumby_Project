# -*- coding: utf-8 -*-
"""
Created on Wed Dec 13 23:44:50 2023

@author: Murth
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
import pandas as pd
Reading_data_transaction = pd.read_csv('transaction_data.csv')
print(Reading_data_transaction.info()) #Gives the information about the datatypes and missing values
print(Reading_data_transaction.head()) #Top 5 rows view of the data
print(Reading_data_transaction.describe(include='all')) #Gives the statistical summary of the data


# Average sales value per basket
avg_sales_per_basket = Reading_data_transaction.groupby('BASKET_ID')['SALES_VALUE'].sum()
print(avg_sales_per_basket)

import matplotlib.pyplot as plt
import seaborn as sns

# Visualising the distribution of sales values
sns.histplot(Reading_data_transaction['SALES_VALUE'], kde=True)
plt.title('Distribution of Sales Value')
plt.show()

import matplotlib.plt as plt
import seaborn as sns

sns.scatterplot(x="BASKET_ID", y="SALES_VALUE", hue="household_key",
                data=Reading_data_transaction)
plt.title('Sales Value by Basket ID and Household Key')
plt.show()
