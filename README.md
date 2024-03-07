# Market-Basket-Analysis

![image](https://github.com/apoorvadudani/Market-Basket-Analysis/assets/113878059/d096135e-b032-4946-8b43-05e30659e3c5)


I investigate associations in a larger set of retail transaction data from a Belgian supermarket chain. This data set comprises market baskets of items purchased together, where each record includes arbitrarily numbered items numbers without item descriptions (to protect the chain’s proprietary data).


![image](https://github.com/apoorvadudani/Market-Basket-Analysis/assets/113878059/d249e012-da3b-406b-9018-377b1588d194)

Nodes (Circles): Each node in the graph represents an item or a set of items. In the context of market basket analysis, an item can be anything that is commonly purchased like bread, milk, or eggs.

Node Size: The size of the nodes varies, which likely represents the 'support' of the items. In market basket analysis, 'support' refers to the frequency or proportion of transactions that contain the item or set of items. Larger nodes indicate higher support, meaning those items appear more frequently in the dataset.

Node Color: The color intensity of the nodes changes from light to dark red. This represents the 'lift' of an item or an itemset. Lift is a measure of how much more often items in a rule are bought together than expected if they were bought independently. A higher lift value (darker color) means that the association between the items is stronger than expected from their individual supports.

Edges (Lines): The lines connecting the nodes represent the association rules. An association rule has two parts: an antecedent (if) and a consequent (then). For example, an edge connecting node "Bread" to node "Milk" might represent the rule "If Bread then Milk", meaning that transactions containing bread are likely to contain milk as well.

Edge Thickness: While not explicitly labeled in the image, in such graphs, the thickness of an edge often corresponds to the confidence of the rule, which is the likelihood of the consequent being bought given the antecedent is bought. A thicker line might indicate higher confidence.

Labels: Each node has a number label. These numbers are identifiers for each item or itemset. In a detailed report, you would have a key that tells you which number corresponds to which item.

Legend: The legend on the right side explains the node sizes by support values and the color intensity by lift values. The legend allows you to understand what the sizes and colors mean in the context of the data being represented.
