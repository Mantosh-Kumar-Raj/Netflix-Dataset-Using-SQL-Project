# Netflix Movies and TV Shows Data Analysis Using SQL
This project analyzes Netflix's movies and TV shows data to derive insights into content distribution, ratings, genres, and geographical trends. It explores various aspects such as the most frequent ratings, content releases by country, and categorizes content based on specific keywords.

## Overview
This project involves a detailed analysis of Netflix's movies and TV shows data. The goal is to derive valuable insights based on various business questions surrounding Netflix's content, such as the distribution of content types, most common ratings, content release trends by year and country, and content categorization based on specific keywords.

## Objectives

- **Content Distribution Analysis**: Determine the distribution of content types (movies vs TV shows).
- **Rating Insights**: Identify the most common ratings for both movies and TV shows.
- **Content Trend Analysis**: Analyze content based on release years, countries, and durations.
- **Content Categorization**: Explore content based on specific keywords (e.g., 'Kill', 'Violence') and categorize them accordingly.

## Schema

The database schema used for this analysis includes the following fields:

- **show_id**: Unique identifier for each show.
- **type**: Type of content (Movie or TV Show).
- **title**: Title of the show.
- **director**: Director(s) of the show.
- **casts**: Casts involved in the show.
- **country**: Country/region where the show is from.
- **date_added**: Date when the show was added to the platform.
- **release_year**: Year the show was released.
- **rating**: Rating of the show.
- **duration**: Duration of the show (for TV Shows, it represents the number of seasons).
- **listed_in**: Genres or categories the show belongs to.
- **description**: Brief description of the show.

## Key Insights and Findings

### 1. Content Type Distribution
The analysis identifies how many movies and TV shows are available on Netflix. This helps in understanding the overall content balance on the platform.

### 2. Most Common Ratings
By analyzing the ratings, this project provides insights into which ratings are most prevalent for each type of content. This allows us to understand the target audience for different types of content.

### 3. Content by Year
This analysis explores the content released in specific years. By examining release years, trends in content creation over time can be observed, helping to identify peak periods for content releases.

### 4. Geographical Insights
Identifying the top countries with the most content provides insights into regional content distribution on Netflix. It also helps in understanding which countries have a dominant presence on the platform.

### 5. Content Added Recently
The project also explores content added to Netflix in the last 5 years, shedding light on recent trends in Netflix’s content acquisition strategy.

### 6. TV Shows with More Than 5 Seasons
By analyzing TV shows with more than 5 seasons, we can identify the long-running TV shows and their potential influence on viewership and content strategy.

### 7. Content Without a Director
This analysis highlights shows that do not have a director, which may indicate missing or ambiguous metadata, or perhaps certain types of shows that don’t follow conventional production structures.

### 8. Actor-Based Analysis
By tracking actors’ appearances in movies, particularly those featuring prominent Indian actors such as 'Salman Khan,' the project uncovers trends regarding actor involvement in Netflix productions.

### 9. Content Categorization
Categorizing content based on keywords like "kill" or "violence" provides insight into the type of content Netflix hosts. It distinguishes between content that may be considered violent or dark and more light-hearted or positive content.

### 10. India-Specific Content Analysis
The analysis also focuses on content from India, including the average number of releases each year. By evaluating how much Indian content is being produced, we gain insights into Netflix’s engagement with the Indian market.

## Conclusion

This analysis of Netflix’s movie and TV show data helps in understanding the distribution of content on the platform, common ratings, geographical trends, and categorization based on content descriptions. By leveraging these insights, Netflix could better plan content strategies, target audiences more effectively, and make data-driven decisions about future content acquisitions.
