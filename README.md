# Market-Basket-Analysis-Using-Supermarket-Retail-Data

## Background

I investigate associations in a larger set of retail transaction data from a Belgian supermarket chain made publicly available by Brijs et al. in .dat format: http://fimi.ua.ac.be/data/retail.dat. This data set comprises market baskets of items purchased together, where each record includes arbitrarily numbered items numbers without item descriptions (to protect the chain’s proprietary data).

![image](https://github.com/apoorvadudani/Market-Basket-Analysis/assets/113878059/d096135e-b032-4946-8b43-05e30659e3c5)

I use the data analysis method of association rule mining, which consists of four concepts that can help inform certain decisions that the supermarket chain can make to increase sales. Imagine we're talking about bread and peanut butter, two items commonly found in a grocery store.

1. Rules: Think about when you go grocery shopping. You might notice that when people buy bread, they often buy peanut butter too. In our grocery world, this observation is a rule: buying bread leads to buying peanut butter.

2. Support: Now, you're curious about how often people buy both bread and peanut butter on their shopping trips. Support tells us this: it's the percentage of all shopping trips where both bread and peanut butter are bought together. For example, if out of 100 shopping trips, 20 include both bread and peanut butter, the support for this rule is 20%.

3. Confidence: But how reliable is this pattern of buying bread and then peanut butter? Confidence gives us the certainty. If 50 people buy bread and 20 of them also buy peanut butter, then the confidence that bread leads to peanut butter is 40%. It means, "When bread is bought, there's a 40% chance peanut butter is bought too."

4. Lift: You might wonder, "Is the connection between bread and peanut butter just by chance, or is it a special shopping pattern?" Lift answers this. It compares how much more often bread and peanut butter are bought together than would be expected if they were bought independently of each other. A lift of 1 means the bread and peanut butter combo is no more likely than chance; a lift greater than 1 means the combo is bought together more often than expected. If our bread and peanut butter have a lift of 2, it means they're twice as likely to be bought together than if there was no special link between them.

Association rule mining helps us uncover interesting shopping patterns, like:

Rules show us the buying patterns, like bread often leads to peanut butter.
Support tells us how common these combos are among all shopping trips.
Confidence reveals how likely one item (peanut butter) is bought when another item (bread) is.
Lift indicates if the pattern is just by chance or if it's a significant shopping habit.
Knowing these patterns, te supermarket chain might place bread and peanut butter close to each other to encourage people to buy both, enhancing the shopping experience and possibly increasing sales.

## Data cleaning and preparation

In this text format, the data is not ready to mine; I first split each of the transaction text lines into individual items. To do this, we use strsplit(lines, " "). This command splits each line wherever there is a blank space character (" ") and saves the results to a list:

Each list is a line of numbers, where each number represents a different item. For example, one line might start with "0 1 2," meaning the customer bought items numbered 0, 1, and 2 together. To make sense of this, I break down each line into the individual item numbers so we can work with them more easily. Then, I give each shopping list a name, like "Trans1" for the first transaction, "Trans2" for the second, and so on.

After organizing the data, I see that I have 88,162 shopping lists to analyze. I notice things like some shopping lists have just one item, while others have many items. For example, the first list has 30 items, but another list might only have 3. Next, I transform this list of numbers into something called a "transaction list." This makes it easier for me to find patterns, like discovering that bread and butter are often bought together.

In the end, we have a big table showing us which items are commonly bought together out of all the transactions. This table tells us things like the most popular items and the average number of items people buy at one time. For example, item number 39 is super popular because it appears in more than half of all shopping lists.

<img width="558" alt="Screenshot 2024-03-07 at 1 23 05 PM" src="https://github.com/apoorvadudani/Market-Basket-Analysis-Using-Supermarket-Retail-Data/assets/113878059/737e7f2c-3b0b-4e4e-981c-93beb6565e6f">

Finally, I use the rm() function to remove the original raw data and the intermediate list format from memory, as they are no longer needed. This helps to free up memory space.

## Association Rule Mining

Then, I use a command called apriori on the data to find patterns (or association rules) and ask it to look for combinations of items that show up together in people's baskets more often than you'd expect by chance. I set some rules for it, like only showing us patterns where:

- The pattern appears in at least 0.1% of transactions (supp=0.001). This is called the minimum support.
- The likelihood that the pattern holds true is at least 40% (conf=0.4). This is called the minimum confidence.
- The patterns that meet these criteria are then stored in a new object called retail.rules, which contains a big list of rules, which tell us things like "When someone buys item A and item B, they almost always buy item C too." Imagine we find out that whenever people buy a specific type of pasta and sauce, they also buy a certain cheese. That's a pattern we can use.

## Visualization

This line creates a basic plot (chart) of the association rules stored in retail.rules. The plot shows the rules according to their confidence (Y-axis) and support (X-axis), and it uses the darkness of points to indicate lift (how much more often the rule occurs than would be expected if the items were independent).

![image](https://github.com/apoorvadudani/Market-Basket-Analysis/assets/113878059/d249e012-da3b-406b-9018-377b1588d194)

Nodes (Circles): Each node in the graph represents an item or a set of items. In the context of market basket analysis, an item can be anything that is commonly purchased like bread, milk, or eggs.

Node Size: The size of the nodes varies, which likely represents the 'support' of the items. In market basket analysis, 'support' refers to the frequency or proportion of transactions that contain the item or set of items. Larger nodes indicate higher support, meaning those items appear more frequently in the dataset.

Node Color: The color intensity of the nodes changes from light to dark red. This represents the 'lift' of an item or an itemset. Lift is a measure of how much more often items in a rule are bought together than expected if they were bought independently. A higher lift value (darker color) means that the association between the items is stronger than expected from their individual supports.

Edges (Lines): The lines connecting the nodes represent the association rules. An association rule has two parts: an antecedent (if) and a consequent (then). For example, an edge connecting node "Bread" to node "Milk" might represent the rule "If Bread then Milk", meaning that transactions containing bread are likely to contain milk as well.

Edge Thickness: While not explicitly labeled in the image, in such graphs, the thickness of an edge often corresponds to the confidence of the rule, which is the likelihood of the consequent being bought given the antecedent is bought. A thicker line might indicate higher confidence.

Labels: Each node has a number label. These numbers are identifiers for each item or itemset. In a detailed report, you would have a key that tells you which number corresponds to which item.

Legend: The legend on the right side explains the node sizes by support values and the color intensity by lift values. The legend allows you to understand what the sizes and colors mean in the context of the data being represented.

## Findings and insights
