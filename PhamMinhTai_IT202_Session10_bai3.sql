-- =========================================
-- TẠO DATABASE
-- =========================================
CREATE DATABASE HospitalFinance;
USE HospitalFinance;

-- =========================================
-- BẢNG KHOA
-- =========================================
CREATE TABLE Departments (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(100)
);

-- =========================================
-- BẢNG BỆNH NHÂN
-- =========================================
CREATE TABLE Patients (
    Patient_ID INT PRIMARY KEY,
    Full_Name VARCHAR(100)
);

-- =========================================
-- BẢNG HÓA ĐƠN
-- =========================================
CREATE TABLE Invoices (
    Invoice_ID INT PRIMARY KEY,
    Patient_ID INT,
    Dept_ID INT,
    Amount DECIMAL(10,2),

    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
    FOREIGN KEY (Dept_ID) REFERENCES Departments(Dept_ID)
);

-- =========================================
-- CHÈN DỮ LIỆU MẪU
-- =========================================
INSERT INTO Departments
VALUES
(1, 'Noi'),
(2, 'Ngoai');

INSERT INTO Patients
VALUES
(1, 'Nguyen Van A'),
(2, 'Tran Thi B'),
(3, 'Le Van C');

INSERT INTO Invoices
VALUES
(101, 1, 1, 500.00),
(102, 2, 1, 300.00),
(103, 3, 2, 1000.00);

-- =========================================
-- TẠO VIEW BÁO CÁO TÀI CHÍNH
-- =========================================
CREATE VIEW Department_Revenue_View AS
SELECT
    d.Dept_Name AS Department_Name,

    COUNT(DISTINCT i.Patient_ID) AS Total_Patients,

    SUM(i.Amount) AS Total_Revenue

FROM Departments d

JOIN Invoices i
ON d.Dept_ID = i.Dept_ID

JOIN Patients p
ON p.Patient_ID = i.Patient_ID

GROUP BY d.Dept_Name;

-- =========================================
-- KIỂM TRA VIEW
-- =========================================
SELECT *
FROM Department_Revenue_View;

-- =========================================
-- GIẢ LẬP KẾ TOÁN CỐ UPDATE VIEW
-- =========================================
UPDATE Department_Revenue_View
SET Total_Revenue = 999999
WHERE Department_Name = 'Noi';

-- =========================================
-- KIỂM TRA DỮ LIỆU GỐC
-- =========================================
SELECT *
FROM Invoices;