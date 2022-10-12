# Transforming and Cleaning IoT Data

In this activity, you’ll combine your skills in data transformation (using Python and Pandas methods) with those in regex to transform an internet of things (IoT) dataset.

## Instructions

1. Note that by using the provided starter code, you'll transform and clean the `temperature_data.csv` dataset to create a DataFrame with the appropriate data types for each column, as the following image shows:

    ![A screenshot depicts the final IoT temperature DataFrame.](../../Images/01-final_transformed_cleaned_DataFrame.png)

2. To do so, complete the following steps:

    * Read the `temperature_data.csv` file into a DataFrame, using `sep=","` as the delimiter and `header=None`.

    * Convert the JSON string data to a Python dictionary, and then do the following:

      * Create two lists: one for the keys and one for the values.

      * Iterate through the row data in the DataFrame.

      * Convert each row of JSON string data to a Python dictionary.

      * Use a list comprehension to get the keys from the Python dictionary.

      * Use a list comprehension to get the values from the Python dictionary.

      * Append the keys and values to the lists that you previously created.

    * Create a new DataFrame by using the keys as the columns and the nested list of row values as the data.

    * Use regular expressions and the `extract()` function to do the following:

      * Extract the day of the week from the "timestamp" column, and add it to a new column.

      * Extract the date from the "timestamp" column, and add it a new column.

      * Extract the time of day from the "timestamp" column, and add it to a new column.

    * Convert the "date" to the following format: `%Y-%m-%d`, and then convert the date to a `datetime64[ns]` format.

    * Drop the "timestamp" column, and then reorder the columns to get the required DataFrame, as the following image shows.

      ![A screenshot depicts the final IoT temperature DataFrame.](../../Images/01-final_transformed_cleaned_DataFrame.png)

      In the preceding image, notice that the columns appear in the following order: "device", "timestamp", "temperature", "pressure", "humidity".

---

© 2022 Trilogy Education Services, LLC, a 2U, Inc. brand.  Confidential and Proprietary.  All Rights Reserved.
