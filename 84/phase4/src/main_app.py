#!/usr/bin/env python3
"""
Mini World Intelligence Database Application
Phase 4 - Database Applications & Analytics
Intelligence Agency Artifact Tracking System
"""

import pymysql
import sys
from getpass import getpass
from datetime import datetime


def get_db_connection(db_user, db_pass, db_host, db_name):
    """Establishes a connection to the MySQL database."""
    try:
        connection = pymysql.connect(
            host=db_host,
            user=db_user,
            password=db_pass,
            database=db_name,
            cursorclass=pymysql.cursors.DictCursor,  # Returns results as dictionaries
            autocommit=False  # We will manually commit transactions
        )
        print("Database connection successful.")
        return connection
    except pymysql.Error as e:
        print(f"Error connecting to MySQL Database: {e}", file=sys.stderr)
        return None


def display_results(results, title="Results"):
    """Helper function to display query results in a formatted manner."""
    if not results:
        print(f" No {title.lower()} found.")
        return
    
    print(f"\n {title}:")
    print("=" * 120)
    
    if isinstance(results, list) and len(results) > 0:
        # Get headers from the first result
        headers = list(results[0].keys())
        
        # Calculate optimal column widths
        col_widths = {}
        for header in headers:
            # Start with header length as minimum width
            col_widths[header] = max(len(header), 12)  # Minimum 12 chars
            
            # Check data lengths to optimize width
            for row in results:
                if row[header] is not None:
                    data_len = len(str(row[header]))
                    col_widths[header] = max(col_widths[header], min(data_len, 30))  # Max 30 chars
        
        # Print headers with dynamic width
        header_row = " | ".join(f"{header:<{col_widths[header]}}" for header in headers)
        print(header_row)
        print("-" * len(header_row))
        
        # Print data rows with proper formatting
        for i, row in enumerate(results, 1):
            data_cells = []
            for header in headers:
                value = row[header]
                if value is None:
                    formatted_value = "N/A"
                elif isinstance(value, float):
                    formatted_value = f"{value:,.2f}"
                elif isinstance(value, int) and header.lower() in ['historicalvalue', 'reward', 'totalreward']:
                    formatted_value = f"{value:,}"
                else:
                    formatted_value = str(value)
                
                # Truncate if too long
                if len(formatted_value) > col_widths[header]:
                    formatted_value = formatted_value[:col_widths[header]-3] + "..."
                
                data_cells.append(f"{formatted_value:<{col_widths[header]}}")
            
            data_row = " | ".join(data_cells)
            print(data_row)
            
            # Add separator every 5 rows for better readability
            if i % 5 == 0 and i < len(results):
                print("·" * len(header_row))
    
    print("=" * 120)
    print(f"Total records: {len(results)}")
    print()


# =============================
# QUERY OPERATIONS (READ)
# =============================

def query_agents_by_agency(connection):
    """Query 1: Find all agents from a specific agency with their specialties."""
    print("\n🔍 Query 1: Find Agents by Agency")
    
    try:
        with connection.cursor() as cursor:
            # First, show available agencies
            cursor.execute("SELECT DISTINCT Agency FROM Agent WHERE Agency IS NOT NULL ORDER BY Agency")
            agencies = cursor.fetchall()
            
            print("\nAvailable Agencies:")
            for i, agency in enumerate(agencies, 1):
                print(f"{i}. {agency['Agency']}")
            
            user_input = input("\nEnter agency name or number: ").strip()
            
            # Handle both number selection and direct name entry
            if user_input.isdigit():
                agency_num = int(user_input)
                if 1 <= agency_num <= len(agencies):
                    agency_name = agencies[agency_num - 1]['Agency']
                else:
                    print(f" Invalid number. Please enter 1-{len(agencies)}")
                    return
            else:
                agency_name = user_input
            
            sql_query = """
            SELECT 
                a.AgentID,
                CONCAT(a.FirstName, ' ', a.LastName) as FullName,
                a.Rank,
                a.Agency,
                a.Country,
                a.Email,
                GROUP_CONCAT(s.Speciality_Name SEPARATOR ', ') as Specialties
            FROM Agent a
            LEFT JOIN AgentSkillset ask ON a.AgentID = ask.AgentID
            LEFT JOIN Specialties s ON ask.Specialty_ID = s.Speciality_ID
            WHERE a.Agency = %s
            GROUP BY a.AgentID
            ORDER BY a.LastName, a.FirstName
            """
            
            cursor.execute(sql_query, (agency_name,))
            results = cursor.fetchall()
            
            display_results(results, f"Agents from {agency_name}")
            
    except pymysql.Error as e:
        print(f"Error during query: {e}", file=sys.stderr)


