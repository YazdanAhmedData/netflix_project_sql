# 🎬 Netflix Content Catalogue Analysis | SQL

![Netflix logo](https://github.com/YazdanAhmedData/netflix_project_sql/blob/main/netflix-logo-netflix-icon-free-free-vector.jpg)

**Portfolio case study · SQL analytics · Content catalogue · Business questions**

## Executive Summary
This project uses SQL to explore Netflix movie and TV-show catalogue metadata. It answers 15 structured questions about content type, ratings, release years, countries, duration, genres, directors, cast and description keywords.

**Scope clarity:** the dataset describes catalogue metadata. It does not contain internal Netflix viewership, watch time, recommendation exposure or title revenue, so this project does not claim to measure audience popularity or profitability.

## Business Problem
A content catalogue can be analysed to understand its composition and how it changes over time. Catalogue teams, researchers and editors may want to compare the balance of movies and TV shows, examine rating categories, inspect country/genre representation and understand missing metadata.

The SQL workflow turns a flat catalogue file into reproducible answers to business-style questions.

## Dataset
- **File:** `netflix_titles.csv`
- **Fields include:** show ID, type, title, director, cast, country, date added, release year, rating, duration, listed genres and description.
- **Source:** the project README previously referenced the public Netflix titles dataset from Kaggle; see the dataset source page before redistributing data.

## Questions Answered
1. Count movies versus TV shows.
2. Find the most frequent rating by content type.
3. Filter titles released in a selected year.
4. Find countries with the largest catalogue representation.
5. Identify the longest movie.
6. Find content added within a selected time window.
7. Find titles associated with a selected director.
8. List TV shows with more than five seasons.
9. Count titles by genre.
10. Examine India's catalogue entries by year.
11. Identify documentary titles.
12. Find records missing director information.
13. Search for titles associated with a selected actor.
14. Find frequently appearing actors in Indian titles.
15. Search descriptions for selected keywords.

## KPI / Analytical Framework
| Measure | Definition | What it tells us |
|---|---|---|
| Catalogue mix | Count by `type` | Balance of movies and TV shows |
| Rating distribution | Count by type and rating | Catalogue classification patterns |
| Country representation | Count titles by parsed country | Geographic catalogue footprint |
| Genre mix | Count titles by parsed genre | Content-category composition |
| Release-year distribution | Count by release year | Historical catalogue composition |
| Additions over time | Count by `date_added` period | Observed catalogue additions |
| Metadata completeness | Count / share with missing director or other fields | Data quality and coverage |
| Duration / seasons | Parsed runtime or season count | Catalogue characteristics |

## Business Insights & Decision Use
- **Catalogue mix:** compare movie and TV-show counts to describe the library's composition, not its audience preference.
- **Country and genre representation:** identify categories that are more or less represented and propose deeper content-mix questions.
- **Release year vs date added:** separate when a title was released from when it appeared in the catalogue.
- **Metadata quality:** missing director/country fields can affect grouping and reporting; make null handling explicit.
- **Keyword-based categorisation:** use text search as an exploratory filter, not a reliable content-classification system.

Add the exact count and strongest findings from a fresh SQL run before presenting numeric conclusions. Counts can vary if multi-value country/genre fields are split differently.

## SQL Concepts Demonstrated
- Table creation and schema design
- Aggregation, `GROUP BY` and filtering
- `CASE` expressions and null handling
- Window functions such as `RANK()`
- Common table expressions in the project family
- Date parsing and interval filters
- String splitting for multi-value fields
- Ranking and top-N analysis

## Repository Contents
| File | Purpose |
|---|---|
| `netflic_solution.sql` | SQL schema and analysis queries |
| `netflix_titles.csv` | Source dataset |
| `netflix-logo-netflix-icon-free-free-vector.jpg` | Project image asset |

## How to Run
1. Create a database using a PostgreSQL-compatible environment.
2. Execute the schema at the start of `netflic_solution.sql`.
3. Load `netflix_titles.csv` into the `netflix` table.
4. Run each query and inspect the result before recording findings.
5. Adjust date parsing and string functions if using a different SQL engine.

## Data Quality & Limitations
- Catalogue entries do not reveal views, watch time, revenue or popularity.
- Country and genre columns can contain multiple values; splitting and grouping logic affects counts.
- The country-count query should group by the parsed country value rather than the unsplit original field.
- Date-added parsing depends on the source format and SQL engine.
- Keyword search can generate false positives and false negatives.
- Use query outputs, not assumptions, for numeric findings.

## Next Steps
- Fix and test the country aggregation and date parsing.
- Add query result snapshots for the most useful findings.
- Include a short data dictionary and explicit null-handling choices.
- Consolidate overlapping Netflix SQL work into one canonical recruiter-facing project.

## Author
**Yazdan Ahmed** · [GitHub Portfolio](https://github.com/YazdanAhmedData)
