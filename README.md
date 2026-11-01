# Banking Customer Analytics Dashboard

Customer and transaction analytics for a fictional regional bank, built with **MySQL**, **pandas** and an interactive **Plotly Dash** dashboard.

## Business problem

A regional bank wants to understand its customers better, so that it can improve its services, raise customer satisfaction and find growth opportunities. This project answers five questions with SQL:

1. How many customers hold multiple accounts, and how are accounts distributed per customer?
2. What is the average balance for each account type (Savings, Checking or Loan)?
3. Who are the top 5 customers by transaction amount over the last 6 months?
4. How many large loans (over $5,000) are there, and what is their total value?
5. How does the monthly transaction volume trend over the past year?

See [`sql/analysis_queries.sql`](sql/analysis_queries.sql) for the queries and [`Project_Brief.docx`](Project_Brief.docx) for the full brief.

## Dashboard

[`banking_dashboard.ipynb`](banking_dashboard.ipynb) loads the three tables from MySQL and then:

- explores the data with seaborn: balance distribution, accounts per customer, and transaction amounts by type
- serves a **Dash** web app with:
  - an accounts-per-customer bar chart
  - a customer dropdown that updates that customer's account balances and transaction summary

## Data model

```
Customers (CustomerID, FirstName, LastName, Email)
    │ 1..*
Accounts (AccountID, CustomerID, AccountType, Balance)
    │ 1..*
Transactions (TransactionID, AccountID, TransactionType, Amount, TransactionDate)
```

The sample data is 20 customers, 20 accounts and 21 transactions. It is all fictional.

## Running it

```bash
# 1. Create the database and load the sample data
mysql -u root -p < sql/schema.sql

# 2. Install the dependencies
pip install pandas mysql-connector-python dash plotly seaborn matplotlib jupyter

# 3. (Optional) set connection details; the defaults are localhost / root / no password / bank_db
export DB_HOST=localhost DB_USER=root DB_PASSWORD=yourpassword DB_NAME=bank_db

# 4. Run the notebook, then open http://127.0.0.1:8050
jupyter notebook banking_dashboard.ipynb
```

## Tech stack

MySQL · SQL · Python · pandas · Plotly Dash · seaborn · matplotlib
