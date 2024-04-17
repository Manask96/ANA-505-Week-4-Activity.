#Week 4: dplyr package

#Task: Write the function to get a dataset from Base R: Titanic
#and give the dataframe a new name of your choice
#(hint: you will want your data to be a dataframe. Use the function: as.data.frame(Titanic))


get_custom_titanic_data <- function() {
  # Load Titanic dataset from Base R
  titanic <- Titanic
  
  # Convert to dataframe and assign a new name
  custom_titanic <- as.data.frame(titanic)
  
  # Return the dataframe
  return(custom_titanic)
}

# Example:
custom_titanic_data <- get_custom_titanic_data()


#See the top rows of the data
#TASK: Write the function to see the top rows of the data

view_top_rows <- function(dataframe, n = 5) {
  # Display the top 'n' rows of the dataframe
  return(head(dataframe, n))
}

# Example:
view_top_rows(custom_titanic_data)


#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr


install_and_load_dplyr <- function() {
  # Check if dplyr package is installed, if not, install it
  if (!requireNamespace("dplyr", quietly = TRUE)) {
    install.packages("dplyr")
  }
  
  # Load the dplyr package
  library(dplyr)
}

# Function to call dplyr package
call_dplyr <- function() {
  # Call the function to install and load dplyr
  install_and_load_dplyr()
  
  # Return a message indicating that dplyr is loaded
  return("dplyr package is now loaded.")
}

# Example:
call_dplyr()



#Let's just see the Survived and Sex columns
#Task: Write the function to 'select' the Survived and Sex columns 
#(hint: use the 'select' function)


select_columns <- function(dataframe) {
  # Call the function to install and load dplyr package
  install_and_load_dplyr()
  
  # Select only the "Survived" and "Sex" columns
  selected_data <- select(dataframe, Survived, Sex)
  
  # Return the selected columns
  return(selected_data)
}

# Example:
selected_columns_data <- select_columns(custom_titanic_data)
head(selected_columns_data)



#Let's name the dataset with just the two columns, Survived and Sex
#TASK: Write the function to save the two columns as one new dataset
#and give it a name


save_selected_data <- function(dataframe, new_name) {
  # Save the dataframe with selected columns as a new dataset with the specified name
  assign(new_name, dataframe, envir = .GlobalEnv)
  
  # Return a message indicating that the dataset is saved with the new name
  return(paste("Dataset", new_name, "is saved."))
}

# Example:
save_selected_data(selected_columns_data, "survived_sex_data")


#Let's rename a column name
#TASK: Write the function that renames 'Sex' to 'Gender'



rename_column <- function(dataframe, old_name, new_name) {
  # Call the function to install and load dplyr package
  install_and_load_dplyr()
  
  # Rename the column
  renamed_data <- rename(dataframe, {{new_name}} := {{old_name}})
  
  # Return the dataframe with the renamed column
  return(renamed_data)
}

# Example:
data_with_renamed_column <- rename_column(survived_sex_data, "Sex", "Gender")
head(data_with_renamed_column)



#Let's make a new dataframe with the new column name
#TASK: Write the function that names a new dataset that includes the 'gender' column

create_new_dataset <- function(dataframe, new_name) {
  # Call the function to install and load dplyr package
  install_and_load_dplyr()
  
  # Rename the column to "Gender"
  renamed_data <- rename(dataframe, Gender = Sex)
  
  # Save the dataframe with the new name
  assign(new_name, renamed_data, envir = .GlobalEnv)
  
  # Return a message indicating that the new dataset is created and saved
  return(paste("New dataset", new_name, "is created and saved."))
}

# Example:
create_new_dataset(survived_sex_data, "new_dataset_with_gender")



#Let's 'filter' just the males from our dataset
#TASK: Write the function that includes only rows that are 'male'

filter_male <- function(dataframe) {
  # Call the function to install and load dplyr package
  install_and_load_dplyr()
  
  # Filter only rows where Gender is male
  filtered_data <- filter(dataframe, Gender == "male")
  
  # Return the filtered dataframe
  return(filtered_data)
}

# Example:
males_data <- filter_male(new_dataset_with_gender)
head(males_data)


#Let's 'arrange' our data by gender (not the data you just filtered)
#TASK: Write the function to group the data by gender (hint: arrange())


arrange_by_gender <- function(dataframe) {
  # Call the function to install and load dplyr package
  install_and_load_dplyr()
  
  # Arrange the data by Gender
  arranged_data <- arrange(dataframe, Gender)
  
  # Return the arranged dataframe
  return(arranged_data)
}

# Example:
arranged_data_by_gender <- arrange_by_gender(new_dataset_with_gender)
head(arranged_data_by_gender)


#Let's see how many people were examined in the dataset (total the frequency in the original dataframe)
#TASK: Sum the Freq column
#TASK: After you run it, write the total here: 0


total_people_examined <- sum(survived_sex_data$Freq)
print(total_people_examined)



#Since we have a males dataset, let's make a females dataset
#TASK: Write the function that includes only rows that are 'female'

filter_female <- function(dataframe) {
  # Call the function to install and load dplyr package
  install_and_load_dplyr()
  
  # Filter only rows where Gender is female
  filtered_data <- filter(dataframe, Gender == "female")
  
  # Return the filtered dataframe
  return(filtered_data)
}

# Example:
females_data <- filter_female(new_dataset_with_gender)
head(females_data)


#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')


join_male_female <- function(male_data, female_data) {
  # Call the function to install and load dplyr package
  install_and_load_dplyr()
  
  # Concatenate male and female datasets
  joined_data <- bind_rows(male_data, female_data)
  
  # Return the concatenated dataframe
  return(joined_data)
}

# Example:
joined_data <- join_male_female(males_data, females_data)
head(joined_data)






