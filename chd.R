# https:/https://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/

library(ggplot2)
library(dplyr)
library(ggpubr)

setwd("C:/Users/pgsmi/OneDrive/GIT/coronaryheartdisease")

chd <- read.csv2("cleveland.csv", sep=",", as.is=TRUE)
colnames(chd) <- c("age","sex","cp","trestbps","chol","fbs","restecg","thalach",
                   "exang","oldpeak","slope","ca","thal","outcome")
str(chd)
chd$age <- as.numeric(chd$age)
chd$sex <- as.factor(as.integer(chd$sex))
levels(chd$sex) <- c("female","male")
chd$cp <- as.factor(as.integer(chd$cp))
levels(chd$cp) <- c("typical angina","atypical angina",
                     "non-anginal pain","asymptomatic")
chd$trestbps <- as.numeric(chd$trestbps)
chd$chol <- as.numeric(chd$chol)
chd$fbs <- as.logical(as.integer(chd$fbs))
chd$restecg <- as.factor(as.integer(chd$restecg))
levels(chd$restecg) <- c("normal","ST-T wave abnormality",
                         "left ventricular hypertrophy")
chd$thalach <- as.numeric(chd$thalach)
chd$exang <- as.factor(as.integer(chd$exang))
levels(chd$exang) <- c("no","yes")
chd$slope <- as.factor(as.integer(chd$slope))
levels(chd$slope) <- c("upsloping","flat","downsloping")
chd$ca <- as.numeric(chd$ca)
chd$thal <- as.factor(as.integer(chd$thal))
levels(chd$thal) <- c("normal","fixed defect","reversable defect")
chd$outcome <- as.factor(as.integer(chd$outcome))

head(chd)
tail(chd)
dim(chd)
str(chd)

summary(chd)

# group1: no heart disease (outcome is 0)
group1 <- chd[chd$outcome==0,]

# group12: nheart disease (outcome is 1, 2, 3, or 4)
group2 <- chd[chd$outcome!=0,]

# check both groups total 302 rows
nrow(group1)+nrow(group2)

# let's do some boxplots of the integer variables

#chd$age <- as.integer(chd$age)
#chd$trestbps <- as.integer(chd$trestbps)
#chd$chol <- as.integer(chd$chol)
#chd$thalach <- as.integer(chd$thalach)

boxplot(group1$age, group2$age, col="CadetBlue", pch=20, 
        names=c("CHD absent", "CHD present"),  
        ylab="Participant age")

# now do the same in ggplot
groupCHD <- group2
# replace all values of outcome in group2 with "1" - 
groupCHD$outcome <- c(1)
CHDgroup <- rbind(group1, groupCHD)
CHDgroup$outcome <- droplevels(CHDgroup$outcome)
levels(CHDgroup$outcome) <- c("noCHD", "CHD")

a <- ggplot(CHDgroup, aes(x=outcome, y=age)) 
a + geom_boxplot()
a + geom_boxplot() + geom_point()
a + geom_boxplot() + geom_point() + geom_jitter()
a + geom_point(size=3) + geom_jitter(size=2) + 
  geom_boxplot(alpha=.4, fill=c("navy","yellow2"))

a + geom_point(size=3) + geom_jitter(size=2) + 
  geom_boxplot(alpha=.4, fill=c("navy","yellow2")) +
  labs(title="Participant Age by Outcome", 
       y="Count", x="Participant Age") +
  theme_bw() +
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_line(colour = "#d3d3d3"),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank(),
        plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_text(colour="black", size = 9, face="bold"),
        axis.text.y=element_text(colour="black", size = 9, face="bold")) +
  scale_fill_brewer(palette="Accent")

b <- ggplot(CHDgroup, aes(x=age))
b +  geom_histogram(bins=30)

b +  geom_histogram(bins=30, color="black", fill="navy", alpha=0.4) +
  labs(title="Participant Count by Age",
       y="Count", x="Participant Age") +
  theme_bw() +
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_line(colour = "#d3d3d3"),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank(),
        plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_text(colour="black", size = 9, face="bold"),
        axis.text.y=element_text(colour="black", size = 9, face="bold")) +
  scale_fill_brewer(palette="Accent")


ggplot(CHDgroup, aes(sex)) + 
  geom_bar(fill=c("navy","yellow2"), alpha=0.4) + 
  labs(title="Participant Count by Sex",
       y="Count", x="Participant Sex") +
  theme_bw() +
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_line(colour = "#d3d3d3"),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank(),
        plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_text(colour="black", size = 9, face="bold"),
        axis.text.y=element_text(colour="black", size = 9, face="bold")) +
  scale_fill_brewer(palette="Accent")

df <- CHDgroup %>%
  group_by(sex) %>%
  summarize(counts = n())
df
c <- ggplot(df, aes(x=sex, y=counts))
c + geom_bar(stat = "identity") +
  geom_text(aes(label=counts), vjust = -0.3) +
  labs(title="Participant Count by Sex",
       y="Count", x="Participant Sex") +
  theme_bw() +
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_line(colour = "#d3d3d3"),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank(),
        plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_text(colour="black", size = 9, face="bold"),
        axis.text.y=element_text(colour="black", size = 9, face="bold")) +
  scale_fill_brewer(palette="Accent")

d <- ggplot(CHDgroup, aes(x=age))
d +  geom_histogram(bins=30, aes(color=sex), fill="white",
                    position="identity") +
  scale_color_manual(values = c("#00AFBB", "#E7B800"))

d +  geom_histogram(aes(color=sex, fill=sex), alpha=0.4,
                    position="identity") +
  labs(title="Participant Count by Age and Sex",
       y="Count", x="Participant Age") +
  theme_bw() +
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_line(colour = "#d3d3d3"),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank(),
        plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_text(colour="black", size = 9, face="bold"),
        axis.text.y=element_text(colour="black", size = 9, face="bold")) +
  scale_fill_brewer(palette="Accent")

df <- CHDgroup
df$sex <- factor(df$sex, 
                 levels=levels(df$sex)[order(levels(df$sex), 
                                             decreasing=T)])
e <- ggplot(df, aes(x=age))
e + geom_histogram(bins=30, aes(color=sex, fill=sex), alpha=0.4,
                    position="identity") +
  scale_color_manual(values = c("navy", "black")) +
  scale_fill_manual(values = c("navy", "yellow2")) 

e +  geom_histogram(bins=30, aes(color=sex, fill=sex), alpha=0.4,
                    position="identity") +
  labs(title="Participant Count by Sex and Outcome Group",
       y="Count", x="Participant Age") +
  facet_grid(cols=vars(outcome))

  
e +  geom_histogram(bins=30, aes(color=sex, fill=sex),alpha=0.4,
                      position="identity") +
  labs(title="Participant Count by Sex and Outcome Group",
       y="Count", x="Participant Age") +
  facet_grid(cols=vars(outcome)) +
    theme_bw() +
    theme(axis.line = element_line(size=1, colour = "black"),
          panel.grid.major = element_line(colour = "#d3d3d3"),
          panel.grid.minor = element_blank(),
          panel.border = element_blank(), panel.background = element_blank(),
          plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
          text=element_text(family="Tahoma"),
          axis.text.x=element_text(colour="black", size = 9, face="bold"),
          axis.text.y=element_text(colour="black", size = 9, face="bold")) +
    scale_fill_brewer(palette="Accent")
  
data(golub, package="multtest")
install.packages("multtest")

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("multtest")

golub.gnames[1042,]
nrow(golub)
