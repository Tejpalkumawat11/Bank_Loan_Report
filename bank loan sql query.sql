SELECT * FROM bank_loan;

select count (id) as total_applications from bank_loan;


SELECT COUNT(id) AS MTD_total_loan_applications 
FROM bank_loan
WHERE EXTRACT(MONTH FROM issue_date) = 12
AND EXTRACT(YEAR FROM issue_date) = 2021;

SELECT COUNT(id) AS PMTD_total_loan_applications 
FROM bank_loan
WHERE EXTRACT(MONTH FROM issue_date) = 11
AND EXTRACT(YEAR FROM issue_date) = 2021;

SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan;

SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan
WHERE EXTRACT(MONTH FROM issue_date) = 12
AND EXTRACT (YEAR FROM issue_date) = 2021;

SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount 
FROM bank_loan
WHERE EXTRACT(MONTH FROM issue_date) = 11
AND EXTRACT (YEAR FROM issue_date) = 2021;


SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan;


SELECT SUM(total_payment) AS MTD_Total_Amount_Collected 
FROM bank_loan
WHERE EXTRACT(MONTH FROM issue_date) = 12
AND EXTRACT (YEAR FROM issue_date) = 2021;

SELECT SUM(total_payment) AS PMTD_Total_Amount_Collected 
FROM bank_loan
WHERE EXTRACT(MONTH FROM issue_date) = 11
AND EXTRACT (YEAR FROM issue_date) = 2021;


SELECT AVG(int_rate)*100 AS Avg_Int_Rate FROM bank_loan;


SELECT AVG(int_rate)*100 AS MTD_Avg_Int_Rate 
FROM bank_loan
WHERE EXTRACT(MONTH FROM issue_date) = 12
AND EXTRACT (YEAR FROM issue_date) = 2021;


SELECT AVG(int_rate)*100 AS PMTD_Avg_Int_Rate 
FROM bank_loan
WHERE EXTRACT(MONTH FROM issue_date) = 11
AND EXTRACT (YEAR FROM issue_date) = 2021;


SELECT AVG(dti)*100 AS Avg_DTI FROM bank_loan;


SELECT AVG(dti)*100 AS MTD_Avg_DTI 
FROM bank_loan
WHERE EXTRACT(MONTH FROM issue_date) = 12
AND EXTRACT (YEAR FROM issue_date) = 2021;


SELECT AVG(dti)*100 AS PMTD_Avg_DTI 
FROM bank_loan
WHERE EXTRACT(MONTH FROM issue_date) = 11
AND EXTRACT (YEAR FROM issue_date) = 2021;


SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / 
	COUNT(id) AS Good_Loan_Percentage
FROM bank_loan;



SELECT COUNT(id) AS Good_Loan_Applications FROM bank_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

SELECT SUM(loan_amount) AS Good_Loan_Funded_amount FROM bank_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';



SELECT SUM(total_payment) AS Good_Loan_amount_received FROM bank_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM bank_loan;


SELECT COUNT(id) AS Bad_Loan_Applications FROM bank_loan
WHERE loan_status = 'Charged Off';


SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM bank_loan
WHERE loan_status = 'Charged Off';

SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM bank_loan
WHERE loan_status = 'Charged Off';


SELECT
        loan_status,
        COUNT(id) AS LoanCount,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        bank_loan
    GROUP BY
        loan_status;


SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan
WHERE EXTRACT(MONTH FROM issue_date) = 12
AND EXTRACT (YEAR FROM issue_date) = 2021
GROUP BY loan_status;




SELECT 
    EXTRACT(MONTH FROM issue_date) AS Month_Number, 
    TO_CHAR(issue_date, 'Month') AS Month_Name, 
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM bank_loan
GROUP BY EXTRACT(MONTH FROM issue_date), TO_CHAR(issue_date, 'Month')
ORDER BY EXTRACT(MONTH FROM issue_date);


SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan
GROUP BY address_state
ORDER BY address_state;


SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan
GROUP BY term
ORDER BY term;


SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan
GROUP BY emp_length
ORDER BY emp_length;


SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan
GROUP BY purpose
ORDER BY purpose;


SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan
GROUP BY home_ownership
ORDER BY home_ownership;


SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan
WHERE grade = 'A'
GROUP BY purpose
ORDER BY purpose;











