CREATE TABLE Dim_Customers (
    Cust_Key INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Birth_Date DATETIME
);

-- ضيف جواه حبة داتا وهمية من عندك عشان الـ Lookup تلاقي حاجة تطابقها:
INSERT INTO Dim_Customers VALUES (1, 'Ahmed Sohag', '2002-06-08');
INSERT INTO Dim_Customers VALUES (2, 'Mohamed Cairo', '1995-03-12');
INSERT INTO Dim_Customers VALUES (3, 'Mostafa Alex', '1988-11-20');