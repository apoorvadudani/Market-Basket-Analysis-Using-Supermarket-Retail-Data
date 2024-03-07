install.packages("arules")
library(arules)

retail.raw <- readLines("http://fimi.ua.ac.be/data/retail.dat")

head(retail.raw)
tail(retail.raw)
summary(retail.raw)

retail.list <- strsplit(retail.raw, " ")
names(retail.list) <- paste("Trans", 1:length(retail.list), sep="")

str(retail.list)

rm(retail.raw)

retail.trans <- as(retail.list, "transactions")

summary(retail.trans)

retail.rules <- apriori(retail.trans, parameter=list(supp=0.001, conf=0.4))

install.packages("arulesViz")
library(arulesViz) 
plot(retail.rules)

plot(retail.rules, interactive=TRUE)

rules_sorted_by_lift <- sort(retail.rules, by = "lift", decreasing = TRUE)

retail.hi <- head(rules_sorted_by_lift, 50)

inspect(retail.hi)

plot(retail.hi, method="graph", control=list(type="items"))

head(retail.itemnames); tail(retail.itemnames)

retail.itemnames <- sort(unique(unlist(as(retail.trans, "list"))))

set.seed(03870)
retail.margin <- data.frame(margin=rnorm(length(retail.itemnames), mean=0.30, sd=0.30))
quantile(retail.margin$margin)

rownames(retail.margin) <- retail.itemnames 
head(retail.margin); tail(retail.margin)

retail.margin[c("39", "48"), ]

(basket.items <- as(retail.trans[3], "list")[[1]])
retail.margin[basket.items, ]
sum(retail.margin[basket.items, ])