def query_missions_by_status_region(connection):
    """Query 2: Find missions by status and region with assigned agents."""
    print("\n Query 2: Find Missions by Status and Region")
    
    try:
        with connection.cursor() as cursor:
            # Show available statuses and regions
            cursor.execute("SELECT DISTINCT Status FROM Mission WHERE Status IS NOT NULL")
            statuses = [row['Status'] for row in cursor.fetchall()]
            
            cursor.execute("SELECT DISTINCT Region FROM Mission WHERE Region IS NOT NULL")
            regions = [row['Region'] for row in cursor.fetchall()]
            
            print(f"\nAvailable Statuses: {', '.join(statuses)}")
            print(f"Available Regions: {', '.join(regions)}")
            
            status = input("\nEnter mission status: ").strip()
            region = input("Enter region: ").strip()
            
            sql_query = """
            SELECT 
                m.MissionID,
                m.MissionName,
                m.Status,
                m.Region,
                m.StartDate,
                m.EndDate,
                COUNT(aa.AgentID) as AgentsAssigned,
                GROUP_CONCAT(CONCAT(a.FirstName, ' ', a.LastName) SEPARATOR ', ') as AssignedAgents
            FROM Mission m
            LEFT JOIN AgentAssignment aa ON m.MissionID = aa.MissionID
            LEFT JOIN Agent a ON aa.AgentID = a.AgentID
            WHERE m.Status = %s AND m.Region = %s
            GROUP BY m.MissionID
            ORDER BY m.StartDate DESC
            """
            
            cursor.execute(sql_query, (status, region))
            results = cursor.fetchall()
            
            display_results(results, f"Missions - Status: {status}, Region: {region}")
            
    except pymysql.Error as e:
        print(f" Error during query: {e}", file=sys.stderr)


def query_criminals_and_organizations(connection):
    """Query 3: Find criminals by organization with their involvement in missions."""
    print("\n Query 3: Criminal Organizations and Mission Involvement")
    
    try:
        with connection.cursor() as cursor:
            # Show available criminal organizations
            cursor.execute("""
                SELECT DISTINCT o.OrgName 
                FROM Organization o 
                JOIN Criminal c ON o.OrgID = c.Member_Of 
                WHERE o.Type = 'Criminal Syndicate'
                ORDER BY o.OrgName
            """)
            orgs = cursor.fetchall()
            
            print("\nCriminal Organizations:")
            for i, org in enumerate(orgs, 1):
                print(f"{i}. {org['OrgName']}")
            
            org_name = input("\nEnter organization name: ").strip()
            
            sql_query = """
            SELECT 
                c.CriminalID,
                c.Name,
                c.Alias,
                c.Status,
                c.Nationality,
                o.OrgName,
                COUNT(ci.MissionID) as MissionsInvolved,
                SUM(ci.Reward) as TotalReward,
                GROUP_CONCAT(DISTINCT m.MissionName SEPARATOR '; ') as Missions
            FROM Criminal c
            JOIN Organization o ON c.Member_Of = o.OrgID
            LEFT JOIN CriminalInvolvement ci ON c.CriminalID = ci.CriminalID
            LEFT JOIN Mission m ON ci.MissionID = m.MissionID
            WHERE o.OrgName = %s
            GROUP BY c.CriminalID
            ORDER BY TotalReward DESC
            """
            
            cursor.execute(sql_query, (org_name,))
            results = cursor.fetchall()
            
            display_results(results, f"Criminals from {org_name}")
            
    except pymysql.Error as e:
        print(f" Error during query: {e}", file=sys.stderr)


