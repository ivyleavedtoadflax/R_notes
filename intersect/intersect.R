
# create data sets

a<- 1:100
b<- as.integer(rnorm(5,mean=30,sd=5))

a
b

# show which values intersect between a and b:

intersect(a,b)

# find the values which intersect

# This way round is not very useful....

b %in% a

# This way round is much more useful

a %in% b

# e.g. can be used for matching portions of datasets

a[a %in% b]

