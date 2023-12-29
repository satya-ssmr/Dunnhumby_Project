empty_counts = {}

for col in products_data.columns:

    # Initialize count for each column
    count = 0

    for val in products_data[col]:

        # Check if value is string
        if isinstance(val, str):

            # Strip whitespace and check for empty
            if not val.strip():

                # Increment count
                count += 1

    # Save count for column
    empty_counts[col] = count

# Print results
print(empty_counts)