def query_artifacts_by_value_status(connection):
    """Query 4: Find artifacts by value range and status with movement history."""
    print("\n🔍 Query 4: Artifacts by Value Range and Status")
    
    try:
        min_value = float(input("Enter minimum historical value: "))
        max_value = float(input("Enter maximum historical value: "))
        
        with connection.cursor() as cursor:
            sql_query = """
            SELECT 
                art.ArtifactID,
                art.ArtifactName,
                art.OriginCountry,
                art.HistoricalValue,
                art.CurrentStatus,
                m.MissionName,
                COUNT(am.MovementID) as MovementCount,
                MAX(am.MovedOn) as LastMoved,
                GROUP_CONCAT(DISTINCT l1.City SEPARATOR ', ') as CurrentLocation
            FROM Artifact art
            LEFT JOIN Mission m ON art.MissionID = m.MissionID
            LEFT JOIN ArtifactMovement am ON art.ArtifactID = am.ArtifactID
            LEFT JOIN Location l1 ON am.ToLocationID = l1.LocationID
            WHERE art.HistoricalValue BETWEEN %s AND %s
            GROUP BY art.ArtifactID, art.ArtifactName, art.OriginCountry, 
                     art.HistoricalValue, art.CurrentStatus, m.MissionName
            ORDER BY art.HistoricalValue DESC
            """
            
            cursor.execute(sql_query, (min_value, max_value))
            results = cursor.fetchall()
            
            display_results(results, f"Artifacts (Value: ${min_value:,.0f} - ${max_value:,.0f})")
            
    except (ValueError, pymysql.Error) as e:
        print(f" Error: {e}", file=sys.stderr)


def query_agent_mission_performance(connection):
    """Query 5: Agent performance analysis across missions."""
    print("\n Query 5: Agent Mission Performance Analysis")
    
    try:
        with connection.cursor() as cursor:
            sql_query = """
            SELECT 
                a.AgentID,
                CONCAT(a.FirstName, ' ', a.LastName) as AgentName,
                a.Agency,
                COUNT(DISTINCT aa.MissionID) as MissionsAssigned,
                COUNT(DISTINCT mt.MissionID) as TasksCompleted,
                COUNT(DISTINCT e.MissionID) as EvidenceCollected,
                AVG(l.RiskLevel) as AvgRiskLevel,
                GROUP_CONCAT(DISTINCT aa.Role SEPARATOR ', ') as Roles
            FROM Agent a
            LEFT JOIN AgentAssignment aa ON a.AgentID = aa.AgentID
            LEFT JOIN MissionTask mt ON a.AgentID = mt.AssignedAgentID AND mt.Status = 'Completed'
            LEFT JOIN Evidence e ON a.AgentID = e.CollectedBy_AgentID
            LEFT JOIN Mission m ON aa.MissionID = m.MissionID
            LEFT JOIN Location l ON m.Region = l.Region
            GROUP BY a.AgentID
            HAVING MissionsAssigned > 0
            ORDER BY MissionsAssigned DESC, TasksCompleted DESC
            LIMIT 15
            """
            
            cursor.execute(sql_query)
            results = cursor.fetchall()
            
            display_results(results, "Top Agent Performance")
            
    except pymysql.Error as e:
        print(f" Error during query: {e}", file=sys.stderr)


# =============================
# UPDATE OPERATIONS (WRITE)
# =============================

def insert_new_agent(connection):
    """Insert Operation: Add a new agent to the database."""
    print("\n Insert Operation: Add New Agent")
    
    try:
        print("Enter new agent details:")
        first_name = input("First Name: ").strip()
        last_name = input("Last Name: ").strip()
        rank = input("Rank (optional): ").strip() or None
        agency = input("Agency: ").strip()
        country = input("Country: ").strip()
        email = input("Email: ").strip()
        phone = input("Phone: ").strip()
        
        # Get hire date
        hire_date_str = input("Hire Date (YYYY-MM-DD, or press Enter for today): ").strip()
        if not hire_date_str:
            hire_date = datetime.now().date()
        else:
            hire_date = datetime.strptime(hire_date_str, '%Y-%m-%d').date()
        
        with connection.cursor() as cursor:
            sql_insert = """
            INSERT INTO Agent (FirstName, LastName, `Rank`, Agency, Country, HireDate, Email, Phone)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
            """
            
            cursor.execute(sql_insert, (first_name, last_name, rank, agency, country, hire_date, email, phone))
            connection.commit()
            
            new_agent_id = cursor.lastrowid
            print(f" Successfully added new agent with ID: {new_agent_id}")
            
            # Show the inserted agent
            cursor.execute("SELECT * FROM Agent WHERE AgentID = %s", (new_agent_id,))
            result = cursor.fetchall()
            display_results(result, "Newly Added Agent")
            
    except (ValueError, pymysql.Error) as e:
        connection.rollback()
        print(f" Error inserting agent: {e}", file=sys.stderr)


