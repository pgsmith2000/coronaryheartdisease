# convert age to a numeric variable
chd$age <- as.numeric(chd$age)

# convert sex to a factor with two values
chd$sex <- as.factor(as.integer(chd$sex))
levels(chd$sex) <- c("female","male")

# convert cp to a factor with four values
chd$cp <- as.factor(as.integer(chd$cp))
levels(chd$cp) <- c("typical angina","atypical angina",
                    "non-anginal pain","asymptomatic")

# convert trestbps to a numeric variable
chd$trestbps <- as.numeric(chd$trestbps)

# convert chol to a numeric variable
chd$chol <- as.numeric(chd$chol)

# convert fbs to a logical variable (True/False)
chd$fbs <- as.logical(as.integer(chd$fbs))

# convert restecg to a factor with three values
chd$restecg <- as.factor(as.integer(chd$restecg))
levels(chd$restecg) <- c("normal","ST-T wave abnormality",
                         "left ventricular hypertrophy")

# convert thalach to a numeric variable
chd$thalach <- as.numeric(chd$thalach)

# convert exang to a factor with two values
chd$exang <- as.factor(as.integer(chd$exang))
levels(chd$exang) <- c("no","yes")

# convert slope to a factor with three values
chd$slope <- as.factor(as.integer(chd$slope))
levels(chd$slope) <- c("upsloping","flat","downsloping")

# convert ca to a numeric variable
chd$ca <- as.numeric(chd$ca)

# convert thal to a factor with three values
chd$thal <- as.factor(as.integer(chd$thal))
levels(chd$thal) <- c("normal","fixed defect","reversable defect")

# convert outcome to a factor
chd$outcome <- as.factor(as.integer(chd$outcome))

