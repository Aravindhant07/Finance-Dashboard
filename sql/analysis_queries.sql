-- Business questions answered with SQL (see project brief)
USE bank_db;

-- 1. How many customers have multiple accounts, and what is the distribution of the number of accounts per customer?
SELECT CustomerID, COUNT(AccountID) AS NumberOfAccounts
FROM Accounts
GROUP BY CustomerID
HAVING NumberOfAccounts > 1
ORDER BY NumberOfAccounts DESC;
-- This query helps identify customers with multiple accounts, which can indicate higher engagement or diverse financial needs.

-- 2. What is the average balance across different account types?
SELECT AccountType, AVG(Balance) AS AverageBalance
FROM Accounts
GROUP BY AccountType;
-- Understanding the average balance per account type (Savings, Checking, Loan) can help the bank tailor its financial products.

-- 3. Identify the top 5 customers by total transaction amount in the last 6 months.
SELECT a.CustomerID, SUM(t.Amount) AS TotalTransactionAmount
FROM Transactions t
JOIN Accounts a ON t.AccountID = a.AccountID
WHERE t.TransactionDate > CURDATE() - INTERVAL 6 MONTH
GROUP BY a.CustomerID
ORDER BY TotalTransactionAmount DESC
LIMIT 5;
-- This query identifies the bank's most active customers by transaction volume, which could be useful for targeted marketing campaigns or loyalty programs.

-- 4. How many loans have a balance greater than $5,000, and what is their total value?
SELECT COUNT(AccountID) AS NumberOfLoans, SUM(Balance) AS TotalLoanValue
FROM Accounts
WHERE AccountType = 'Loan' AND Balance < -5000;
-- This query provides insights into the size and value of larger loans, which can help assess the bank's risk exposure and loan product performance.

-- 5. What is the monthly transaction volume (number of transactions) trend over the past year?
SELECT MONTH(TransactionDate) AS Month, YEAR(TransactionDate) AS Year, COUNT(TransactionID) AS NumberOfTransactions
FROM Transactions
WHERE TransactionDate >= CURDATE() - INTERVAL 1 YEAR
GROUP BY YEAR(TransactionDate), MONTH(TransactionDate)
ORDER BY Year, Month;
-- Analyzing transaction volume trends can help the bank understand customer activity patterns and plan for peak periods.
