# Netflix Content Analysis | SQL

A SQL analytics project exploring Netflix movies and TV shows through business-oriented questions. The analysis covers content types, ratings, release years, countries, genres, directors, actors, and keyword-based categorization.

## Objective
Use SQL to turn a catalogue dataset into structured answers about Netflix's content library. The focus is on query design, aggregation, filtering, common table expressions, and ranking—not on claiming access to Netflix's internal viewing or recommendation data.

## Dataset
- **File:** netflix_titles.csv
- **Scope:** Catalogue metadata for movies and TV shows, including fields such as title, type, director, cast, country, date added, release year, rating, duration, and listed genres.
- The dataset describes catalogue metadata; it does not provide individual viewing counts or streaming performance.

## Business Questions
1. How many records are movies versus TV shows?
2. Which ratings occur most frequently by content type?
3. What content was released in a selected year?
4. Which countries have the largest number of catalogue entries?
5. Which movie has the longest recorded duration?
6. What content was added within a selected time window?
7. Which titles are associated with a selected director?
8. Which TV shows have more than five seasons?
9. How is content distributed across listed genres?
10. How do Indian catalogue entries vary by release year?
11. Which titles are classified as documentaries?
12. Which records have missing director information?
13. How often does a selected actor appear in the catalogue?
14. Which actors appear most frequently in Indian-produced titles?
15. Which descriptions contain selected violence-related keywords?

These are exploratory catalogue questions, not direct measures of audience demand or title profitability.

## SQL Concepts Demonstrated
- Aggregations and GROUP BY
- Filtering and sorting
- CASE expressions
- Common table expressions (CTEs)
- String parsing and handling multi-value fields
- Date filtering
- Ranking and top-N analysis
- Null handling and data-quality checks

## Repository Contents
| File | Purpose |
|---|---|
| netflic_solution.sql | SQL solutions for the analysis |
| netflix_titles.csv | Dataset |
| README.md | Project documentation |
| netflix-logo-netflix-icon-free-free-vector.jpg | Project image asset |

## How to Run
1. Download or clone the repository.
2. Load netflix_titles.csv into your SQL environment.
3. Inspect the column names and data types before running the queries.
4. Execute the SQL statements in netflic_solution.sql, adjusting date parsing and string functions for your database engine if needed.

The SQL file is the source of truth for exact query logic. Some questions depend on how country and genre values are stored in delimited strings, so results may differ if those fields are normalized differently.

## Interpretation and Limitations
- Catalogue counts do not equal views, popularity, or revenue.
- A title can list multiple countries or genres; splitting these fields affects counting.
- Date added and release year represent different concepts.
- Keyword-based classification is approximate and can produce false positives or false negatives.
- Numerical findings should be copied from executed queries and checked before being presented as conclusions.

## Skills Demonstrated
SQL · Data exploration · Query design · CTEs · Aggregation · Ranking · Text processing · Data-quality awareness · Business-question framing

## Author
**Yazdan Ahmed**  
[GitHub Portfolio](https://github.com/YazdanAhmedData)
