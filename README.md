# 🕵️ Mini World Intelligence Database System

> A full-stack **database-backed CLI application** modeling a global intelligence agency network — built with Python and MySQL. Designed as a capstone project demonstrating relational database design, complex SQL querying, and transactional data management.

[![Python](https://img.shields.io/badge/Python-3.8%2B-blue?logo=python&logoColor=white)](https://python.org)
[![MySQL](https://img.shields.io/badge/MySQL-8.0%2B-4479A1?logo=mysql&logoColor=white)](https://mysql.com)
[![PyMySQL](https://img.shields.io/badge/PyMySQL-1.1.2-orange)](https://pypi.org/project/PyMySQL/)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)

---

## 📌 Project Overview

The **Mini World Intelligence Database System** is an interactive command-line application that simulates the operations of an international intelligence agency. The system manages:

- 🧑‍💼 **Agents** — 40 intelligence professionals across 25+ agencies and 20+ countries
- 🎯 **Missions** — 40+ operations spanning regions from North Africa to East Asia
- 🏺 **Artifacts** — 59 high-value cultural artifacts tracked through custody chains
- 🦹 **Criminals** — 40 suspects linked to 5 criminal syndicates with movement tracking
- 🌍 **Locations** — 40 global cities with geospatial coordinates and risk ratings

The project was developed across **4 iterative phases**, from ER modeling and normalization through to a fully functional database application.

---

## 🎬 Demo

📹 [Watch the Application Demo](https://drive.google.com/file/d/1LZil8y1LF6-PWiiy2wf2o4gFCAwZD2Bs/view?usp=drive_link)

---

## 🗂️ Repository Structure

```
database-backed/
│
├── README.md                        ← You are here
│
└── 84/
    ├── Phase1.pdf                   ← ER Diagram & Conceptual Design
    ├── phase2.pdf                   ← Relational Schema & Normalization
    ├── phase3.pdf                   ← SQL Queries & Advanced Analytics
    │
    └── phase4/                      ← Final Application
        ├── README.md                ← Phase 4 feature documentation
        ├── video.txt                ← Demo video link
        │
        └── src/
            ├── main_app.py          ← Main Python CLI application
            ├── schema.sql           ← Database schema (CREATE statements)
            ├── populate.sql         ← Sample dataset (1000+ INSERT rows)
            └── requirements.txt     ← Python dependencies
```

---

## 🧠 Database Schema

The system implements a **fully normalized relational schema (3NF)** with **20 tables** and carefully designed foreign key constraints.

### Core Entities

| Table | Description | Records |
|-------|-------------|---------|
| `Agent` | Intelligence operatives with rank, agency, and contact info | 40 |
| `Mission` | Operations with objectives, timelines, regions, and status | 40 |
| `Criminal` | Suspects with aliases, nationalities, and organization links | 40 |
| `Artifact` | Cultural artifacts with origin, value, and custody status | 59 |
| `Location` | Global cities with coordinates and risk levels | 40 |
| `Organization` | Agencies, NGOs, and criminal syndicates | 35 |

### Relationship Tables

| Table | Relationship |
|-------|-------------|
| `AgentAssignment` | Many-to-many: Agents ↔ Missions (with roles) |
| `AgentSkillset` | Many-to-many: Agents ↔ Specialties (35 specialties) |
| `MissionTask` | Agents assigned to individual tasks within missions |
| `Evidence` | Evidence records with chain-of-custody tracking |
| `ArtifactMovement` | Full movement log for each artifact (from → to location) |
| `CriminalInvolvement` | Criminals linked to missions with rewards and arrest status |
| `Intelshare` | Intelligence shared between agents on specific criminals |
| `Tracks` | Missions tracking specific criminals |
| `Operative` / `Leader` | Specialization/ISA hierarchy for criminal subtypes |

### Entity Relationship Highlights
- **ISA (Inheritance)** hierarchy: `Criminal` → `Operative` and `Criminal` → `Leader`
- **Weak entities**: `MissionTask`, `Evidence` (composite PKs dependent on `Mission`)
- **Cascade rules**: Artifact movements cascade on artifact deletion; evidence cascades with missions

---

## 🚀 Application Features

### 🔍 Query Operations (READ)

| # | Feature | SQL Techniques Used |
|---|---------|---------------------|
| 1 | **Agents by Agency** — List all agents from an agency with their specialties | `JOIN`, `GROUP BY`, `GROUP_CONCAT` |
| 2 | **Missions by Status & Region** — Find operations filtered by status and geography | Multiple `JOIN`s, `COUNT`, subfiltering |
| 3 | **Criminal Organizations** — Analyze syndicates and their mission involvement | `SUM`, `GROUP_CONCAT`, complex `JOIN`s |
| 4 | **Artifacts by Value Range** — Search artifacts within a price bracket | `BETWEEN`, `MAX`, multiple `LEFT JOIN`s |
| 5 | **Agent Performance Analysis** — Rank top agents by mission and task metrics | `COUNT`, `AVG`, `HAVING`, multi-table aggregation |

### ✏️ Update Operations (WRITE)

| # | Operation | SQL Features |
|---|-----------|--------------|
| 6 | **Add New Agent** (INSERT) | Parameterized `INSERT`, `AUTO_INCREMENT`, input validation |
| 7 | **Update Mission Status** (UPDATE) | Conditional `UPDATE`, date handling, transaction commit |
| 8 | **Delete Evidence Record** (DELETE) | Safe deletion with confirmation prompt, rollback on error |

### 📊 Additional Features
- **Database Statistics Dashboard** — Live counts, averages, and operational metrics across all tables
- **Dynamic result formatting** — Auto-sizing column widths with paginated output
- **Transaction safety** — All write operations wrapped in explicit transactions with rollback on failure

---

## ⚙️ Setup & Installation

### Prerequisites

- Python 3.8 or higher
- MySQL Server 8.0 or higher (running locally on `localhost`)

### 1. Clone the Repository

```bash
git clone https://github.com/pariza1305/database-backed.git
cd database-backed
```

### 2. Install Python Dependencies

```bash
pip install -r 84/phase4/src/requirements.txt
```

### 3. Set Up the Database

Connect to your MySQL server and run the following scripts **in order**:

```bash
# Step 1: Create schema
mysql -u root -p < 84/phase4/src/schema.sql

# Step 2: Load sample data
mysql -u root -p < 84/phase4/src/populate.sql
```

### 4. Run the Application

```bash
python 84/phase4/src/main_app.py
```

You'll be prompted for your MySQL username and password, then the main menu will launch.

---

## 🖥️ Application Walkthrough

```
============================================================
     INTELLIGENCE AGENCY DATABASE SYSTEM
============================================================

 QUERY OPERATIONS (READ):
1: Find Agents by Agency
2: Find Missions by Status & Region
3: Criminal Organizations & Mission Involvement
4: Artifacts by Value Range & Status
5: Agent Mission Performance Analysis

 UPDATE OPERATIONS (WRITE):
6: Add New Agent (INSERT)
7: Update Mission Status (UPDATE)
8: Delete Evidence Record (DELETE)

 ADDITIONAL FEATURES:
9: Database Statistics
q: Quit Application
============================================================
Enter your choice: _
```

---

## 📈 Development Phases

This project was built across four structured phases:

| Phase | Deliverable | Description |
|-------|-------------|-------------|
| [Phase 1](84/Phase1.pdf) | ER Diagram | Conceptual entity-relationship design with cardinalities and participation constraints |
| [Phase 2](84/phase2.pdf) | Relational Schema | Conversion to relational model, normalization to 3NF, functional dependency analysis |
| [Phase 3](84/phase3.pdf) | SQL Queries | Advanced analytical queries, views, aggregations, and nested queries |
| [Phase 4](84/phase4/) | Application | Full Python CLI application with CRUD operations and database connectivity |

---

## 🛠️ Tech Stack

| Technology | Role |
|-----------|------|
| **Python 3** | Application logic, CLI interface, database connectivity |
| **MySQL 8** | Relational database engine |
| **PyMySQL** | Python-MySQL connector with `DictCursor` for clean result handling |
| **SQL** | DDL (schema creation), DML (CRUD), complex analytical queries |

---

## 💡 Key Technical Highlights

- **20-table normalized schema** with proper foreign keys, `ON DELETE CASCADE` / `SET NULL` rules
- **ISA inheritance** modeled using separate child tables (`Operative`, `Leader`) linked to `Criminal`
- **Parameterized queries** throughout to prevent SQL injection
- **Explicit transaction management** — `autocommit=False`, manual `.commit()` / `.rollback()`
- **Dynamic CLI formatting** — adaptive column widths based on actual data lengths
- **Rich sample dataset** — 1,000+ rows across all tables covering real-world city names, organizations, and operational scenarios

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

<div align="center">
  <sub>Built as a Database Management Systems (DBMS) course project</sub>
</div>
