# group1: no heart disease (outcome is 0)
group1 <- chd[chd$outcome==0,]

# group12: nheart disease (outcome is 1, 2, 3, or 4)
group2 <- chd[chd$outcome!=0,]

# check both groups total 302 rows
nrow(group1) + nrow(group2)