def update_mission_status(connection):
    """Update Operation: Update mission status and end date."""
    print("\n Update Operation: Update Mission Status")
    
    try:
        with connection.cursor() as cursor:
            # Show ongoing missions
            cursor.execute("""
                SELECT MissionID, MissionName, Status, StartDate, EndDate 
                FROM Mission 
                WHERE Status IN ('Ongoing', 'Planned')
                ORDER BY StartDate
            """)
            missions = cursor.fetchall()
            
            if not missions:
                print("📭 No ongoing or planned missions found.")
                return
            
            print("\nOngoing/Planned Missions:")
            for mission in missions:
                print(f"ID: {mission['MissionID']} - {mission['MissionName']} ({mission['Status']})")
            
            mission_id = int(input("\nEnter Mission ID to update: "))
            new_status = input("Enter new status (Ongoing/Completed/Planned): ").strip()
            
            # If completing the mission, ask for end date
            end_date = None
            if new_status.lower() == 'completed':
                end_date_str = input("Enter end date (YYYY-MM-DD, or press Enter for today): ").strip()
                if not end_date_str:
                    end_date = datetime.now().date()
                else:
                    end_date = datetime.strptime(end_date_str, '%Y-%m-%d').date()
            
            # Update the mission
            if end_date:
                sql_update = "UPDATE Mission SET Status = %s, EndDate = %s WHERE MissionID = %s"
                cursor.execute(sql_update, (new_status, end_date, mission_id))
            else:
                sql_update = "UPDATE Mission SET Status = %s WHERE MissionID = %s"
                cursor.execute(sql_update, (new_status, mission_id))
            
            connection.commit()
            
            if cursor.rowcount > 0:
                print(f" Successfully updated mission {mission_id}")
                
                # Show updated mission
                cursor.execute("SELECT * FROM Mission WHERE MissionID = %s", (mission_id,))
                result = cursor.fetchall()
                display_results(result, "Updated Mission")
            else:
                print(" No mission found with that ID.")
                
    except (ValueError, pymysql.Error) as e:
        connection.rollback()
        print(f" Error updating mission: {e}", file=sys.stderr)


def delete_evidence_record(connection):
    """Delete Operation: Remove evidence record (with safety checks)."""
    print("\n Delete Operation: Remove Evidence Record")
    
    try:
        with connection.cursor() as cursor:
            # Show recent evidence records
            cursor.execute("""
                SELECT e.MissionID, e.EvidenceID, e.Type, e.Status, 
                       m.MissionName, CONCAT(a.FirstName, ' ', a.LastName) as CollectedBy
                FROM Evidence e
                JOIN Mission m ON e.MissionID = m.MissionID
                LEFT JOIN Agent a ON e.CollectedBy_AgentID = a.AgentID
                ORDER BY e.MissionID, e.EvidenceID
                LIMIT 20
            """)
            evidence = cursor.fetchall()
            
            if not evidence:
                print("📭 No evidence records found.")
                return
            
            print("\nRecent Evidence Records:")
            for ev in evidence:
                print(f"Mission {ev['MissionID']}, Evidence {ev['EvidenceID']}: {ev['Type']} - {ev['Status']}")
            
            mission_id = int(input("\nEnter Mission ID: "))
            evidence_id = int(input("Enter Evidence ID: "))
            
            # Safety check - show what will be deleted
            cursor.execute("""
                SELECT * FROM Evidence 
                WHERE MissionID = %s AND EvidenceID = %s
            """, (mission_id, evidence_id))
            
            to_delete = cursor.fetchone()
            if not to_delete:
                print(" Evidence record not found.")
                return
            
            print(f"\nRecord to delete: {to_delete['Type']} - {to_delete['Status']}")
            confirm = input("Are you sure you want to delete this record? (yes/no): ").strip().lower()
            
            if confirm == 'yes':
                sql_delete = "DELETE FROM Evidence WHERE MissionID = %s AND EvidenceID = %s"
                cursor.execute(sql_delete, (mission_id, evidence_id))
                connection.commit()
                
                if cursor.rowcount > 0:
                    print(" Evidence record successfully deleted.")
                else:
                    print(" No record was deleted.")
            else:
                print(" Deletion cancelled.")
                
    except (ValueError, pymysql.Error) as e:
        connection.rollback()
        print(f" Error deleting evidence: {e}", file=sys.stderr)


