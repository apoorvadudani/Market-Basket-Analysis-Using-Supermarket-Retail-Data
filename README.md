# Market-Basket-Analysis-Using-Supermarket-Retail-Data

## Background

A Belgian supermarket chain wants to maximize its sales and profit margins. To do this, I analyze its retail transactional data using Association Rule Mining (ARM) which is a data analysis technique used to discover interesting relationships, patterns, and associations between variables in large datasets. Association rules are commonly used with sparse data sets that have many observations but little information per observation. In marketing, this is typical of market baskets, where ARM helps identify sets of items that frequently occur together in transactions. This is useful for the supermarket chain because ARM helps uncover patterns in what customers buy together, offering insights into their shopping habits, and can help it tailor their marketing strategies. For example, if ARM reveals that customers who buy pasta also tend to buy tomato sauce, the store might run a promotion on pasta and sauce together. This targeted approach is more cost-effective and likely to increase sales compared to general promotions.

Insights from ARM can inform more effective store layouts by placing items that are frequently bought together in close proximity. This can lead to increased cross-selling opportunities, as customers discover products related to their purchases conveniently placed nearby, encouraging additional purchases. ARM can also help supermarkets manage their inventory more efficiently. Understanding product associations allows stores to predict demand for products more accurately, especially when certain items are promoted or during specific seasons. This can lead to better stock levels, reduced waste, and improved turnover. Lastly, the knowledge gained from ARM can be used to develop dynamic pricing strategies. By understanding the strength of the association between products, supermarkets can adjust pricing to maximize profit margins without deterring customers. For example, a slight price increase on a product that is frequently bought with a discounted item might go unnoticed by customers.

