# Enterprise Retail Sales ETL Pipeline 🚀

An enterprise-grade, end-to-end Data Integration (ETL) pipeline designed to automate daily sales data ingestion from distributed retail branches into a centralized Data Warehouse. Built using **MS SQL Server Integration Services (SSIS)** and **SQL Server Management Studio (SSMS)**, this project adheres to modern data warehousing practices and data quality tracking.

## 📌 Business Problem & Case Study
A retail company with multiple branches (`Cairo`, `Alex`, `Aswan`) generates daily transactional sales data in flat file formats (`.csv`). These files are dropped into a shared network directory. The goal is to:
1. Automate data ingestion seamlessly without hardcoding file paths.
2. Ensure data consistency by validating customer existence.
3. Apply real-time business logic transformation (dynamic customer age calculation).
4. Isolate invalid data for auditing while moving clean data to production tables.

---

## 🛠️ Tech Stack & Tools
- **ETL Engine:** Microsoft SQL Server Integration Services (SSIS)
- **Database Architecture:** Microsoft SQL Server (SSMS)
- **Design & Blueprinting:** Draw.io
- **Data Modeling:** Dimensional Modeling (Fact & Dimension Tables)

---

## 📐 Data Pipeline Architecture (Blueprint)

### 1. Control Flow Automation
- **Truncate Staging:** An `Execute SQL Task` ensures idempotency by clearing the staging area before every execution loop.
- **Foreach Loop Container:** Dynamically enumerates all `.csv` files inside the target directory using expressions and assigning the current file path to a variable (`@[User::FilePath]`).

### 2. Data Flow Transformation Pipeline
- **Flat File Source:** Reads file streams dynamically based on runtime connection configuration.
- **Data Conversion:** Handles strict metadata typing by casting textual customer keys into `four-byte signed integer [DT_I4]`.
- **Lookup Validation (Full Cache):** Matches incoming sales data with the master database (`Dim_Customers`).
  - **Match Output:** Proceeds downstream to the core warehouse layer.
  - **No-Match Output:** Dynamically redirected to a fallback auditing table (`Error_Unknown_Customers`).
- **Derived Column Transformation:** Injects real-time business logic using explicit casting and the `DATEDIFF` interval function:
  ```text
  DATEDIFF("yy", (DT_DATE)[Birth_Date], (DT_DATE)[Purchase_Date])
