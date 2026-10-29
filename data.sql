-- CUSTOMERS (customer 9 has no policy; customer 10 has a NULL state)
INSERT INTO customers VALUES (1, 'Asha Mehta',     'MH', '1985-04-12');
INSERT INTO customers VALUES (2, 'Rohan Iyer',     'KA', '1978-09-30');
INSERT INTO customers VALUES (3, 'Priya Nair',     'KL', '1990-01-22');
INSERT INTO customers VALUES (4, 'Vikram Singh',   'DL', '1982-07-08');
INSERT INTO customers VALUES (5, 'Neha Kulkarni',  'MH', '1993-11-15');
INSERT INTO customers VALUES (6, 'Arjun Rao',      'TS', '1975-03-03');
INSERT INTO customers VALUES (7, 'Sneha Das',      'WB', '1988-06-19');
INSERT INTO customers VALUES (8, 'Karan Shah',     'GJ', '1980-12-01');
INSERT INTO customers VALUES (9, 'Meera Pillai',   'KL', '1995-05-27');
INSERT INTO customers VALUES (10, 'Imran Khan',    NULL, '1987-08-14');

-- POLICIES (clean rows first)
INSERT INTO policies VALUES (101, 1, 'annuity', 25000, '2019-03-10', 'active', NULL);
INSERT INTO policies VALUES (102, 2, 'annuity', 15000, '2020-06-15', 'active', NULL);
INSERT INTO policies VALUES (103, 3, 'life',     8000, '2021-01-20', 'active', NULL);
INSERT INTO policies VALUES (104, 4, 'health',   5000, '2022-04-05', 'lapsed', NULL);
INSERT INTO policies VALUES (105, 5, 'annuity', 30000, '2018-09-12', 'surrendered', '2023-02-14');
INSERT INTO policies VALUES (106, 6, 'life',    12000, '2020-11-30', 'active', NULL);
INSERT INTO policies VALUES (107, 7, 'annuity', 18000, '2021-07-18', 'active', NULL);
INSERT INTO policies VALUES (108, 8, 'health',   6000, '2023-02-01', 'active', NULL);
INSERT INTO policies VALUES (109, 10, 'annuity',22000, '2019-12-05', 'active', NULL);
INSERT INTO policies VALUES (110, 1, 'life',     9500, '2022-08-22', 'active', NULL);

-- POLICIES (planted errors)
INSERT INTO policies VALUES (101, 7, 'annuity', 20000, '2020-02-02', 'active', NULL);        -- duplicate policy_id
INSERT INTO policies VALUES (111, 2, 'annuity', -5000, '2023-05-10', 'active', NULL);        -- negative premium
INSERT INTO policies VALUES (112, 3, 'annuity', 14000, '2022-03-01', 'surrendered', NULL);   -- surrendered, no surrender_date
INSERT INTO policies VALUES (113, 4, 'life',     7000, '2021-09-09', 'surrendered', '2020-12-01'); -- surrender before issue
INSERT INTO policies VALUES (114, 99, 'health',  4500, '2023-06-06', 'active', NULL);        -- customer 99 doesn't exist

-- PAYMENTS
INSERT INTO payments VALUES (1, 101, 25000, '2019-03-10');
INSERT INTO payments VALUES (2, 102, 15000, '2020-06-15');
INSERT INTO payments VALUES (3, 103,  2000, '2021-01-20');
INSERT INTO payments VALUES (4, 103,  2000, '2021-04-20');
INSERT INTO payments VALUES (5, 103,  2000, '2021-07-20');
INSERT INTO payments VALUES (6, 103,  2000, '2021-10-20');
INSERT INTO payments VALUES (7, 104,  1250, '2022-04-05');
INSERT INTO payments VALUES (8, 104,  1250, '2022-07-05');
INSERT INTO payments VALUES (9, 105, 30000, '2018-09-12');
INSERT INTO payments VALUES (10, 106, 12000, '2020-11-30');
INSERT INTO payments VALUES (11, 107, 18000, '2021-07-18');
INSERT INTO payments VALUES (12, 109, 22000, '2019-12-05');
INSERT INTO payments VALUES (13, 111,  5000, '2023-05-10');
INSERT INTO payments VALUES (14, 112, 14000, '2022-03-01');
INSERT INTO payments VALUES (15, 113,  7000, '2021-09-09');
INSERT INTO payments VALUES (16, 999,  3000, '2023-08-01'); -- payment for a policy that doesn't exist