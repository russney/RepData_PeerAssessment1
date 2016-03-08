# load.R
setwd("/Users/rney/JHR/class5/week1/RepData_PeerAssessment1")
#download.file("https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip", "data1.zip", method="curl")
activ <- read.csv("./activity.csv",sep=',',na.strings="NA",header=TRUE)

# create a histogram of total steps per day
total_steps_day <- sapply(split(activ$steps, activ$date), sum)
clean_steps_day <- na.omit(total_steps_day)
hist(clean_steps_day)

# calculate mean
mean(clean_steps_day)

# calculate median
median(clean_steps_day)

# plot of 5-minute interval vs. average number of stpes taken across all days
steps_by_interval <- sapply(split(activ$steps, activ$interval), mean, na.rm = TRUE)
plot(steps_by_interval, type="l")

# show 5 minute interval, on average across all the days, containsthe  maximum number of steps 
names(steps_by_interval)[steps_by_interval == max(steps_by_interval)]


