# Read in data set
chd <- read.csv2("./data/cleveland.csv", sep=",", as.is=TRUE)

# Apply variable names
colnames(chd) <- c("age","sex","cp","trestbps","chol","fbs","restecg","thalach",
                   "exang","oldpeak","slope","ca","thal","outcome")

# take a look at the data set structure
str(chd)
