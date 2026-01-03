## Phase 4 - Database Applications & Analytics

## Application Features

###  Query Operations

#### 1. Find Agents by Agency
- **Description:** Lists all agents from a specific agency with their specialties
- **Functionality:** Shows agent details, ranks, contact info, and skill sets
- **SQL Features:** JOINs, GROUP BY, GROUP_CONCAT
- **Input:** Agency name (shows available options)

#### 2. Find Missions by Status & Region  
- **Description:** Searches missions by operational status and geographic region
- **Functionality:** Displays mission details, timelines, and assigned agent counts
- **SQL Features:** Multiple JOINs, COUNT aggregation, filtering
- **Input:** Mission status (Ongoing/Completed/Planned) and region

#### 3. Criminal Organizations & Mission Involvement
- **Description:** Analyzes criminal syndicate activities and mission connections
- **Functionality:** Shows criminals, their organizations, rewards, and mission involvement
- **SQL Features:** Complex JOINs, SUM aggregation, GROUP_CONCAT
- **Input:** Criminal organization name

#### 4. Artifacts by Value Range & Status
- **Description:** Searches artifacts by historical value and custody status
- **Functionality:** Displays artifact details, values, locations, and movement history
- **SQL Features:** BETWEEN clause, MAX function, multiple LEFT JOINs
- **Input:** Minimum and maximum value range

#### 5. Agent Mission Performance Analysis
- **Description:** Comprehensive performance metrics for agents
- **Functionality:** Shows mission assignments, task completion, evidence collection stats
- **SQL Features:** Multiple aggregations (COUNT, AVG), HAVING clause, complex JOINs
- **Input:** None (shows top 15 performers)

### Update Operations

#### 6. Add New Agent (INSERT)
- **Description:** Registers a new intelligence agent in the system
- **Functionality:** Collects agent details and inserts into database
- **SQL Features:** Parameterized INSERT, AUTO_INCREMENT handling
- **Input:** Name, rank, agency, country, contact details, hire date
- **Validation:** Shows newly inserted record for confirmation

#### 7. Update Mission Status (UPDATE) 
- **Description:** Modifies mission status and completion dates
- **Functionality:** Updates ongoing missions to completed/planned status
- **SQL Features:** Conditional UPDATE, date handling
- **Input:** Mission ID, new status, optional end date
- **Safety:** Shows available missions before update, confirms changes

#### 8. Delete Evidence Record (DELETE)
- **Description:** Removes evidence records with safety confirmations
- **Functionality:** Safely deletes evidence entries from investigations
- **SQL Features:** Parameterized DELETE with constraints
- **Input:** Mission ID and Evidence ID
- **Safety:** Shows record details before deletion, requires confirmation

### 📊 Additional Features

#### 9. Database Statistics
- **Description:** Comprehensive overview of database contents
- **Functionality:** Shows record counts, operational metrics, value calculations
- **SQL Features:** Multiple COUNT queries, AVG calculations
- **Output:** Total records per table, active missions, criminals at large, etc.

## Installation & Setup

### Prerequisites
```bash
pip install pymysql
```

### Database Setup
1. Run `schema.sql` to create database structure
2. Run `populate.sql` to insert sample data
3. Ensure MySQL server is running on localhost


