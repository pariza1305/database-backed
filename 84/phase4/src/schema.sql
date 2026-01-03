
CREATE DATABASE IF NOT EXISTS mini_world_db;
USE mini_world_db;
-- -----------------------------------------------------
-- Table Agent
-- -----------------------------------------------------
CREATE TABLE Agent (
AgentID INT AUTO_INCREMENT,
FirstName VARCHAR(100) NOT NULL,
LastName VARCHAR(100) NOT NULL,
`Rank` VARCHAR(50),
Agency VARCHAR(100),
Country VARCHAR(100),
HireDate DATE,
Email VARCHAR(100) UNIQUE,
Phone VARCHAR(20),
PRIMARY KEY (AgentID)
);
-- -----------------------------------------------------
-- Table Location
-- -----------------------------------------------------
CREATE TABLE Location (
LocationID INT AUTO_INCREMENT,
City VARCHAR(100),
Country VARCHAR(100),
Region VARCHAR(100),
Latitude DECIMAL(10, 8),
Longitude DECIMAL(11, 8),
RiskLevel INT,
PRIMARY KEY (LocationID)
);
-- -----------------------------------------------------
-- Table Mission
-- -----------------------------------------------------
CREATE TABLE Mission (
MissionID INT AUTO_INCREMENT,
MissionName VARCHAR(255) NOT NULL UNIQUE,
Objective TEXT,
StartDate DATE,
EndDate DATE,
Status VARCHAR(50),
Region VARCHAR(100),
PRIMARY KEY (MissionID)
);
-- -----------------------------------------------------
-- Table Organization
-- -----------------------------------------------------
CREATE TABLE Organization (
OrgName VARCHAR(255),
Type VARCHAR(100),
HQ_LocationID INT,
OrgID INT UNIQUE,
PRIMARY KEY (OrgID),
FOREIGN KEY (HQ_LocationID) REFERENCES Location(LocationID)
ON DELETE SET NULL
ON UPDATE CASCADE
);
-- -----------------------------------------------------
-- Table Artifact
-- -----------------------------------------------------
CREATE TABLE Artifact (
ArtifactID INT AUTO_INCREMENT,
ArtifactName VARCHAR(255) NOT NULL,
OriginCountry VARCHAR(100),
HistoricalValue DECIMAL(19, 2),
CurrentStatus VARCHAR(50),
MissionID INT,
PRIMARY KEY (ArtifactID),
FOREIGN KEY (MissionID) REFERENCES Mission(MissionID)
ON DELETE SET NULL
ON UPDATE CASCADE
);
-- -----------------------------------------------------
-- Table Criminal
-- -----------------------------------------------------
CREATE TABLE Criminal (
CriminalID INT AUTO_INCREMENT,
Name VARCHAR(100) NOT NULL,
Alias VARCHAR(100) UNIQUE,
Nationality VARCHAR(100),
Status VARCHAR(50),
Member_Of INT,
PRIMARY KEY (CriminalID),
FOREIGN KEY (Member_Of) REFERENCES Organization(OrgID)
ON DELETE SET NULL
ON UPDATE CASCADE
);
-- -----------------------------------------------------
-- Table Operative
-- -----------------------------------------------------
CREATE TABLE Operative (
CriminalID INT,
Specialty VARCHAR(100),
HandlerID INT,
PRIMARY KEY (CriminalID),
FOREIGN KEY (CriminalID) REFERENCES Criminal(CriminalID)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (HandlerID) REFERENCES Criminal(CriminalID)
ON DELETE SET NULL
ON UPDATE CASCADE
);
-- -----------------------------------------------------
-- Table Leader (Child of Criminal)
-- -----------------------------------------------------
CREATE TABLE Leader (
CriminalID INT,
CommandRegion VARCHAR(100),
Leadership_Tier INT,
PRIMARY KEY (CriminalID),
FOREIGN KEY (CriminalID) REFERENCES Criminal(CriminalID)
ON DELETE CASCADE
ON UPDATE CASCADE
);
-- -----------------------------------------------------
-- Table Specialties
-- -----------------------------------------------------
CREATE TABLE Specialties (
Speciality_Name VARCHAR(100),
Speciality_ID INT UNIQUE,
PRIMARY KEY (Speciality_ID)
);
-- -----------------------------------------------------
-- Table AgentSkillset
-- -----------------------------------------------------
CREATE TABLE AgentSkillset (
AgentID INT,
Specialty_ID INT,
PRIMARY KEY (AgentID, Specialty_ID),
FOREIGN KEY (AgentID) REFERENCES Agent(AgentID)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (Specialty_ID) REFERENCES Specialties(Speciality_ID)
ON DELETE CASCADE
ON UPDATE CASCADE
);
-- -----------------------------------------------------
-- Table CriminalSkillset
-- -----------------------------------------------------
CREATE TABLE CriminalSkillset (
CriminalID INT,
Specialty_Name VARCHAR(100),
PRIMARY KEY (CriminalID, Specialty_Name),
FOREIGN KEY (CriminalID) REFERENCES Criminal(CriminalID)
ON DELETE CASCADE
ON UPDATE CASCADE
);
-- -----------------------------------------------------
-- Table AgentAssignment
-- -----------------------------------------------------
CREATE TABLE AgentAssignment (
AssignedID INT,
MissionID INT,
Role VARCHAR(100),
AgentID INT,
PRIMARY KEY (AssignedID, MissionID),
FOREIGN KEY (AgentID) REFERENCES Agent(AgentID)
ON DELETE RESTRICT
ON UPDATE CASCADE,
FOREIGN KEY (MissionID) REFERENCES Mission(MissionID)
ON DELETE CASCADE
ON UPDATE CASCADE
);
-- -----------------------------------------------------
-- Table MissionTask
-- -----------------------------------------------------
CREATE TABLE MissionTask (
MissionID INT,
TaskID INT,
Description TEXT,
AssignedAgentID INT,
Status VARCHAR(50),
PRIMARY KEY (MissionID, TaskID),
FOREIGN KEY (MissionID) REFERENCES Mission(MissionID)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (AssignedAgentID) REFERENCES Agent(AgentID)
ON DELETE SET NULL
ON UPDATE CASCADE
);
-- -----------------------------------------------------
-- Table Evidence
-- -----------------------------------------------------
CREATE TABLE Evidence (
MissionID INT,
EvidenceID INT,
Chain_Of_Custody VARCHAR(100),
Type VARCHAR(100),
Status VARCHAR(50),
CollectedBy_AgentID INT,
PRIMARY KEY (MissionID, EvidenceID),
FOREIGN KEY (MissionID) REFERENCES Mission(MissionID)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (CollectedBy_AgentID) REFERENCES Agent(AgentID)
ON DELETE SET NULL
ON UPDATE CASCADE
);
-- -----------------------------------------------------
-- Table ArtifactMovement
-- -----------------------------------------------------
CREATE TABLE ArtifactMovement (
HandledBy_AgentID INT,
MoveReason VARCHAR(255),
MovementID INT,
MovedOn DATETIME,
FromLocationID INT,
ToLocationID INT,
ArtifactID INT,
PRIMARY KEY (ArtifactID, MovementID),
FOREIGN KEY (HandledBy_AgentID) REFERENCES Agent(AgentID)
ON DELETE SET NULL
ON UPDATE CASCADE,
FOREIGN KEY (FromLocationID) REFERENCES Location(LocationID)
ON DELETE SET NULL
ON UPDATE CASCADE,
FOREIGN KEY (ToLocationID) REFERENCES Location(LocationID)
ON DELETE SET NULL
ON UPDATE CASCADE,
FOREIGN KEY (ArtifactID) REFERENCES Artifact(ArtifactID)
ON DELETE CASCADE
ON UPDATE CASCADE
);
-- -----------------------------------------------------
-- Table Intelshare
-- -----------------------------------------------------
CREATE TABLE Intelshare (
CriminalID INT,
SenderAgentID INT,
ReceiverAgentID INT,
PRIMARY KEY (CriminalID, SenderAgentID, ReceiverAgentID),
FOREIGN KEY (CriminalID) REFERENCES Criminal(CriminalID)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (SenderAgentID) REFERENCES Agent(AgentID)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (ReceiverAgentID) REFERENCES Agent(AgentID)
ON DELETE CASCADE
ON UPDATE CASCADE
);
-- -----------------------------------------------------
-- Table CriminalInvolvement
-- -----------------------------------------------------
CREATE TABLE CriminalInvolvement (
MissionID INT,
CriminalID INT,
Reward DECIMAL(19, 2),
Arrested BOOLEAN,
Role VARCHAR(100),
PRIMARY KEY (MissionID, CriminalID),
FOREIGN KEY (MissionID) REFERENCES Mission(MissionID)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (CriminalID) REFERENCES Criminal(CriminalID)
ON DELETE CASCADE
ON UPDATE CASCADE
);
-- -----------------------------------------------------
-- Table Tracks
-- -----------------------------------------------------
CREATE TABLE Tracks (
CriminalID INT,
MissionID INT,
PRIMARY KEY (CriminalID, MissionID),
FOREIGN KEY (CriminalID) REFERENCES Criminal(CriminalID)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (MissionID) REFERENCES Mission(MissionID)
ON DELETE CASCADE
ON UPDATE CASCADE
);
-- -----------------------------------------------------
-- Table Operation_logs
-- -----------------------------------------------------
CREATE TABLE Operation_logs (
AgentID INT,
ArtifactID INT,
LocationID INT,
MissionID INT,
PRIMARY KEY (AgentID, ArtifactID, LocationID, MissionID),
FOREIGN KEY (AgentID) REFERENCES Agent(AgentID)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (ArtifactID) REFERENCES Artifact(ArtifactID)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (MissionID) REFERENCES Mission(MissionID)
ON DELETE CASCADE
ON UPDATE CASCADE
);
-- -----------------------------------------------------
-- End of Database Schema
-- -----------------------------------------------------    