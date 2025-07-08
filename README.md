# C-n-k-ombiEval7
Created a 7-Card Poker Hand Evaluation Calculator App in Flutter (Dart). This program uses standard methods to calculate probabilities post-flop, but pre-flop, uses advanced combinatorics to minimize runtime and memory usage. With this strategy, the program can avoid the gigantic look-up arrays or brute force counting of most other calculators.

The intuition behind my algorithm is this:

What differentiates the probabilities of all possible two card sets?
Immediately suited and pocket cards come to mind, divide these into three categories (notice pocket cards cannot also be suited).

This alone accounts for nearly all differences, consider if all cards were labeled with a random symbol corresponding to their name (such as A=/, 2=*, 3=& ...), 7 out of the 9 possible hand types would work the exact same. This suggests the numerical relationship between the two cards only impacts the straight and straight flush percentages.

You can account for this by considering the proximity between the two cards, and their location relative to the lowest and highest cards within the deck.

With all these things considered, we find lots of patterns. For example, {6,7 off} and {8,9 off} will always have the exact same distribution across ALL nine hand types. There are many more connections that don't fair over all hand types but work for many.

The difficult part is double counting, pairs can become two pairs, can become full houses, can become four of a kinds. The vast majority of the algorithm deals with inter and intra-double counting.
