empty_cols = products_data.columns[products_data.isnull().all()]
print(len(empty_cols))



print(products_data.info())
print(products_data.isnull().sum)
#count the no of FALSE cells in CURR_SIZE_OF_PRODUCT


empty_count = 0
for val in products_data['CURR_SIZE_OF_PRODUCT']:
    if not val.strip():
        empty_count += 1


print(empty_count)