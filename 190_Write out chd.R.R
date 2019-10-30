# Write out analytic dataset
write.csv(chd, file = "./data/chd.csv")

# Note the number of columns (variables) and rows (records/cases)
dim(chd)

# Show the variable names
colnames(chd)