![image](https://github.com/apoorvadudani/Market-Basket-Analysis/assets/113878059/d096135e-b032-4946-8b43-05e30659e3c5)

ARM is characterized by rules based on measures of interestingness:

1. Rules: Think about when you go grocery shopping. You might notice that when people buy bread, they often buy peanut butter too. In our grocery world, this observation is a rule: buying bread leads to buying peanut butter.
2. Support: Now, you're curious about how often people buy both bread and peanut butter on their shopping trips. Support tells us this: it's the percentage of all shopping trips where both bread and peanut butter are bought together. For example, if out of 100 shopping trips, 20 include both bread and peanut butter, the support for this rule is 20%.
3. Confidence: But how reliable is this pattern of buying bread and then peanut butter? Confidence gives us the certainty. If 50 people buy bread and 20 of them also buy peanut butter, then the confidence that bread leads to peanut butter is 40%. It means, "When bread is bought, there's a 40% chance peanut butter is bought too."
4. Lift: You might wonder, "Is the connection between bread and peanut butter just by chance, or is it a special shopping pattern?" Lift answers this. It compares how much more often bread and peanut butter are bought together than would be expected if they were bought independently of each other. A lift of 1 means the bread and peanut butter combo is no more likely than chance; a lift greater than 1 means the combo is bought together more often than expected. If our bread and peanut butter have a lift of 2, it means they're twice as likely to be bought together than if there was no special link between them.

I investigate such associations in a large set of retail transaction data made publicly available by Brijs et al.: http://fimi.ua.ac.be/data/retail.dat. This dataset comprises market baskets of items purchased together, where each record includes arbitrarily numbered items numbers without item descriptions (to protect the supermarket chain’s proprietary data).

## Data cleaning and preparation

In this text format, the data is not ready to mine. I first split each of the transaction text lines into individual items. To do this, we use strsplit(lines, " "). This command splits each line wherever there is a blank space character (" ") and saves the results to a list.

Each list is a line of numbers, where each number represents a different item. For example, one line might start with "0 1 2," meaning the customer bought items numbered 0, 1, and 2 together. To make sense of this, I break down each line into the individual item numbers so we can work with them more easily. Then, I give each shopping list a name, like "Trans1" for the first transaction, "Trans2" for the second, and so on.

After organizing the data, I see that I have 88,162 shopping lists to analyze. I notice things like some shopping lists have just one item, while others have many items. For example, the first list has 30 items, but another list might only have 3. Next, I transform this list of numbers into "transaction lists," which makes it easier for me to find patterns.

In the end, I have a table showing me which items are commonly bought together out of all the transactions and the average number of items people buy at one time. For example, item number 39 is super popular because it appears in more than half of all shopping lists.

<img width="558" alt="Screenshot 2024-03-07 at 1 23 05 PM" src="https://github.com/apoorvadudani/Market-Basket-Analysis-Using-Supermarket-Retail-Data/assets/113878059/737e7f2c-3b0b-4e4e-981c-93beb6565e6f">

Finally, I use the rm() function to remove the original raw data and the intermediate list format from memory, as they are no longer needed. This helps to free up memory space.

## Association Rule Mining

Then, I use an R command called apriori on the data to find patterns (or association rules) and ask it to look for combinations of items that show up together in people's baskets more often than you'd expect by chance:

- The pattern appears in at least 0.1% of transactions (supp=0.001). This is called the minimum support.
- The likelihood that the pattern holds true is at least 40% (conf=0.4). This is called the minimum confidence.
- The patterns that meet these criteria are then stored in a new object called retail.rules, which contains a big list of rules that tell us things like "When someone buys item A and item B, they almost always buy item C too." Imagine we find out that whenever people buy a specific type of pasta and sauce, they also buy a certain cheese. That's a pattern we can use!

## Visualizing the metrics

Then, using an **arules visualization package**, I create a basic chart of the association rules stored in retail.rules. The plot shows the rules according to their confidence (Y-axis) and support (X-axis), and it uses the darkness of points to indicate lift (how much more often the rule occurs than would be expected if the items were independent).

![image](https://github.com/apoorvadudani/Market-Basket-Analysis-Using-Supermarket-Retail-Data/assets/113878059/4ed90825-ddba-4400-9a07-a351849c9e92)

Density of High Confidence Rules: There is a heavy concentration of rules with high confidence (above 0.6), indicating that many of the rules found are quite reliable. For example, when a shopper buys a certain item, there's a high likelihood they'll also buy another associated item.

Low to Moderate Support for Most Rules: Most of the data points are clustered towards the lower end of the support axis, suggesting that while the associations are strong when they do occur, they do not represent a large proportion of the total transactions. This could mean these patterns, although strong, are specific to certain customer segments or are niche trends within the dataset.

Variation in Lift: The gradient of color, which represents lift, varies across the rules, but there are points with darker shades even at lower levels of support. This indicates some rules have a very strong lift, suggesting that the occurrence of the itemset is significantly higher than would be expected if the items were independent, even though these items might not be the most frequently purchased ones.

Potential for Targeted Actions: Rules with the darkest color intensity, which signifies a higher lift, are potentially the most actionable. They could be used to drive specific marketing strategies like promotions, coupons, and product placements, as these are the item combinations that occur much more frequently than expected by chance.

Opportunities for Cross-Selling: Items associated with high-confidence rules may be good candidates for cross-selling strategies. Since the confidence is high, suggesting one item to a customer who has bought the other could likely result in additional sales.

Strategic Product Placement: The supermarket could use this information for strategic product placement. Products that are part of high-lift rules could be placed near each other to increase the chance of both being purchased together.

Selective Promotion: Because of the presence of rules with high confidence but lower support, the store might choose to selectively promote items that are less frequently bought but have a strong chance of being bought together, possibly boosting overall sales of less popular items.

## Key insights from the association patterns

Now, I focus on the patterns that really stand out. These are the combos bought together much more often than you'd expect by chance. We call these standout patterns "rules with high lift." Imagine you notice that whenever someone buys a gourmet cheese, they also buy a specific wine. This combo happens way more often than seeing people buy random items together. That's a pattern with "high lift." To find these patterns, I list the top 50 standout combos based on how unusual, or strong, their connection is using the sort() function.

Now, how do we make sense of these patterns? We create a map—a visual chart—that shows us these top 50 combos. 

![image](https://github.com/apoorvadudani/Market-Basket-Analysis/assets/113878059/d249e012-da3b-406b-9018-377b1588d194)

- Each circle, or node, has a number label, and represents one of these standout combos, like the cheese and wine. The nodes represent individual items identified by their item numbers (e.g., 696, 699). The larger a node, the more often that item appears in transactions with other items, which is known as the item's support.
- Lines going into a circle show what people start with (like the gourmet cheese), and lines going out show what they often end up buying too (like the specific wine). If two items are connected by a line, it means they are frequently purchased together.
- The size of each circle tells us how popular the combo is. A bigger circle means more people buy this combo, or higher support.
- The color of the circle shows us how unusual the combo is. Darker circles mean the combo is more surprising and special, or has a higher lift, and means that the association between the items is stronger than expected from their individual supports.
- While not explicitly labeled in the image, in such graphs, the thickness of an edge often corresponds to the confidence of the rule, which is the likelihood of the consequent being bought given the antecedent is bought. A thicker line might indicate higher confidence.
- Important items that seem to connect different groups.  Item 39 stands out as being central to multiple rules, suggesting it is a common item that is often bought along with various other items. This could be a staple or popular product and might warrant special attention, such as premium shelf placement and robust stock. Picture an item that has lines going to many different circles, like a popular type of bread that goes well with many things. Hence, we might decide to put the gourmet cheese and the specific wine closer together in the store to make it easier for customers to find this great combo.
- The graph shows clusters of items, such as the set {3402, 3535, 3537} and {309, 1080, 1269, 1378, 1379, 1380}. These clusters indicate groups of items that are often purchased together. These are potential candidates for marketing strategies like bundle offers or joint promotions.

![image](https://github.com/apoorvadudani/Market-Basket-Analysis-Using-Supermarket-Retail-Data/assets/113878059/28824e95-f92e-4b61-a21a-ce73238a834c)

## Calculating Profit Margins with Transaction Data

The "transaction data" I used up until now only tells me which items are often bought together, like bread and cheese. However, in our data, I don't know how much profit each item makes – I just know they were sold together. To figure out the profit, I make a unique list of every item we've sold. Then, I assign each one a made-up profit margin, say between 20 cents to 40 cents randomly.

Next, if I want to know how much profit a specific sale made, like if someone bought bread and cheese, I just look at our made-up profit numbers for bread and cheese and add them together. That's our profit for that transaction. So, let's say someone's basket had bread, cheese, and wine. I find our profit number for each of these items, add them up, and now I know how much profit that basket made.

In the end, this information can help decide which items to promote. If I find out that a combination of items – like our bread and cheese – often gets sold together and makes a good profit, the supermarket might put them on sale to sell even more. It's all about finding the sweet spot between what's popular and what's profitable.

