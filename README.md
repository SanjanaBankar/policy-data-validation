# Policy Data Validation in SQL

A small insurance database with deliberately planted data errors, and SQL queries that find them. Built to practice the kind of verification QA engineers do when checking that application data matches the database.

## What this project is
- A 3-table insurance schema: `customers`, `policies`, `payments`
- Sample data (10 customers, 15 policies, 16 payments) with **known, planted errors**
- 26 SQL queries covering filtering, sorting, aggregation, grouping and data-integrity checks

## Tools
- SQLite
- VS Code with the SQLite extension

## Why there are no primary keys or constraints
Left off on purpose. Legacy systems and bad migrations produce duplicates, orphans and impossible values, and a strict table would reject them. The goal here is to *detect* bad data with SQL, so the tables accept it.

## Project structure
| File | Purpose |
|---|---|
| `schema.sql` | Drops and recreates the three tables |
| `data.sql` | Inserts sample data, including the planted errors |
| `queries.sql` | All queries, each labelled with what it checks |

## How to run it
1. Open the folder in VS Code and install the **SQLite** extension (alexcvzz).
2. Create a database named `policies.db` (Command Palette → *SQLite: Open Database*).
3. Run `schema.sql`, then run `data.sql` **once**.
4. Open `queries.sql`, highlight a query and run it (Command Palette → *SQLite: Run Query*).

To reset at any time, run `schema.sql` again and then `data.sql`.
Row counts after loading should be: 10 customers, 15 policies, 16 payments.

## Planted bugs and the queries that catch them
| Planted bug | Query | What it finds |
|---|---|---|
| Duplicate policy ID | F4 (`GROUP BY` + `HAVING COUNT(*) > 1`) | Policy 101 appears twice |
| Negative premium | F1 (`WHERE premium < 0`) | Policy 111 |
| Surrendered policy with no surrender date | F2 (`IS NULL`) | Policy 112 |
| Surrender date before issue date | F3 (date comparison) | Policy 113 |
| Customer with no state | B7 (`IS NULL`) | Customer 10 |
| Policy whose customer doesn't exist | LEFT JOIN customers, WHERE customer_id IS NULL | Policy 114 |
| Payment whose policy doesn't exist | LEFT JOIN policies, WHERE policy_id IS NULL | Payment 16 |
| Active policies with no payments | LEFT JOIN payments, WHERE payment_id IS NULL | Policies 108, 110, 114 |

## Query categories
- **A.** Viewing tables
- **B.** Filtering (`WHERE`, `IN`, `BETWEEN`, `LIKE`, `IS NULL`)
- **C.** Sorting and limiting (`ORDER BY`, `LIMIT`)
- **D.** Aggregates (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`, `DISTINCT`)
- **E.** Grouping (`GROUP BY`, `HAVING`)
- **F.** Data validation checks

## What I learned
- Writing SQL checks to validate data against business rules
- Using `GROUP BY` and `HAVING` to find duplicates
- Handling `NULL` values correctly with `IS NULL`
- Designing test data with known defects, so every check can be verified against an answer key

## Next steps
- Add a Python script that runs all checks and prints a pass/fail report