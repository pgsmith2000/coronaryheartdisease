# Load libraries
library(ggplot2)
library(dplyr)

# Read in the data set
chd <- read.csv("./data/chd.csv", header=TRUE, sep=",")

# histograms
b <- ggplot(CHDgroup, aes(x = age))
b +  geom_histogram(bins=30, color="black", fill="navy", alpha=0.6) +
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

df <- CHDgroup %>%
  group_by(sex) %>%
  summarize(counts = n())
df
c <- ggplot(df, aes(x=sex, y=counts))
c + geom_bar(stat = "identity", fill=c("navy","yellow2"), alpha=0.6) +
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

df <- CHDgroup
df$sex <- factor(df$sex, 
                 levels=levels(df$sex)[order(levels(df$sex), 
                                             decreasing=T)])
e <- ggplot(df, aes(x=age))
e + geom_histogram(bins=30, aes(color=sex, fill=sex), alpha=0.6,
                    position="identity") +
  scale_color_manual(values = c("navy", "black")) +
  scale_fill_manual(values = c("navy", "yellow2")) 

e +  geom_histogram(bins=30, aes(color=sex, fill=sex),alpha=0.6,
                      position="identity") +
  labs(title="Participant Count by Sex and Outcome Group",
       y="Count", x="Participant Age") +
  facet_grid(cols=vars(outcome)) +
    theme_bw() +
    theme(axis.line = element_line(size=1, colour = "black"),
          panel.grid.major = element_line(colour = "#d3d3d3"),
          panel.grid.minor = element_blank(),
          panel.border = element_blank(), panel.background = element_blank(),
          plot.title = element_text(size = 14, 
                                    family = "Tahoma", face = "bold"),
          text=element_text(family="Tahoma"),
          axis.text.x=element_text(colour="black", size = 9, face="bold"),
          axis.text.y=element_text(colour="black", size = 9, face="bold")) +
    scale_fill_brewer(palette="Accent")

