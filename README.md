A SQL project analysing wealth distribution among the world's 200 richest people

Author: Abdulsalam Yakubu

Business Scenario

I was positioned as a Junior Data Analyst at a global financial research organisation. The organisation wants to understand how wealth is distributed among the world's 200 richest people, and my responsibility was to answer key business questions about the dataset using SQL.

About the Dataset

The Top 200 Richest World's Billionaires dataset gives an overview of the wealthiest individuals globally, according to the Forbes list. It captures their financial standing, age, country and industry, which makes it useful for studying wealth distribution, industry dominance and the demographics of the richest people.

	•	200 billionaires across 35 countries and 18 industries
	•	Combined net worth of $6,368.5B
	•	Ages range from 31 to 100
  Table used: Top200RichestPersonintheWorld

Tools

	•	SQL (SQLite)
•	Concepts applied: SELECT, WHERE, ORDER BY, LIMIT, aggregate functions (COUNT, SUM, AVG, MAX, MIN), GROUP BY, HAVING, subqueries, and column aliases
Key Findings

Wealth at the top

	1.	The top 20 are led by Bernard Arnault & family (France, Fashion & Retail) with $233B, followed by Elon Musk ($195B) and Jeff Bezos ($194B). 14 of the 20 are from the United States and 9 are in Technology. Together, the top 20 hold about 39% of all top-200 wealth.
	2.	The youngest billionaire is Mark Mateschitz (31, Austria, Food & Beverage, $39.6B), followed by Lukas Walton (37), then Mark Zuckerberg, Dustin Moskovitz and Pavel Durov, all aged 39.
	3.	The average billionaire is about 69 years old with a net worth of about $31.8B. The median net worth is only about $19.3B, so the average is pulled up by a few very large fortunes.

Geography

	4.	The United States dominates with 79 of the 200 billionaires, followed by China (17), India (13), then Russia and Germany tied at 11.
	5.	The US holds $3,130.9B, which is 49% of all top-200 wealth. France ranks second by wealth ($478.8B) with only 7 billionaires, while China has more billionaires than India (17 vs 13) but less combined wealth ($387.4B vs $434.5B).
	6.	Only 8 countries have at least 5 billionaires (US, China, India, Russia, Germany, Hong Kong, France, Australia), and together they account for 150 of the 200 people (75%).

Industry

	7.	Technology (40), Finance & Investments (32) and Fashion & Retail (30) have the most billionaires and together make up 51% of the list. Food & Beverage and Diversified follow with 15 each.
	8.	Telecom has the highest average net worth ($102B), but it contains only one person (Carlos Slim Helu & family), so the result is a small-sample effect. Among industries with at least 3 billionaires, Technology leads with an average of about $43.5B across 40 people, ahead of Fashion & Retail ($38.9B).

Age and wealth

	9.	16 billionaires under 50 hold a combined $508.3B, only 8% of total wealth, so top-200 wealth is held mostly by older people.
	10.	53 billionaires (26.5% of the list) are above the $31.8B average, and they hold $3,841.7B, about 60% of total wealth. This shows a right-skewed distribution where a minority of very large fortunes lifts the average.

My own questions

	11.	The gap between the richest ($233B) and the 200th richest ($10.7B) is $222.3B, about 22 times. Even inside the top 200 the spread is steep.
	12.	14 countries have exactly one billionaire. Spain's Amancio Ortega ($103B) is the richest of these, and other examples include Chile, Sweden, the UAE, Nigeria (Aliko Dangote, $13.4B), South Africa (Johann Rupert & family, $12.2B), South Korea and Taiwan.
	13.	Only 5 billionaires are both under 50 and in the top 50: Mark Zuckerberg (39), Zhang Yiming (40), Mark Mateschitz (31), Colin Huang (44) and Changpeng Zhao (47). Three of them are in Technology, and together they hold $331.9B.
	14.	Automotive (59.6 years) and Technology (59.6 years) have the youngest average age among industries with 3+ billionaires, almost tied. Real Estate (85.9) and Media & Entertainment (84.3) are the oldest.
	15.	The 5 oldest billionaires are aged 95 to 100, led by Robert Kuok (100, Malaysia). Three of the five are from Hong Kong, and 49 of the 200 billionaires are 80 or older, so wealth is held for decades.

Recommendations

	1.	Report the median alongside the average. The mean net worth ($31.8B) is far above the median ($19.3B), and only 53 of 200 people sit above the mean. Any summary of a "typical" top-200 billionaire should use both (Queries 3, 9, 11).
	2.	Treat the US as a separate market from the rest of the world. One country holds almost half of all wealth (Queries 4, 5, 7). Comparing other countries against a US-excluded baseline will give clearer insight.
	3.	Track Technology and the countries building wealth in it. Technology has the most billionaires, the highest average wealth once one-person industries are excluded, one of the youngest age profiles, and 3 of the 5 young top-50 billionaires (Queries 6, 10, 13, 14).
	4.	Always check group size before ranking averages. Query 10 shows how a single-person industry (Telecom) can top an average-based ranking. Use HAVING COUNT(*) >= 3 when ranking groups.
	5.	Watch emerging single-billionaire markets such as Nigeria, South Africa, Chile and the UAE (Query 12), and the young-billionaire pipeline from China and the US (Queries 2, 13).
	6.	Add trend data. This dataset is a single snapshot. Adding yearly Forbes lists would allow analysis of how rankings, industries and age profiles change over time.

Limitations

	•	The dataset covers only the top 200 and is a single point in time.
	•	Net worth figures are estimates from the Forbes list.
	•	Industry labels are broad, and some billionaires could fit several categories.
	•	Many entries are families (for example "& family"), so counts reflect fortunes, not always individuals.
