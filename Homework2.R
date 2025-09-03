
## Task 1

## 1 Create two vectors. One vector corresponding to the pre measurements and one to the post measurements.
pre_treat   <-c(120,151,125,126,115,132,132,129,134,139,127,122,127,135,133,128,147,138,140,132)
after_treat <- c(127,145,135,122,115,122,123,126,126,129,132,146,120,114,121,120,128,120,133,115)

## 2) Assign names to the vector elements using the paste() function. Note that names() can be overwritten by a character vector.
subj_names <- paste("Subject", 1:20, sep = "_")
names(pre_treat)   <- subj_names
names(after_treat) <- subj_names

## 3) Calculate the change in blood pressure for each patient by subtracting post-treatment measurements from pre-treatment measurements. Recall that R does math element-wise! Save this calculation as a new object in R (also a vector). 
change_bp <- pre_treat - after_treat

## 4) Calculate the average decrease in blood pressure across all patients. Use the mean() function here! 
avg_decrease_bp <- mean(change_bp)

## 5) Determine which patients experienced a decrease in blood pressure after treatment (a positive change). Use the which() function to just return the indices (and names) associated with this type of change. 
patients_decrease <- which(change_bp > 0)
names(change_bp)[patients_decrease]

## 6) Subset the vector of differences to only return those that have a positive change. (Note that you don’t need the which() function here. A Boolean used as an indexing vector returns only indices were a TRUE occurred.) 
pos_changes <- change_bp[change_bp > 0]

## 7) Calculate the average decrease in blood pressure for those where the blood pressure decreased (positive change).
patients_decrease <- which(change_bp > 0)
avg_decrease_pos <- mean(pos_changes)


## Task 2: Basic Data Frame practice

## 1. Create a data frame object with four columns corresponding to your data above: patient, pre_bp, post_bp, and diff_bp
bp_df <- data.frame(
  patient = names(pre_treat),
  pre_bp  = pre_treat,
  post_bp = after_treat,
  diff_bp = pre_treat - after_treat
)

## 2. Return only rows of the data frame where the diff_bp column is negative. (Use [ or learn about the subset() function if you’d like. If you use [, don’t reference the original vector from the first part, access the column of the data frame to make your comparison with 0.)
bp_df_neg <- bp_df[bp_df$diff_bp < 0, ]

## 3. Add a new column to the data frame corresponding to TRUE if the post_bp is less than 120 and FALSE if it is not. Similar to the previous question, don’t reference the original vector from task 1, access the column of the data frame to make your comparison. Recall you can use $ to access a column. If you reference a column that doesn’t exist and save a vector (of appropriate length in it), that vector becomes a column of your data frame! Use this way of creating the new column.
bp_df$below_120 <- bp_df$post_bp < 120

## 4. Finally, print the data frame out nicely in your final document by modifying the code below appropriately.
knitr::kable(bp_df)


## Task 3: List practice

## Placebo data (subjects 1–10)
pre_placebo   <- c(138,135,147,117,152,134,114,121,131,130)
after_placebo <- c(105,136,123,130,134,143,135,139,120,124)

## 1. Create a new data frame with this data in it that is similar to the data frame from task 2 (including the new column of TRUE/FALSE values).
subj_names_pbo <- paste("Subject", 1:10, sep = "_")
names(pre_placebo)   <- subj_names_pbo
names(after_placebo) <- subj_names_pbo
placebo_df <- data.frame(
  patient = names(pre_placebo),
  pre_bp  = pre_placebo,
  post_bp = after_placebo,
  diff_bp = pre_placebo - after_placebo
)
placebo_df$below_120 <- placebo_df$post_bp < 120

## 2. Create and store a list with two elements: 1st element named treatment contains the first data frame (bp_df) from task 2. 2nd element named placebo contains the second data frame you just created.
bp_list <- list(
  treatment = bp_df,
  placebo   = placebo_df
)

## 3. Access the first list element using three different types of syntax
first_elem_a <- bp_list[1]            # returns a list of length 1
first_elem_b <- bp_list[[1]]          # returns the data frame
first_elem_c <- bp_list$treatment     # returns the data frame

## 4. In one line, access the pre_bp column of the placebo data frame
pre_bp_placebo <- bp_list$placebo$pre_bp
