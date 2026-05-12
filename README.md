# PhamMinhTai_IT202_Session10_bai3

# BÁO CÁO: BÁO CÁO TÀI CHÍNH KHOA

## 1. Thông tin bài tập
- Môn học: Cơ sở dữ liệu
- Chủ đề: VIEW tổng hợp và Aggregation
- Hệ quản trị: MySQL

---

# 2. Mục tiêu bài thực hành

- Hiểu cách sử dụng VIEW trong MySQL
- Sử dụng:
  - GROUP BY
  - SUM()
  - COUNT()
- Kết hợp nhiều bảng bằng JOIN
- Tạo báo cáo tổng hợp mà không lộ dữ liệu chi tiết
- Hiểu khái niệm Read-only View
- Nhận biết các View không thể UPDATE

---

# 3. Mô tả bài toán

Bệnh viện cần tạo báo cáo tài chính cho từng khoa.

Kế toán trưởng chỉ được xem:
- Tổng số bệnh nhân
- Tổng doanh thu

Nhưng:
- Không được xem hồ sơ chi tiết bệnh nhân
- Không được sửa trực tiếp số liệu báo cáo

Giải pháp:
- Sử dụng VIEW tổng hợp dữ liệu
- Chặn UPDATE trực tiếp trên View

---

# 4. Thiết kế cơ sở dữ liệu

## Bảng Departments

```sql
CREATE TABLE Departments (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(100)
);
