# Amazon_Sales_-_Customer_Reviews_Analysis_Project 

Amazon Product Sales & Customer Reviews Analysis

An end-to-end data analysis project on Amazon product listings. It studies product sales, pricing, discounts, ratings and customer reviews across categories, to find top-performing products, understand customer preferences and support better pricing and stocking decisions.

Tools Used
Python (Pandas, NumPy, Matplotlib, Seaborn, ReportLab) for cleaning, EDA, charts and automatic report generation
MySQL 8.0 for SQL analysis
Power BI for the interactive dashboard
Dataset

Amazon Sales Dataset from Kaggle (1,465 rows, 16 columns). After cleaning, 1,351 unique products and 21 columns remain.

The dataset has no sales quantity column, so estimated sales (total_sales) = discounted price x rating count. All revenue figures in this project are estimates based on this formula.

Project Files
File	Description
Data_Cleaning.ipynb	Python notebook: data cleaning, 10 EDA tasks, 10 visualizations, business insights and automatic report generation
amazon_sql_tasks.sql	10 SQL queries (aggregations, rankings, filters, window function)
amazon_dashboard.pbix	Power BI dashboard (6 pages, 6 KPI cards, slicers)
amazon_cleaned.csv	Cleaned dataset (1,351 rows, 21 columns)
amazon_sql.csv	Cleaned dataset prepared for MySQL import (12 columns)
report_output/	Auto-generated report files: cleaned dataset, statistical summary, 10 chart images, business insights, recommendations and the PDF report
Dashboard_Screenshots/	Screenshots of all 6 dashboard pages
What I Did
1. Data Cleaning and Feature Engineering (Python)
Loaded the raw data and checked its structure, data types and summary statistics
Fixed one invalid rating value (|) and filled it with the median rating
Removed the rupee symbol and commas from the price columns and converted them to numbers
Removed the % sign from discount_percentage and converted it to a whole number
Filled 2 missing rating_count values with the median
Removed 114 repeated product_id rows (kept the first record), leaving 1,351 unique products
Split the category path into main_category and sub_category
Created new columns: discount_amount, price_range (Budget up to Rs 500, Mid-Range Rs 500 to 2,000, Premium above Rs 2,000) and total_sales
2. SQL Analysis (MySQL)

Imported the cleaned data into a database named amazon_sales_db (table amazon_products) and checked the import against the Python totals. Ten queries cover: total sales by category, top 10 selling products, highest-rated products, average rating, maximum discount, product count by category, low-rated products (below 3), product ranking with RANK(), average price by category and most-reviewed products.

3. Exploratory Data Analysis (Python)

Ten EDA tasks: loading and structure, summary statistics, missing values and duplicates, category distribution, pricing and discount trends, rating comparison across categories, best-selling products, customer review patterns, correlation analysis and business insights.

4. Data Visualization

Category count plot, rating distribution, discount histogram, price distribution histogram, top products bar chart, rating vs price scatter plot, discount vs sales scatter plot, price box plot, correlation heatmap and pair plot. Price, sales and review counts are very skewed, so log scales were used where needed.

5. Automatic Report Generation

The notebook generates, in one run and straight from the data:

Cleaned dataset (CSV)
Statistical summary (CSV)
10 chart images
Business insights report (the sentences are written by code from the calculated numbers, so they update when the data changes)
Final recommendations
A 9-page PDF report with a cover page, KPI summary, category table, statistical summary, all 10 charts with captions, business insights and recommendations
6. Power BI Dashboard

Six report pages, each with a different set of visuals (bar, treemap, donut, gauge, line, scatter, waterfall, funnel, stacked column, matrix and tables):

Page	Focus
Product Sales	6 KPI cards, revenue by category, sub-category and price range
Customer Rating	Average rating gauge, rating distribution, rating by category and price range, low-rated products
Category Performance	Products by category, price vs rating, price range mix, top sub-categories, category scorecard
Discount Analysis	Discount by rating band, price range and category, discount vs revenue, top discounted products
Revenue	Revenue contribution, category by price range, funnel, top 10 products, price range summary
Customer Review Analysis	Reviews by category and price range, rating vs review count, most-reviewed products

KPI cards: Total Products, Total Revenue, Average Rating, Average Discount, Highest Selling Product and Total Reviews.

Interactivity: Main Category, Price Range, Rating and Discount slicers are synced across all pages, a page navigator moves between pages, a "Clear all filters" button resets everything, and every visual cross-filters the others. The dashboard follows a custom colour theme (navy, blue and orange).

Key Insights
The catalog has 1,351 products with an estimated revenue of Rs 68.96 billion, 23.8 million reviews and an average rating of 4.09.
Electronics brings about 82% of the estimated revenue and about 60% of all reviews. Electronics, Home&Kitchen and Computers&Accessories hold 97% of all products.
Premium products (351 of 1,351) generate about 80% of the revenue.
The highest-selling product is Redmi 9 Activ, with about Rs 2.67 billion in estimated revenue. The most-reviewed products are low-priced items such as Amazon Basics HDMI cables (426,973 ratings each).
Customers are generally satisfied: about 75% of products are rated 4.0 or above and only 6 are rated below 3.
The average discount is 46.7%. Budget products get the deepest discounts (about 55%) and Premium the lowest (about 36.5%).
Products with lower ratings carry higher average discounts (about 64% for ratings below 3 against about 43% for 4.5 and above).
Discount and sales have a weak negative correlation (-0.19), so deeper discounts do not lead to higher sales. Price and rating are also only weakly related (0.13).
The median price is Rs 899, and about 74% of products cost Rs 2,000 or less.
Recommendations
Focus stock, marketing and offers on the top categories, and keep best sellers always available.
Review the discount strategy and avoid unnecessary deep discounts, especially on Budget products and on products that already sell well.
Investigate the low-rated products and the categories with the lowest average rating.
Add more products in the smaller categories to widen the catalog.
Group the repeated variants of the same product so that sales and customer feedback are easier to track.
Limitations
Sales are estimated from rating counts, so the figures show relative popularity, not actual units sold.
Several categories have only 1 or 2 products, so their averages are not reliable.
How to Run
Download the Amazon Sales Dataset (amazon.csv) from Kaggle and place it in the project folder.
Open Data_Cleaning.ipynb and run all cells. This cleans the data, saves amazon_cleaned.csv and creates the report_output/ folder with the PDF report. Install ReportLab first if needed: pip install reportlab.
For the SQL part, import amazon_sql.csv into a MySQL table amazon_products (database amazon_sales_db) and run amazon_sql_tasks.sql.
Open amazon_dashboard.pbix in Power BI Desktop. In Desktop, use Ctrl + click on the page navigator and buttons.
Author

Chaitali Bonde
