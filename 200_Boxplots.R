# Load libraries
library(ggplot2)
library(dplyr)

# Read in the data set
chd <- data.frame(read.csv("./data/chd.csv", header=TRUE, sep=","))

# let's do some boxplots of the integer variables

#chd$age <- as.integer(chd$age)
#chd$trestbps <- as.integer(chd$trestbps)
#chd$chol <- as.integer(chd$chol)
#chd$thalach <- as.integer(chd$thalach)

# now do the same in ggplot
groupCHD <- group2

# replace all values of outcome in group2 with "1" - 
groupCHD$outcome <- c(1)
CHDgroup <- rbind(group1, groupCHD)
CHDgroup$outcome <- droplevels(CHDgroup$outcome)
levels(CHDgroup$outcome) <- c("noCHD", "CHD")
typeof(CHDgroup$outcome)

a <- ggplot(CHDgroup, aes(x = outcome, y = age,))
a + geom_point(size=3) + geom_jitter(size=2) + 
  geom_boxplot(alpha=.6, fill=c("navy","yellow2")) +
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

