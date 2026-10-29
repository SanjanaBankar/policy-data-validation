DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS policies;
DROP TABLE IF EXISTS payments;
CREATE TABLE customers (
    customer_id INTEGER,
    name        TEXT,
    state       TEXT,
    dob         TEXT
);

CREATE TABLE policies (
    policy_id      INTEGER,
    customer_id    INTEGER,
    product_type   TEXT,
    premium        REAL,
    issue_date     TEXT,
    status         TEXT,
    surrender_date TEXT
);

CREATE TABLE payments (
    payment_id   INTEGER,
    policy_id    INTEGER,
    amount       REAL,
    payment_date TEXT
);