SELECT * FROM expense_categories
SELECT * FROM expense_subcategories
SELECT * FROM family_members
SELECT * FROM payment_methods
SELECT * FROM vendors
SELECT * FROM expenses

#1. Household Expense Overview
#The family wants to see its complete expense history.
SELECT * FROM expenses
#Details of all the family's expenses were obtained.

#2. High-Value Expenses
#The family wants to identify expenses that require special attention.
#Find all expenses where the amount is greater than ₹2,000.
SELECT * FROM expenses
WHERE amount > 2000
#Total 7 records have expenses greater than 2000

#3. Small Daily Expenses
#The family suspects that many small expenses are gradually increasing its overall spending.
#Find all expenses where the amount is less than ₹500.
SELECT * FROM expenses
WHERE amount < 500
#Only 2 records have expenses less than 500

#4. Expense Range
#The family wants to review expenses between ₹1,000 and ₹5,000.
#Find all such expenses using comparison operators.
SELECT * FROM expenses
WHERE amount>=1000 AND amount<=5000
#8 records obtained expenses between 1000 and 5000

#5. Exceptional Expenses
#The family wants to identify unusually large transactions.
#Find all expenses where the amount is ₹10,000 or more.
SELECT * FROM expenses
WHERE amount >= 10000
#only 1 record has expense more than 10000
#That is a collage fees not a regular expense

#6. Payment Methods Used
#The family uses different methods to pay its expenses.
#Find the different payment methods used in the expense records.
SELECT * FROM payment_methods
#In the record family uses 7 different types payment methods

#7. UPI Spending
#The family wants to know which transactions were paid using UPI.
#Display all UPI transactions.
SELECT * FROM expenses
WHERE payment_method_id=2
#9 payments done by UPI

#8. Cash Spending
#Find all expenses paid using Cash.
SELECT * FROM expenses
WHERE payment_method_id=1
#Only 3 paymnets done with cash

#9. Large UPI Transactions
#The family wants to review high-value digital payments.
#Find expenses where:
#amount is greater than ₹2,000
#AND payment method is UPI.
SELECT * FROM expenses
WHERE payment_method_id=2 AND amount>2000
#5 transaction amount greater than 2000 done by UPI

#10. Cash or UPI
#Find expenses greater than ₹2,000 where the payment method was either Cash or UPI.
#Use OR appropriately.
SELECT * FROM expenses
WHERE payment_method_id=1 OR payment_method_id=2 AND amount>2000
#8 transaction where amount greater than 2000 done with cash or UPI

11. Non-UPI Expenses
The family wants to identify transactions that were not paid through UPI.
Display those expenses.
SELECT * FROM expenses
WHERE NOT payment_method_id=2
#6 transactions are non UPI

#12. Regular Household Commitments
#The family wants to identify expenses that occur regularly.
#Find all recurring expenses.
SELECT * FROM expenses
WHERE is_recurring=true
#In 6 transactions recurring is happened

#13. Cost of Recurring Expenses
#Calculate the total amount committed to recurring expenses.
SELECT SUM(amount) FROM expenses
WHERE is_recurring=true 
#Sum of all recurring amount is 40949

#14. Expensive Recurring Commitments
#The family wants to review recurring commitments costing more than ₹1,000.
#Find all recurring expenses where:
#amount > ₹1,000
SELECT * FROM expenses
WHERE is_recurring=true AND amount>1000
#4 transactions is greater than 1000 is recurring

#15. Pending Payments
#The family wants to identify payments that still require attention.
#Find all expenses whose payment status is:
#PENDING or PARTIAL
SELECT * FROM expenses
WHERE paid_status='PENDING' OR paid_status='PARTIAL'
#There is no any pending payments

#16. Recurring Pending Expenses
#Identify expenses that are:
#recurring
#AND pending
#These are important because they represent regular financial commitments that have not yet been settled.
SELECT * FROM expenses
WHERE is_recurring=true AND paid_status='PENDING'
#There is no any that type of expenses identify

#17. Number of Transactions
#How many individual expense transactions have been recorded by the family?
SELECT COUNT(*) FROM expenses
#15 individual transaction have been recorded by family

#18. Total Household Spending
#Calculate the total amount spent across all recorded expenses.
SELECT SUM(amount) FROM expenses
#57349 spent across all recorded expenses by family

#19. Average Expense
#Calculate the average amount spent per transaction.
SELECT AVG(amount) FROM expenses
#3823 average amount spent per transaction by family

#20. Highest and Lowest Expenses
#Find:
#highest expense
#lowest expense
#The family wants to understand the range of its spending.
SELECT MIN(amount), MAX(amount) FROM expenses
#minimum speding amount 300 amd maximum spending amount 25000

#21. Different Expense Types
#ind the number of different subcategories in which the family has recorded expenses.
#Use DISTINCT.
SELECT COUNT(DISTINCT subcategory_id)FROM expenses
#15 different sub categories is obtained

#22. Expenses of a Particular Family Member
#The family wants to review expenses associated with member_id = 1.
#Find:
#number of transactions
#total amount spent
#average expense amount
#for this family member.
SELECT COUNT(*), SUM(amount), AVG(amount) FROM expenses
WHERE member_id=1
#member_id 1 name is Rajesh. He is done 9 transaction and spending is 23849 and average is 2649

#23. Vendor Search
#The family remembers that it made a payment to a vendor whose name contains the word:
#"Hospital"
#Find that vendor using pattern matching.
SELECT * FROM vendors
WHERE vendor_name LIKE '%Hospital%'
#Family paid city hospital bill

#24. Store Search
#Find vendors whose name contains:
#"Store"
SELECT * FROM vendors
WHERE vendor_name LIKE '%Store%'
#The family purchase grocery by local kirana store

#25. Monthly Expenses
#The family wants to identify expenses whose description contains the word:
#"Monthly"
#Use LIKE.
SELECT * FROM expenses
WHERE description LIKE '%Monthly%'
#In the description obtained Month 3 times

#26. Bill-Related Subcategories
#Find subcategories whose names contain the word:
#"Bill"
SELECT * FROM expense_subcategories
WHERE subcategory_name LIKE '%Bill%'
#Bill is obtained in subcategory_name

#27. Starting Letter Search
#Find vendors whose names start with the letter "A".
SELECT * FROM vendors
WHERE vendor_name LIKE 'A%'
#The vendor name is Apollo Pharmacy

#28. High-Priority Expenses
#The family wants to identify expenses satisfying either of these conditions:
#amount is greater than ₹5,000
#OR
#amount is greater than ₹2,000 AND payment was made through UPI.
#Write the query and carefully consider operator precedence.
SELECT * FROM expenses
WHERE amount>5000 OR (amount>2000 AND payment_method_id=2)
#Got all the amount greater than 5000 and 2000 which is paid by UPI

#29. Expenses Requiring Review
#Find expenses that are:
#recurring
#AND amount greater than ₹2,000
#AND payment status is PAID
SELECT * FROM expenses
WHERE is_recurring='true' AND amount > 2000 AND paid_status='PAID'
#The recurring amount is true and greater than 2000 and payment status is paid

#30. Unusual Spending
#Find expenses where:
#amount is less than ₹500
#OR
#amount is greater than ₹5,000
#but exclude expenses that are PENDING.
#Use AND, OR, NOT and appropriate parentheses.
SELECT * FROM expenses
WHERE amount < 500 OR amount > 5000
AND NOT paid_status = 'PENDING'
#amount less than 500 or greater than 5000 and payment status is paid