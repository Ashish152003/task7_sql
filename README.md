
## 📝 Objective

To create reusable **views** for secure and abstracted data access.  
Views simplify SQL logic and provide controlled access to underlying tables.

---

## 🧱 Schema Overview

### Employees Table
| Column     | Type    |
|------------|---------|
| EmployeeID | INT     |
| Name       | VARCHAR |
| Department | VARCHAR |
| Salary     | INT     |

### Projects Table
| Column     | Type    |
|------------|---------|
| ProjectID  | INT     |
| ProjectName| VARCHAR |
| Budget     | INT     |
| LeadID     | INT (FK to Employees) |

---

## 🔍 Views Created

| View Name             | Description                                            |
|-----------------------|--------------------------------------------------------|
| `HighSalaryEmployees` | Employees with salary > ₹60,000                        |
| `ProjectDetails`      | Project info + lead's name & department (JOIN)         |
| `AvgSalaryPerDept`    | Average salary grouped by department (AGGREGATE)       |
| `HR_Only_View`        | HR employees only with `WITH CHECK OPTION` security    |

---

## 📌 Key Concepts Covered

- `CREATE VIEW`, `DROP VIEW`
- Views using `JOIN` and `GROUP BY`
- Data abstraction
- `WITH CHECK OPTION` to restrict inserts/updates

---

## 💻 Usage Examples

- Selecting from views
- Inserting into view with condition (`HR_Only_View`)
- Replacing complex queries with simple view selects

---

## 🧰 Tools Used

- MySQL Workbench
- DB Browser for SQLite *(Note: some features like CHECK OPTION may not work in SQLite)*

