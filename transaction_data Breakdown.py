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

'''
import pandas as pd
Reading_data_transaction = pd.read_csv('transaction_data.csv')
print(Reading_data_transaction.info()) #Gives the information about the datatypes and missing values
print(Reading_data_transaction.head()) #Top 5 rows view of the data

#%%
