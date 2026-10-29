-- A1: all customers (10 rows)
SELECT * FROM customers;

-- A2: all policies (15 rows)
SELECT * FROM policies;

-- A3: all payments (16 rows)
SELECT * FROM payments;

-- B1: active policies (11 rows)
-- SELECT * FROM policies WHERE status = 'active';

-- B2: lapsed or surrendered policies (4 rows)
-- SELECT * FROM policies WHERE status IN ('lapsed', 'surrendered');

-- B3: premium between 5000 and 10000 (5 rows)
-- SELECT policy_id, product_type, premium
-- FROM policies
-- WHERE premium BETWEEN 5000 AND 10000;

-- B4: policies issued in 2021 or later (9 rows)
-- SELECT policy_id, product_type, issue_date
-- FROM policies
-- WHERE issue_date >= '2021-01-01';

-- B5: customers from Maharashtra (2 rows)
-- SELECT * FROM customers WHERE state = 'MH';

-- B6: customer names starting with A (2 rows: Asha, Arjun)
-- SELECT * FROM customers WHERE name LIKE 'A%';

-- B7: customers with no state recorded (1 row)
-- SELECT * FROM customers WHERE state IS NULL;

-- C1: customers A to Z (10 rows)
-- SELECT * FROM customers ORDER BY name ASC;

-- C2: top 3 premiums (30000, 25000, 22000)
-- SELECT policy_id, premium FROM policies ORDER BY premium DESC LIMIT 3;

-- C3: 3 oldest customers by date of birth (Arjun, Rohan, Karan)
-- SELECT name, dob FROM customers ORDER BY dob ASC LIMIT 3;

-- D1: total number of policies (15)
-- SELECT COUNT(*) AS total_policies FROM policies;

-- D2: distinct product types (3 rows)
-- SELECT DISTINCT product_type FROM policies;

-- D3: premium summary (total 191000, average about 12733.33, min -5000, max 30000)
-- SELECT SUM(premium) AS total_premium,
       -- AVG(premium) AS avg_premium,
       -- MIN(premium) AS min_premium,
       -- MAX(premium) AS max_premium
-- FROM policies;

-- E1: policies per product type (annuity 8, life 4, health 3)
-- SELECT product_type, COUNT(*) AS total_policies
-- FROM policies
-- GROUP BY product_type;

-- E2: policies per status (active 11, lapsed 1, surrendered 3)
-- SELECT status, COUNT(*) AS total
-- FROM policies
-- GROUP BY status;

-- E3: total premium per product type (annuity 139000, life 36500, health 15500)
-- SELECT product_type, SUM(premium) AS total_premium
-- FROM policies
-- GROUP BY product_type;

-- E4: customers per state (8 rows, MH and KL have 2 each)
-- SELECT state, COUNT(*) AS customers
-- FROM customers
-- GROUP BY state;

-- E5: total paid per policy (12 rows, including the fake policy 999)
-- SELECT policy_id, SUM(amount) AS total_paid
-- FROM payments
-- GROUP BY policy_id;

-- E6: policies with more than 1 payment (103 has 4, 104 has 2)
-- SELECT policy_id, COUNT(*) AS payment_count
-- FROM payments
-- GROUP BY policy_id
-- HAVING COUNT(*) > 1;

-- F1: negative premium (policy 111)
-- SELECT * FROM policies WHERE premium < 0;

-- F2: surrendered but no surrender date (policy 112)
-- SELECT * FROM policies
-- WHERE status = 'surrendered' AND surrender_date IS NULL;

-- F3: surrender date before issue date (policy 113)
-- SELECT * FROM policies WHERE surrender_date < issue_date;

-- F4: duplicate policy IDs (policy 101, 2 copies)
-- SELECT policy_id, COUNT(*) AS copies
-- fROM policies
-- GROUP BY policy_id
-- HAVING COUNT(*) > 1;