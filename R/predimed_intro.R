# Note: anything after the pound sign (#) is a comment
# and therefore won't be executed by the program.  

# First things first: 
# Click the Import Dataset button under the Environment tab at right.
# Use it to import the data in predimed.csv
# Make sure that:
# - You use "From Text (base)"
# - You check "Yes" next to Heading

# Let's get a summary for all the variables in the data set
summary(predimed)

# Let's make a table for event versus diet group
# xtabs means "cross tabulate" and the tilde (~) means "by"
# This says "cross-tabulate the predimed data by group and event" 
xtabs(~group + event, data=predimed)

# Use this table to estimate:
#  P(event | Control diet)
#  P(event | any MedDiet)  

