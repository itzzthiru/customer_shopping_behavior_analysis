📊 Customer Shopping Behavior Analysis
📌 Overview

This repository contains a complete data analytics project focused on analyzing customer shopping behavior. It demonstrates a full workflow from data loading and preprocessing in Python to SQL analysis in MySQL, interactive visualization in Power BI, and reporting. This project highlights analytical skills, SQL proficiency, and dashboard creation—all packaged with documentation and presentation materials.

🗂 Dataset

The dataset includes 3,900 customer purchase records with 18 features capturing demographics, purchase details, product information, ratings, shipping, and subscription behavior.
Key aspects:

Customer demographics (age, gender, location)

Purchase details (products, amounts, discounts)

Behavior flags (subscription status, repeat purchases)

Review ratings with some missing values handled in preprocessing

🛠 Tools & Technologies
Phase	Tools
Data loading & cleaning	Python (VS Code)
SQL analysis	MySQL Server, MySQL Workbench
Query execution	VS Code
Visualization	Power BI
Reporting & Presentation	Markdown Report, Gamma PPT
🧠 Steps / Workflow
1. Data Loading

Imported the dataset into Python using pandas.

Initial structure and descriptive statistics checked with df.info() and df.describe().

2. Data Cleaning & Preparation

Standardized column names to snake_case.

Imputed missing values in the Review Rating column using median ratings by product category.

Created new features like age_group and calculated purchase_frequency_days.

Removed redundant or unnecessary columns after validation.

3. Database Integration

Loaded the cleaned dataset into a MySQL Server database via MySQL Workbench.

Ensured correct schema and data types for analytical queries.

4. SQL Analysis

Executed analytical SQL queries directly from VS Code connected to MySQL.

Extracted key business metrics:

Revenue by gender

High-spending discount users

Top products by rating

Shipping type comparisons

Customer segmentation

And more

5. Dashboard Creation

Built an interactive Power BI dashboard to visualize insights.

Included slicers and filters for dynamic analysis by category, gender, age group, etc.

6. Reporting & Presentation

Prepared a comprehensive written report summarizing findings.

Created a presentation in Gamma to highlight key insights for stakeholders.

📊 Dashboard Highlights

The Power BI dashboard visualizes:

Revenue breakdowns by demographic segments

Top products and ratings

Customer behavior trends across subscription status

Shipping and discount impact on purchases

📈 Results Summary

Key insights derived from the analysis include:

Majority of revenue generated from specific demographic segments

Certain product categories outperform others in customer ratings

Shipping type correlates with purchase behavior

Repeat buyers show distinct revenue patterns

These findings can inform targeted marketing, pricing, and product strategies.

▶️ How to Run This Project
Prerequisites

Python 3.x

MySQL Server

Power BI Desktop

VS Code (with SQL extension)

Steps

Clone the Repository

git clone https://github.com/itzzthiru/customer_shopping_behavior_analysis
cd customer_shopping_behavior_analysis


Python Environment

Install required packages:

pip install pandas numpy matplotlib seaborn mysql-connector-python


Run the Python notebook:

code Customer_Shopping_Behavior_Analysis.ipynb


Database Setup

Create a MySQL database.

Use the provided schema and load the cleaned dataset.

Connect via MySQL Workbench or VS Code.

Execute SQL Queries

Open SQL files in VS Code.

Connect to MySQL and run queries to generate analytical outputs.

Power BI Dashboard

Open the .pbix file in Power BI Desktop.

Interact with visuals and slicers to explore insights.

Report & Presentation

Read the provided markdown report.

Review or present using the Gamma PPT file.

📄 License

This project is for educational and portfolio purposes. Feel free to modify and reuse components as needed.
