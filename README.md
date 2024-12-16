# Optimizing Content Strategy: Netflix Data Cleaning and Analysis Using SQL

## Overview  
This project demonstrates how SQL can be utilized for comprehensive data cleaning and exploratory analysis of a Netflix dataset. By leveraging SQL queries, the project aims to improve data quality and uncover insights into Netflix's content trends, production patterns, and audience preferences.  

---

## Business Problem  
Netflix's global success depends on understanding trends in content production and viewer preferences. This project addresses the following questions:  
1. How can data inconsistencies and missing values be cleaned to enable better analysis?  
2. What trends exist in content type, genres, and production countries, and how can these inform strategic decisions?  

---

## Data Cleaning  
Using SQL, the dataset was cleaned to ensure consistency and accuracy for meaningful analysis:  
- **Handled Missing Values:** Replaced NULL values in critical columns (e.g., `director`, `country`, `date_added`) with placeholders like `"Unknown"`.  
- **Standardized Formats:** Converted date formats from `dd-MMM-yy` to the U.S. format `MMM-dd-YYYY`.  
- **Removed Duplicates:** Ensured data integrity by identifying and deleting duplicate rows.  

---

## Exploratory Data Analysis (EDA)  
SQL queries were used to analyze content trends and extract actionable insights:  

### Key Analyses and Findings:  
1. **Most Common Release Years:**  
   - Identified the year with the highest number of releases, showcasing Netflix's most active periods.  
2. **Content Distribution by Type:**  
   - Compared the total number of movies versus TV shows to understand platform preferences.  
3. **Yearly Trends in Movie Releases:**  
   - Tracked the number of movies released each year to observe growth or decline in production over time.  
4. **Longest and Shortest Movies:**  
   - Highlighted the extremes in movie durations to uncover unique content offerings.  
5. **Top Content-Producing Countries:**  
   - Analyzed which countries contributed the most content, emphasizing regional contributions.  
6. **Popular Genres in the USA:**  
   - Explored the most common genres in the USA to identify local preferences.  
7. **Top Genres in Kids' TV:**  
   - Analyzed trends in children's programming under the "Kids' TV" category.  
8. **Prolific Directors in 2024:**  
   - Identified directors with the highest number of releases in 2024, highlighting their productivity.  
9. **Director-Specific Content:**  
   - Focused on titles from a specific director to showcase their contributions.  
10. **Recent Releases in the USA:**  
    - Examined movies released in 2021 that were produced in the USA, capturing recent trends.  
11. **Popular Genres by Country:**  
    - Compared popular genres across different countries to understand regional trends.  

---

## Key Insights  
1. Netflix's most active years for content production were characterized by an increasing focus on international content.  
2. Drama and Kids’ TV are dominant genres, highlighting the platform’s efforts to cater to family-oriented and story-driven audiences.  
3. Regional preferences influence content availability, with the USA leading in terms of diverse genres and production volume.  

---

## Business Recommendations  
1. **Focus on Regional Genres:** Expand popular genres in high-performing countries while exploring underrepresented genres in emerging markets.  
2. **Content Strategy for Kids:** Invest further in Kids' TV programming, as it remains a significant audience segment.  
3. **Retention through Diversity:** Leverage insights from prolific directors and regional content to enhance personalization for different audience segments.  

---

## Tools and Technologies  
- **SQL:** Used for data cleaning, exploration, and trend analysis.  
- **Database Management:** Queries executed on a structured dataset for consistent results.  

---

## Future Enhancements  
1. Incorporate user engagement metrics to analyze content performance.  
2. Use machine learning models for predicting popular genres in new markets.  
3. Expand analysis to include data from competitors like Disney+ or Amazon Prime Video.  

---

## Conclusion  
This project highlights the importance of clean, structured data in driving meaningful insights. By using SQL to explore Netflix’s dataset, actionable trends and strategies were identified to help the platform stay competitive and improve content recommendations.

---
