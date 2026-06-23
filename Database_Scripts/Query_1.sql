CREATE TABLE Fact_Sales (
    Transaction_ID INT PRIMARY KEY,
    Cust_Key INT,
    Product_ID INT,
    Quantity INT,
    Price DECIMAL(18,2),
    Purchase_Date DATETIME,
    Customer_Age INT -- ده العمود السحري اللي هنحسبه بالـ Expression جوه الـ SSIS!
);