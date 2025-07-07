# Research & Conference Management System

A SQL-based academic database project designed to simulate a university research environment, built as part of the **Database Management System (DBMS)** course. This system models faculty publications, student research participation, inter-departmental collaborations, and academic conference activities. The project aims to demonstrate how real-world academic data can be organized, queried, and analyzed using relational databases and SQL.

## Table of Contents

* [Overview](#overview)
* [Features](#features)
* [Sample Queries](#sample-queries)
* [Database Design](#database-design)
* [Technologies Used](#technologies-used)
* [Getting Started](#getting-started)
* [Limitations & Future Work](#limitations--future-work)

## Overview

In academic institutions, managing research projects, publications, student participation, and conferences across departments can become complex. This system addresses that complexity by providing an organized relational structure and a set of well-defined queries to analyze research performance, collaboration, and activity at the departmental level.

The system helps answer administrative and academic questions such as:

* Which faculty members are most active in publishing?
* Are students contributing effectively to research?
* How often is the CS department represented in academic conferences?

## Features

* Track student participation in research projects with time commitments
* Analyze faculty publishing activity over the last 5 years
* Identify students who have published and attended conferences
* Monitor research funding handled by faculty
* Track departmental presence in academic conferences
* Detect faculty who supervise but do not publish
* Trace inter-departmental collaboration in publications
* Match students' conference participation with their supervisors
* Support efficient querying using relational joins and aggregations

## Sample Queries

1. Research projects with total student hours/week > 20
2. Top 3 most published faculty in the last 5 years
3. Students who have published and attended conferences
4. Total funding handled by each faculty member
5. Conferences where no CS department member attended
6. Students involved in exactly two research projects
7. Publications with authors from more than one department
8. Conferences attended by students and their supervisors
9. Faculty who supervised students but did not publish
10. Total conferences participated in by each department over the last 3 years

## Database Design

* **Entities**: Faculty, Students, Departments, Projects, Publications, Conferences
* **Relationships**:

  * Faculty supervises Students
  * Students work on Projects
  * Faculty and Students contribute to Publications
  * Both attend Conferences
* **ERD and Schema**: Designed using normalization principles with primary and foreign keys to maintain referential integrity.

## Technologies Used

* **SQL** – Structured Query Language for data querying
* **Relational DBMS Concepts** – Keys, joins, groupings, subqueries
* **ER Diagrams & Schema Design** – Logical modeling of academic data
* **Data Simulation** – Academic-scale dataset for realistic querying

## Getting Started

### Prerequisites

* Any SQL-supported DBMS (e.g., MySQL, PostgreSQL, SQLite)
* SQL script execution environment
* Basic understanding of SQL and relational database concepts

### Run the Project

1. Clone or download the repository
2. Open your DBMS (MySQL, PostgreSQL, etc.)
3. Import the provided SQL schema and data (if available)
4. Execute the queries in your SQL client or console

## Limitations & Future Work

* No front-end or GUI — database-only implementation
* Static dataset — no live data input system
* No stored procedures or views for automation
* Does not include user authentication or access control

**Future Enhancements:**

* Develop a web-based dashboard for research tracking
* Connect to a live academic database for real-time updates
* Add stored procedures for automated reports
* Integrate role-based access for admin, faculty, and students
* Expand schema to include journals, grants, and course loads
