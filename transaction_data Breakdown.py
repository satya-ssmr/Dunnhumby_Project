# -*- coding: utf-8 -*-

'''Simple, we can manipulate dataframes using pandas. dataframes are 2D arrays
like spreadsheets or csv files.
To perform the data analysis we must load the files or the datasets onto dataframes.
Here I have created a dataframe called Reading_data_transaction.
 pd.read_csv() reads the file and loads it into a pandas dataframe Reading_data_transaction'''
import pandas as pd
Reading_data_transaction = pd.read_csv('transaction_data.csv')
Reading_data_transaction_demo = pd.read_csv('hh_demographic.csv')
Reading_data_transaction_prod = pd.read_csv('product.csv')
print(Reading_data_transaction_demo.head())
print(Reading_data_transaction_prod.head())
print(Reading_data_transaction.head()) #Top 5 rows view of the data
print(Reading_data_transaction.info()) #Gives the information about the datatypes and missing values
print(Reading_data_transaction_demo.info())
print(Reading_data_transaction_prod.info())


print(transactions_data.isnull().count())




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




merged = Reading_data_transaction.merge(Reading_data_transaction_prod, on='PRODUCT_ID')

sales_by_category = merged.groupby('COMMODITY_DESC')['SALES_VALUE'].sum()

#%%