# =============================
# ADDITIONAL OPERATIONS
# =============================

def show_database_statistics(connection):
    """Show overall database statistics."""
    print("\n Database Statistics")
    
    try:
        with connection.cursor() as cursor:
            stats = {}
            
            # Count records in each main table
            tables = ['Agent', 'Mission', 'Criminal', 'Artifact', 'Location', 'Organization']
            for table in tables:
                cursor.execute(f"SELECT COUNT(*) as count FROM {table}")
                stats[table] = cursor.fetchone()['count']
            
            # Additional statistics
            cursor.execute("SELECT COUNT(*) as count FROM Mission WHERE Status = 'Ongoing'")
            stats['Ongoing Missions'] = cursor.fetchone()['count']
            
            cursor.execute("SELECT COUNT(*) as count FROM Criminal WHERE Status = 'At Large'")
            stats['Criminals At Large'] = cursor.fetchone()['count']
            
            cursor.execute("SELECT AVG(HistoricalValue) as avg_value FROM Artifact")
            stats['Avg Artifact Value'] = f"${cursor.fetchone()['avg_value']:,.2f}"
            
            print("\n📊 Database Overview:")
            print("=" * 40)
            for key, value in stats.items():
                print(f"{key:20}: {value}")
            print("=" * 40)
            
    except pymysql.Error as e:
        print(f" Error getting statistics: {e}", file=sys.stderr)


def main_cli(connection):
    """The main command-line interface loop."""
    try:
        while True:
            print("\n" + "="*60)
            print("  INTELLIGENCE AGENCY DATABASE SYSTEM  ")
            print("="*60)
            print("\n QUERY OPERATIONS (READ):")
            print("1: Find Agents by Agency")
            print("2: Find Missions by Status & Region")
            print("3: Criminal Organizations & Mission Involvement")
            print("4: Artifacts by Value Range & Status")
            print("5: Agent Mission Performance Analysis")
            
            print("\n UPDATE OPERATIONS (WRITE):")
            print("6: Add New Agent (INSERT)")
            print("7: Update Mission Status (UPDATE)")
            print("8: Delete Evidence Record (DELETE)")
            
            print("\n ADDITIONAL FEATURES:")
            print("9: Database Statistics")
            print("q: Quit Application")
            print("="*60)
            
            choice = input("Enter your choice: ").strip().lower()
            
            if choice == '1':
                query_agents_by_agency(connection)
            elif choice == '2':
                query_missions_by_status_region(connection)
            elif choice == '3':
                query_criminals_and_organizations(connection)
            elif choice == '4':
                query_artifacts_by_value_status(connection)
            elif choice == '5':
                query_agent_mission_performance(connection)
            elif choice == '6':
                insert_new_agent(connection)
            elif choice == '7':
                update_mission_status(connection)
            elif choice == '8':
                delete_evidence_record(connection)
            elif choice == '9':
                show_database_statistics(connection)
            elif choice == 'q':
                print("\n Exiting Intelligence Database System...")
                break
            else:
                print(" Invalid choice. Please try again.")
                
            input("\nPress Enter to continue...")
            
    finally:
        if connection:
            connection.close()
            print(" Database connection closed securely.")


if __name__ == "__main__":
    # Database configuration
    DB_HOST = 'localhost'
    DB_NAME = 'mini_world_db'
    
    print(" Intelligence Agency Database System")
    print("Please enter your MySQL credentials.")
    
    DB_USER = input("Username: ").strip()
    DB_PASS = getpass("Password: ")
    
    # Establish database connection
    db_conn = get_db_connection(DB_USER, DB_PASS, DB_HOST, DB_NAME)
    
    if db_conn:
        main_cli(db_conn)
    else:
        print(" Failed to connect to the database. Application will exit.")
        sys.exit(1)