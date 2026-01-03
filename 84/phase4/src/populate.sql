USE mini_world_db;

-- --------------------------------------------------------
-- 1. LOCATION (40 rows)
-- --------------------------------------------------------
INSERT INTO Location (City, Country, Region, Latitude, Longitude, RiskLevel) VALUES
('Hyderabad','India','South Asia',17.3850,78.4867,3),
('Mumbai','India','South Asia',19.0760,72.8777,3),
('Delhi','India','South Asia',28.7041,77.1025,4),
('London','United Kingdom','Western Europe',51.5074,-0.1278,2),
('Paris','France','Western Europe',48.8566,2.3522,2),
('Berlin','Germany','Western Europe',52.5200,13.4050,2),
('Cairo','Egypt','North Africa',30.0444,31.2357,5),
('Istanbul','Turkey','Eurasia',41.0082,28.9784,4),
('New York','USA','North America',40.7128,-74.0060,2),
('Los Angeles','USA','North America',34.0522,-118.2437,2),
('Tokyo','Japan','East Asia',35.6762,139.6503,1),
('Seoul','South Korea','East Asia',37.5665,126.9780,1),
('Bangkok','Thailand','Southeast Asia',13.7563,100.5018,3),
('Singapore','Singapore','Southeast Asia',1.3521,103.8198,1),
('Dubai','UAE','Middle East',25.2048,55.2708,2),
('Doha','Qatar','Middle East',25.2854,51.5310,2),
('Moscow','Russia','Eastern Europe',55.7558,37.6173,4),
('Rome','Italy','Southern Europe',41.9028,12.4964,2),
('Madrid','Spain','Southern Europe',40.4168,-3.7038,2),
('Lisbon','Portugal','Southern Europe',38.7223,-9.1393,2),
('Athens','Greece','Southern Europe',37.9838,23.7275,3),
('Beirut','Lebanon','Middle East',33.8938,35.5018,4),
('Tehran','Iran','Middle East',35.6892,51.3890,5),
('Karachi','Pakistan','South Asia',24.8607,67.0011,4),
('Kathmandu','Nepal','South Asia',27.7172,85.3240,3),
('Sydney','Australia','Oceania',-33.8688,151.2093,1),
('Melbourne','Australia','Oceania',-37.8136,144.9631,1),
('Rio de Janeiro','Brazil','South America',-22.9068,-43.1729,3),
('São Paulo','Brazil','South America',-23.5558,-46.6396,3),
('Buenos Aires','Argentina','South America',-34.6037,-58.3816,2),
('Mexico City','Mexico','North America',19.4326,-99.1332,4),
('Toronto','Canada','North America',43.6532,-79.3832,1),
('Vancouver','Canada','North America',49.2827,-123.1207,1),
('Johannesburg','South Africa','Africa',-26.2041,28.0473,4),
('Nairobi','Kenya','Africa',-1.2921,36.8219,3),
('Lagos','Nigeria','Africa',6.5244,3.3792,4),
('Cape Town','South Africa','Africa',-33.9249,18.4241,2),
('Stockholm','Sweden','Northern Europe',59.3293,18.0686,1),
('Helsinki','Finland','Northern Europe',60.1699,24.9384,1),
('Zurich','Switzerland','Central Europe',47.3769,8.5417,1);

-- --------------------------------------------------------
-- 2. SPECIALTIES (35 rows)
-- --------------------------------------------------------
INSERT INTO Specialties (Speciality_Name, Speciality_ID) VALUES
('Forensics',1),
('Cybersecurity',2),
('Negotiation',3),
('Surveillance',4),
('Explosives',5),
('Undercover Ops',6),
('Linguistics',7),
('Smuggling Detection',8),
('Artifact Authentication',9),
('Maritime Security',10),
('Border Patrol',11),
('Financial Crimes',12),
('Counterintelligence',13),
('Forgery Analysis',14),
('Data Analysis',15),
('Drone Operations',16),
('Underwater Recovery',17),
('Transport Logistics',18),
('Interrogation',19),
('Signals Intelligence',20),
('Human Intelligence',21),
('Tactical Driving',22),
('Emergency Medicine',23),
('Hazardous Materials',24),
('Cryptography',25),
('OSINT',26),
('Legal Affairs',27),
('Public Relations',28),
('Archive Research',29),
('Urban Recon',30),
('Mountain Ops',31),
('Air Cargo Screening',32),
('Railway Security',33),
('Customs Liaison',34),
('Cultural Heritage Law',35);

-- --------------------------------------------------------
-- 3. ORGANIZATION (35 rows)
-- --------------------------------------------------------
INSERT INTO Organization (OrgID, OrgName, Type, HQ_LocationID) VALUES
(1001,'Global Antiquities Watch','NGO',4),
(1002,'InterState Security Agency','Government',9),
(1003,'Red Crescent Logistics','Humanitarian',7),
(1004,'Black Market Network','Criminal Syndicate',8),
(1005,'Heritage Recovery Council','NGO',6),
(1006,'Euro Antique Consortium','Private',5),
(1007,'Asia-Pacific Cultural Exchange','Nonprofit',11),
(1008,'Western Heritage Foundation','NGO',18),
(1009,'Transcontinental Shipment Co.','Private',9),
(1010,'Central Customs Authority','Government',31),
(1011,'International Registry of Antiquities','Intergovernmental',4),
(1012,'Shadow Brokers','Criminal Syndicate',17),
(1013,'Global Transit Security','Private',32),
(1014,'Antique Auction House Group','Private',5),
(1015,'Heritage Protection Unit','Government',1),
(1016,'Middle East Recovery Taskforce','Intergovernmental',22),
(1017,'South Asia Artifact Council','NGO',3),
(1018,'LatAm Preservation Society','Nonprofit',28),
(1019,'Oceanic Recovery Initiative','NGO',26),
(1020,'Euro-Asia Liaison Office','Intergovernmental',8),
(1021,'National Museum Network','Government',18),
(1022,'Black Ledger Syndicate','Criminal Syndicate',36),
(1023,'Global Insurance Underwriters','Private',30),
(1024,'Maritime Salvage Partners','Private',26),
(1025,'Cultural Assets Registry','Intergovernmental',5),
(1026,'Private Security Solutions','Private',31),
(1027,'Transnational Brokers','Criminal Syndicate',14),
(1028,'Customs Intelligence Unit','Government',31),
(1029,'Artifact Recovery Cooperative','Nonprofit',29),
(1030,'International Police Exchange','Intergovernmental',6),
(1031,'Regional Heritage Group','NGO',21),
(1032,'Underground Appraisers','Criminal Syndicate',17),
(1033,'Heritage Logistics Ltd','Private',32),
(1034,'Railway Safeguard Authority','Government',39),
(1035,'Aerial Cargo Inspectors','Private',38);

-- --------------------------------------------------------
-- 4. AGENT (40 rows)
-- --------------------------------------------------------
INSERT INTO Agent (FirstName, LastName, `Rank`, Agency, Country, HireDate, Email, Phone) VALUES
('Arjun','Mehra','Senior Agent','InterState Security Agency','India','2016-03-12','arjun.mehra@isa.gov','+91-40-23450001'),
('Lena','Thompson','Field Agent','Global Antiquities Watch','UK','2018-07-22','lena.thompson@gaw.org','+44-20-79460001'),
('Omar','El-Sayed','Analyst','Red Crescent Logistics','Egypt','2019-01-15','omar.elsayed@rcl.org','+20-2-27900001'),
('Selim','Kaya','Operative','InterState Security Agency','Turkey','2017-05-30','selim.kaya@isa.gov.tr','+90-212-0000001'),
('Grace','Harrison','Lead Investigator','InterState Security Agency','USA','2015-11-09','grace.harrison@isa.gov','+1-212-5550001'),
('Maya','Rao','Forensics Expert','Global Antiquities Watch','India','2020-09-01','maya.rao@gaw.org','+91-40-98765001'),
('Nikhil','Desai','Junior Agent','InterState Security Agency','India','2022-02-14','nikhil.desai@isa.gov','+91-40-44447001'),
('Isabella','Moretti','Undercover Agent','Western Heritage Foundation','Italy','2017-09-20','isabella.moretti@whf.it','+39-06-1234001'),
('Jonas','Kovacs','Surveillance Lead','Euro Antique Consortium','Hungary','2014-06-18','jonas.kovacs@eac.hu','+36-1-2345001'),
('Priya','Kulkarni','Analyst','Asia-Pacific Cultural Exchange','India','2019-11-03','priya.kulkarni@apce.in','+91-40-33330001'),
('Ahmed','Ali','Field Agent','Central Customs Authority','Pakistan','2018-04-10','ahmed.ali@cca.pk','+92-21-2222001'),
('Sofia','Garcia','Forensics Expert','LatAm Preservation Society','Argentina','2016-08-24','sofia.garcia@lps.ar','+54-11-4000001'),
('Diego','Mendes','Logistics Specialist','Transcontinental Shipment Co.','Brazil','2015-12-01','diego.mendes@tsc.br','+55-11-3000001'),
('Yuki','Tanaka','Cyber Analyst','Aerial Cargo Inspectors','Japan','2020-01-05','yuki.tanaka@aci.jp','+81-3-2000001'),
('Hannah','Nguyen','Liaison Officer','Heritage Protection Unit','Vietnam','2013-03-03','hannah.nguyen@hpu.vn','+84-4-2000001'),
('Tariq','Hussain','Senior Operative','Middle East Recovery Taskforce','Afghanistan','2012-10-10','tariq.hussain@mert.af','+93-70-1000001'),
('Nina','Petrova','Intelligence Officer','International Police Exchange','Russia','2014-12-12','nina.petrova@ipe.ru','+7-495-1000001'),
('Kareem','Saleh','Field Officer','Global Transit Security','Egypt','2019-05-06','kareem.saleh@gts.eg','+20-2-1000001'),
('Lucia','Fernandez','Archivist','International Registry of Antiquities','Spain','2011-07-07','lucia.fernandez@ira.es','+34-91-1000001'),
('Olu','Adesanya','Customs Liaison','Central Customs Authority','Nigeria','2016-02-02','olu.adesanya@cca.ng','+234-1-1000001'),
('Zhang','Wei','Analyst','Euro-Asia Liaison Office','China','2018-08-08','zhang.wei@ealo.cn','+86-10-1000001'),
('Marta','Nowak','Forensics Specialist','Heritage Logistics Ltd','Poland','2017-01-15','marta.nowak@hll.pl','+48-22-1000001'),
('Ethan','Cole','Transport Lead','Maritime Salvage Partners','Canada','2015-05-20','ethan.cole@msp.ca','+1-416-1000001'),
('Aria','Singh','Negotiator','South Asia Artifact Council','India','2019-09-09','aria.singh@saac.in','+91-40-2000001'),
('Felix','Kumar','Field Agent','Private Security Solutions','UK','2021-04-04','felix.kumar@pss.uk','+44-20-2000001'),
('Marisol','Diaz','Undercover Specialist','Artifact Recovery Cooperative','Peru','2016-06-06','marisol.diaz@arc.pe','+51-1-1000001'),
('Owen','Murphy','K9 Handler','Railway Safeguard Authority','Ireland','2013-11-11','owen.murphy@rsa.ie','+353-1-1000001'),
('Sven','Larsson','Drone Pilot','Aerial Cargo Inspectors','Sweden','2018-03-03','sven.larsson@aci.se','+46-8-1000001'),
('Mei','Chen','Archivist','International Registry of Antiquities','China','2010-10-10','mei.chen@ira.cn','+86-21-1000001'),
('Pedro','Lopez','Data Analyst','Global Insurance Underwriters','Mexico','2019-02-02','pedro.lopez@giu.mx','+52-55-1000001'),
('Aisha','Kamal','Field Agent','Heritage Protection Unit','Egypt','2020-07-07','aisha.kamal@hpu.eg','+20-2-2000001'),
('Tom','Wright','Security Lead','Transnational Brokers','UK','2014-04-04','tom.wright@tb.uk','+44-20-3000001'),
('Hiro','Sato','Analyst','Euro-Asia Liaison Office','Japan','2021-06-06','hiro.sato@ealo.jp','+81-3-3000001'),
('Lea','Martinez','Field Agent','Global Transit Security','Chile','2022-10-10','lea.martinez@gts.cl','+56-2-3000001'),
('Riya','Sharma','Forensics','Global Antiquities Watch','India','2021-08-15','riya.sharma@gaw.org','+91-40-2890001'),
('Daniel','Knight','Cyber Investigator','InterState Security Agency','USA','2018-11-07','daniel.knight@isa.gov','+1-212-5590001'),
('Chen','Guang','Interpreter','International Police Exchange','China','2019-09-12','chen.guang@ipe.cn','+86-10-4000001'),
('Sara','Mehmet','Legal Advisor','Asia-Pacific Cultural Exchange','Turkey','2016-07-22','sara.mehmet@apce.tr','+90-212-4400001'),
('Anna','Kuznetsova','OSINT Specialist','LatAm Preservation Society','Russia','2014-05-16','anna.kuznetsova@lps.org','+7-499-5551001'),
('Noah','Kim','Medical Support','Heritage Protection Unit','South Korea','2020-01-15','noah.kim@hpu.kr','+82-2-4000001');

-- --------------------------------------------------------
-- 5. MISSION (40 rows)
-- --------------------------------------------------------
INSERT INTO Mission (MissionName, Objective, StartDate, EndDate, Status, Region) VALUES
('Operation Pharos','Recover stolen artifact from smugglers','2024-06-01','2024-06-21','Completed','North Africa'),
('Operation Nightfall','Disrupt underground antiquities traffickers','2025-02-15',NULL,'Ongoing','Eurasia'),
('Operation Anchor','Secure artifact shipment','2024-11-01','2024-11-03','Completed','North America'),
('Operation Horizon','Investigate smuggling routes','2025-05-01',NULL,'Planned','South Asia'),
('Operation Atlas','Audit antiquities registries','2025-08-01',NULL,'Planned','Europe'),
('Operation Triton','Underwater recovery mission','2024-09-10','2024-09-30','Completed','Oceania'),
('Operation Centurion','Cross-border smuggling interdiction','2023-12-01','2024-01-15','Completed','Central Europe'),
('Operation Meridian','Intercept rail shipment','2025-01-05',NULL,'Ongoing','Central Europe'),
('Operation Dawn','Prevent illegal artifact auction','2024-03-20','2024-04-05','Completed','Southern Europe'),
('Operation Seawatch','Monitor maritime trafficking','2024-10-01',NULL,'Ongoing','North Atlantic'),
('Operation Bridge','Investigate insured artifact losses','2025-02-01',NULL,'Planned','Latin America'),
('Operation Vault','Secure national museum transfer','2023-11-10','2023-11-12','Completed','Western Europe'),
('Operation Echo','Track online black-market sales','2024-08-01','2024-11-30','Completed','Global'),
('Operation Anchor II','Maritime escort follow-up','2024-12-10','2025-01-10','Completed','North America'),
('Operation Nimbus','Air cargo audit','2025-04-01',NULL,'Planned','Northern Europe'),
('Operation Compass','Identify smuggling corridors','2024-05-01','2024-07-15','Completed','South America'),
('Operation Keystone','Investigate missing manifests','2025-03-01',NULL,'Ongoing','Asia'),
('Operation Echo II','Deep web infiltration mission','2025-06-10',NULL,'Planned','Global'),
('Operation Harbor','Patrol custody transfers','2024-02-01','2024-02-28','Completed','North Africa'),
('Operation Lighthouse','Survey historical wreck site','2023-07-01','2023-08-01','Completed','Oceania'),
('Operation Beacon','Regional intelligence sweep','2025-09-01',NULL,'Planned','Middle East'),
('Operation Relay','Cross-border intelligence link','2024-04-01','2024-04-30','Completed','South Asia'),
('Operation Sentinel','High-value artifact protection','2025-07-01',NULL,'Planned','North America'),
('Operation Cipher','Forgery network investigation','2024-01-01','2024-02-15','Completed','Eastern Europe'),
('Operation Atlas II','Registry consolidation','2025-10-01',NULL,'Planned','Europe'),
('Operation Horizon II','Extended smuggling-route probe','2025-11-01',NULL,'Planned','South Asia'),
('Operation Tide','Intercept salvage dealers','2024-06-15','2024-07-15','Completed','South America'),
('Operation Crosslink','Joint multinational task force','2024-09-01','2024-10-15','Completed','Global'),
('Operation Oracle','Analyze provenance archives','2023-10-01','2023-12-01','Completed','Western Europe'),
('Operation Hermes','Escort royal exhibition assets','2024-05-10','2024-05-20','Completed','Western Europe'),
('Operation Atlas III','Final heritage audit','2025-12-01',NULL,'Planned','Europe'),
('Operation Harbor II','Museum custody chain check','2024-11-15','2024-11-20','Completed','North Africa'),
('Operation Nightwatch','Surveillance of suspect convoy','2024-08-15','2024-09-15','Completed','Eurasia'),
('Operation Phantom','Undercover asset retrieval','2024-03-01','2024-04-01','Completed','Middle East'),
('Operation Ledger','Financial trail investigation','2024-07-01','2024-08-01','Completed','Global'),
('Operation Crossroads','Regional route analysis','2025-02-01',NULL,'Ongoing','Central Asia'),
('Operation Echo III','Black-market takedown','2025-05-01',NULL,'Planned','Global'),
('Operation Harbor III','Extended custody patrol','2024-12-01','2024-12-15','Completed','North Africa'),
('Operation Watchtower','Long-range reconnaissance','2024-01-15','2024-02-15','Completed','Northern Europe');

-- --------------------------------------------------------
-- 6. ARTIFACT (40 rows)
-- --------------------------------------------------------
INSERT INTO Artifact (ArtifactName, OriginCountry, HistoricalValue, CurrentStatus, MissionID) VALUES
('Pharos Bronze Statuette','Egypt',120000,'Recovered',1),
('Sarcophagus Mask Fragment','Egypt',250000,'Recovered',1),
('Ottoman Scroll','Turkey',45000,'Missing',2),
('Indus Valley Seal','India',90000,'In Custody',4),
('Maritime Compass (18th C)','UK',15000,'Secured',3),
('Roman Gold Coin','Italy',30000,'In Custody',9),
('Samurai Katana','Japan',85000,'In Transit',15),
('Ancient Clay Tablet','Iraq',50000,'Seized',21),
('Mayan Figurine','Mexico',67000,'Secured',30),
('Viking Shield Fragment','Sweden',40000,'Recovered',38),
('Egyptian Papyrus Script','Egypt',70000,'Recovered',1),
('Greek Amphora','Greece',55000,'In Custody',10),
('Persian Dagger','Iran',96000,'Missing',22),
('Byzantine Pendant','Turkey',38000,'Secured',2),
('Terracotta Warrior Shard','China',62000,'Recovered',17),
('Mughal Miniature Painting','India',74000,'In Transit',27),
('Aztec Gold Pendant','Mexico',88000,'Recovered',29),
('Phoenician Coin Set','Lebanon',53000,'Recovered',20),
('Olmec Stone Mask','Mexico',99000,'In Custody',11),
('Benin Bronze Plaque','Nigeria',81000,'Seized',33),
('Celtic Torque','Ireland',42000,'Recovered',28),
('Medieval Cross','France',25000,'In Custody',12),
('Neolithic Axe','Germany',17000,'Secured',7),
('Qin Dynasty Scroll','China',92000,'Seized',17),
('Ink Brush Set (Dynastic)','China',35000,'Secured',18),
('Ottoman Copper Bowl','Turkey',21000,'Recovered',8),
('African Tribal Mask','Kenya',27000,'In Transit',34),
('Andean Textile','Peru',26000,'Secured',31),
('Sikh Kirpan','India',29000,'In Custody',26),
('Mariner’s Astrolabe','Portugal',31000,'Recovered',19),
('Phoenician Jewelry Set','Lebanon',48000,'Recovered',23),
('Runestone Fragment','Norway',56000,'In Custody',16),
('Mamluk Sword','Egypt',61000,'Missing',21),
('Thracian Bracelet','Bulgaria',37000,'Recovered',24),
('Zulu Ceremonial Spear','South Africa',29000,'Seized',36),
('Olive-Grove Pottery','Greece',13000,'Recovered',39),
('Buddhist Idol Head','Thailand',68000,'Seized',13),
('Edo Period Scroll','Japan',49000,'Recovered',14),
('Renaissance Medallion','Italy',57000,'In Custody',6);


-- --------------------------------------------------------
-- 7. CRIMINAL (40 rows)
-- --------------------------------------------------------
INSERT INTO Criminal (Name, Alias, Nationality, Status, Member_Of) VALUES
('Rashid Omar','The Curator','Egypt','At Large',1004),
('Vlad Petrov','Silver Fox','Russia','Captured',NULL),
('Leyla Arslan','Night Sparrow','Turkey','At Large',1004),
('Imran Qureshi','Broker','India','At Large',1027),
('Carlos Mendes','El Lobo','Brazil','Deceased',NULL),
('Nadia Petrova','Ghost','Russia','At Large',1004),
('Tarek Hassan','Falcon','Egypt','At Large',1004),
('Mikhail Orlov','Iron Wolf','Russia','Captured',1012),
('Farid Rahman','Smuggler King','Pakistan','At Large',1027),
('Aamir Malik','Snakecharmer','India','At Large',1004),
('Yusuf Ali','Cobra','Turkey','At Large',1004),
('Sergio Alvarez','Black Cat','Spain','At Large',1012),
('Maria Lopez','The Widow','Mexico','Captured',NULL),
('Omar Ben-Said','Sand Viper','Morocco','At Large',1004),
('Julian Cross','The Forger','USA','At Large',1012),
('Dane Rurik','Phantom','Ukraine','At Large',1022),
('Chen Long','Dragon','China','At Large',NULL),
('Hiro Tanaka','Silent Wind','Japan','Captured',1027),
('Abdul Karim','Merchant','UAE','At Large',1020),
('Pavel Mironov','Shadow','Russia','At Large',1022),
('Sebastian Kruger','Iron Hand','Germany','At Large',1013),
('Lucien Moreau','The Whisper','France','Captured',NULL),
('Nuru Okoye','Jackal','Nigeria','At Large',1022),
('Mohammed Idris','Viper','Saudi Arabia','At Large',1020),
('Rafiq Jalal','Chameleon','Afghanistan','At Large',1020),
('Samuel Osei','Rhino','Ghana','Captured',NULL),
('Alberto Gomez','El Zorro','Chile','At Large',1027),
('Hassan Qadir','The Raven','Pakistan','At Large',1012),
('Ivan Petrenko','Scar','Ukraine','Captured',NULL),
('Renee Laurent','Nightingale','France','At Large',1011),
('Kaito Nakamura','Shadow Blade','Japan','At Large',1027),
('Adebayo Olu','Hyena','Nigeria','At Large',1022),
('Said Darman','Mantis','Indonesia','At Large',1004),
('Tala Hamdi','Dove','Lebanon','At Large',1020),
('Yuri Antonov','Huntsman','Russia','Captured',NULL),
('Min Seo-jun','Crow','South Korea','At Large',1027),
('Vico Romano','Lion','Italy','At Large',1014),
('Jorge Ruiz','Hawk','Peru','At Large',1018),
('Nishant Rao','Falconeer','India','At Large',1004),
('Eren Yilmaz','Wolf','Turkey','At Large',1027);


-- --------------------------------------------------------
-- 8. LEADER (10 entries)
-- --------------------------------------------------------
INSERT INTO Leader (CriminalID, CommandRegion, Leadership_Tier) VALUES
(1,'North Africa',1),
(3,'Eurasia',2),
(7,'North Africa',2),
(11,'Anatolia',1),
(14,'Maghreb',3),
(20,'Eastern Europe',2),
(23,'West Africa',1),
(31,'East Asia',2),
(37,'South America',1),
(39,'South Asia',3);


-- --------------------------------------------------------
-- 9. OPERATIVE (15 entries)
-- --------------------------------------------------------
INSERT INTO Operative (CriminalID, Specialty, HandlerID) VALUES
(2,'Smuggling Logistics',1),
(4,'Fence Networks',1),
(6,'Counterintelligence',3),
(8,'Explosives Handling',1),
(9,'Routes Management',7),
(10,'Local Network Ops',3),
(12,'Intel Gathering',14),
(13,'Trafficking Assist',1),
(15,'Forgery Expertise',3),
(16,'Field Surveillance',20),
(18,'Cyber Cover Ops',3),
(19,'Transport Routes',14),
(21,'Documentation Fraud',20),
(25,'Courier Networks',20),
(27,'Logistics',3);

-- --------------------------------------------------------
-- 10. AGENTSKILLSET (70+ rows)
-- --------------------------------------------------------
INSERT INTO AgentSkillset (AgentID, Specialty_ID) VALUES
(1,4),(1,2),(1,20),
(2,6),(2,9),
(3,15),(3,3),
(4,4),(4,16),
(5,3),(5,12),
(6,1),(6,9),
(7,2),(7,15),
(8,6),(8,7),
(9,4),(9,21),
(10,15),(10,26),
(11,11),(11,20),
(12,1),(12,23),
(13,18),(13,10),
(14,2),(14,25),
(15,19),(15,23),
(16,4),(16,18),
(17,20),(17,13),
(18,3),(18,21),
(19,29),(19,12),
(20,8),(20,11),
(21,2),(21,15),
(22,1),(22,9),
(23,10),(23,18),
(24,3),(24,19),
(25,6),(25,26),
(26,6),(26,30),
(27,4),(27,16),
(28,1),(28,29),
(29,15),(29,25),
(30,26),(30,28),
(31,3),(31,20),
(32,2),(32,15),
(33,22),(33,11),
(34,1),(34,9),
(35,17),(35,10),
(36,2),(36,21),
(37,1),(37,23),
(38,25),(38,14),
(39,3),(39,26),
(40,23),(40,24);

-- --------------------------------------------------------
-- 11. CRIMINALSKILLSET (60+ rows)
-- --------------------------------------------------------
INSERT INTO CriminalSkillset (CriminalID, Specialty_Name) VALUES
(1,'Surveillance'),(1,'Smuggling Logistics'),
(2,'Forgery'),(2,'Explosives Handling'),
(3,'Intel Networks'),(3,'Counterintelligence'),
(4,'Fence Networks'),(4,'Forgery'),
(5,'Local Smuggling'),
(6,'Counterintelligence'),
(7,'Cross-Border Movement'),
(8,'Explosives Handling'),
(9,'Routes Management'),
(10,'Disguise'),
(11,'Street Operations'),
(12,'Black Market Liaison'),
(13,'Trafficking Assist'),
(14,'Navigation Specialist'),
(15,'Forgery Expertise'),
(16,'Field Surveillance'),
(17,'Cyber Ops'),
(18,'Cyber Cover Ops'),
(19,'Transport Routes'),
(20,'Documentation Fraud'),
(21,'Intel Analysis'),
(22,'Art Appraisal Fraud'),
(23,'West African Network'),
(24,'Desert Smuggling'),
(25,'Courier Ops'),
(26,'Heavy Transport'),
(27,'Logistics'),
(28,'Forgery'),
(29,'Route Disruption'),
(30,'Smuggling Ops'),
(31,'Silent Operations'),
(32,'Espionage'),
(33,'Arms Trafficking'),
(34,'Cultural Theft'),
(35,'Border Bypass'),
(36,'Dark Web Trading'),
(37,'South American Network'),
(38,'Maritime Fraud'),
(39,'Smuggling Logistics'),
(40,'Underworld Recon');

-- --------------------------------------------------------
-- 12. AGENTASSIGNMENT (80 rows)
-- --------------------------------------------------------
INSERT INTO AgentAssignment (AssignedID, MissionID, Role, AgentID) VALUES
(1001,1,'Team Lead',1),(1002,1,'Forensics',6),(1003,1,'Field Agent',4),
(1004,2,'Field Agent',2),(1005,2,'Undercover',8),(1006,2,'Tech Support',14),
(1007,3,'Logistics',13),(1008,3,'Security',5),
(1009,4,'Coordinator',10),(1010,4,'Negotiator',24),
(1011,5,'Auditor',19),(1012,5,'Research Analyst',30),
(1013,6,'Diver',35),(1014,6,'Support',22),
(1015,7,'Border Ops',11),(1016,7,'Intel',17),
(1017,8,'Rail Ops',27),(1018,8,'Drone Support',28),
(1019,9,'Field Analyst',3),(1020,9,'Forensics',6),
(1021,10,'Maritime Watch',23),(1022,10,'Tech Monitoring',14),
(1023,11,'Audit Lead',31),(1024,11,'Archivist',29),
(1025,12,'Escort Lead',5),(1026,12,'Security',32),
(1027,13,'Cyber Analyst',14),(1028,13,'OSINT',39),
(1029,14,'Escort Lead',23),(1030,14,'Backup',5),
(1031,15,'Cargo Audit Lead',28),(1032,15,'Data Review',36),
(1033,16,'Analyst',3),(1034,16,'Investigator',1),
(1035,17,'Intercept Ops',11),(1036,17,'Liaison',18),
(1037,18,'Web Monitor',14),(1038,18,'Research',30),
(1039,19,'Patrol',10),(1040,19,'Field Support',20),
(1041,20,'Marine Ops',35),(1042,20,'Navigation',23),
(1043,21,'Intel Sweep',18),(1044,21,'Coordination',24),
(1045,22,'Border Survey',1),(1046,22,'Field Ops',4),
(1047,23,'Protection Lead',5),(1048,23,'Tech',2),
(1049,24,'Forgery Analyst',6),(1050,24,'Investigator',14),
(1051,25,'Registry Lead',19),(1052,25,'Archivist',22),
(1053,26,'Smuggling Route',1),(1054,26,'Mapping',10),
(1055,27,'Interception',11),(1056,27,'Analysis',17),
(1057,28,'Joint Taskforce',3),(1058,28,'Foreign Liaison',21),
(1059,29,'Archive Research',30),(1060,29,'Forensics',6),
(1061,30,'Protection Lead',5),(1062,30,'Investigator',14),
(1063,31,'Audit',29),(1064,31,'Field Support',10),
(1065,32,'Custody Lead',20),(1066,32,'Transport',23),
(1067,33,'Convoy Surveillance',4),(1068,33,'Drone Support',28),
(1069,34,'Undercover Ops',8),(1070,34,'Field Analyst',3),
(1071,35,'Recon',27),(1072,35,'Security',32),
(1073,36,'Financial Crimes',14),(1074,36,'Coordination',17),
(1075,37,'Analysis',30),(1076,37,'Forward Ops',18),
(1077,38,'Protection',5),(1078,38,'Coordination',1),
(1079,39,'Recon',27),(1080,39,'Tracking',11),
(1081,40,'Surveillance',3),(1082,40,'Backup',6);

-- --------------------------------------------------------
-- 13. MISSIONTASK (100 rows)
-- --------------------------------------------------------
INSERT INTO MissionTask (MissionID, TaskID, Description, AssignedAgentID, Status) VALUES
(1,1,'Search crime scene',6,'Completed'),
(1,2,'Interview witnesses',1,'Completed'),
(1,3,'Analyze recovered samples',6,'Completed'),
(2,1,'Track darknet marketplace',14,'Ongoing'),
(2,2,'Undercover communication',8,'Ongoing'),
(2,3,'Identify seller nodes',14,'Planned'),
(3,1,'Escort shipment',5,'Completed'),
(3,2,'Verify cargo integrity',13,'Completed'),
(3,3,'Secure unloading zone',5,'Completed'),
(4,1,'Route mapping',10,'Planned'),
(4,2,'Coordinate checkpoints',24,'Planned'),
(5,1,'Audit record books',30,'Completed'),
(5,2,'Digital verification',19,'Completed'),
(6,1,'Underwater scanning',35,'Completed'),
(6,2,'Diving prep',22,'Completed'),
(6,3,'Artifact recovery',35,'Completed'),
(7,1,'Border surveillance',17,'Completed'),
(7,2,'Patrol operations',11,'Completed'),
(8,1,'Rail cargo anomaly detection',27,'Ongoing'),
(8,2,'Drone flyover',28,'Ongoing'),
(9,1,'Undercover infiltration',3,'Completed'),
(9,2,'Auction surveillance',6,'Completed'),
(10,1,'Coast guard coordination',23,'Ongoing'),
(10,2,'Cargo manifest scan',14,'Ongoing'),
(11,1,'Insurance audit',29,'Completed'),
(11,2,'Asset value confirmation',30,'Completed'),
(12,1,'High-security escort',5,'Completed'),
(12,2,'Museum transfer clearance',32,'Completed'),
(13,1,'Cyber infiltration',14,'Completed'),
(13,2,'Dark web identity check',39,'Completed'),
(14,1,'Ship escort',23,'Completed'),
(14,2,'Cargo backup security',5,'Completed'),
(15,1,'Air cargo logs check',36,'Planned'),
(15,2,'Drone scan of containers',28,'Planned'),
(16,1,'Identify corridors',3,'Completed'),
(16,2,'Coordinate intel',1,'Completed'),
(17,1,'Manifest scan',11,'Ongoing'),
(17,2,'Cargo search',18,'Ongoing'),
(18,1,'Dark web monitoring',14,'Ongoing'),
(18,2,'Vendor pattern tracking',30,'Ongoing'),
(19,1,'Port patrol',10,'Completed'),
(19,2,'Secure customs area',20,'Completed'),
(20,1,'Dive site evaluation',35,'Completed'),
(20,2,'Recovery analysis',23,'Completed'),
(21,1,'Regional sweep',24,'Ongoing'),
(21,2,'Network coordination',18,'Ongoing'),
(22,1,'Border mapping',1,'Completed'),
(22,2,'Surveillance tracking',4,'Completed'),
(23,1,'High-value escort',5,'Completed'),
(23,2,'Tech scanning',2,'Completed'),
(24,1,'Forgery detection',6,'Completed'),
(24,2,'Source tracking',14,'Completed'),
(25,1,'Registry compilation',22,'Ongoing'),
(25,2,'Record digitization',19,'Ongoing'),
(26,1,'Route intercept',1,'Completed'),
(26,2,'Cargo analysis',10,'Completed'),
(27,1,'Dealer identification',17,'Completed'),
(27,2,'Transaction mapping',11,'Completed'),
(28,1,'Joint force coordination',3,'Completed'),
(28,2,'Foreign liaison',21,'Completed'),
(29,1,'Archive scan',30,'Completed'),
(29,2,'Object authentication',6,'Completed'),
(30,1,'Escort planning',5,'Completed'),
(30,2,'Risk assessment',14,'Completed'),
(31,1,'Audit update',29,'Completed'),
(31,2,'Verification',10,'Completed'),
(32,1,'Custody scan',20,'Completed'),
(32,2,'Transport logs check',23,'Completed'),
(33,1,'Convoy tracking',4,'Completed'),
(33,2,'Drone monitoring',28,'Completed'),
(34,1,'Undercover prep',8,'Completed'),
(34,2,'Field analysis',3,'Completed'),
(35,1,'Recon planning',27,'Ongoing'),
(35,2,'Security setup',32,'Ongoing'),
(36,1,'Financial trail',14,'Completed'),
(36,2,'Coordination meet',17,'Completed'),
(37,1,'Regional analysis',30,'Completed'),
(37,2,'Forward ops',18,'Completed'),
(38,1,'Protection duties',5,'Completed'),
(38,2,'Coordination',1,'Completed'),
(39,1,'Recon operations',27,'Completed'),
(39,2,'Tracking ops',11,'Completed'),
(40,1,'Long-range scan',3,'Completed'),
(40,2,'Backup',6,'Completed');


-- --------------------------------------------------------
-- 14. EVIDENCE (80 rows)
-- --------------------------------------------------------
INSERT INTO Evidence (MissionID, EvidenceID, Chain_Of_Custody, Type, Status, CollectedBy_AgentID) VALUES
(1,1,'Arjun → Maya → HQ','Metal Fragment','Stored',6),
(1,2,'Field → Lab','Photographs','Stored',1),
(1,3,'HQ → Lab','Soil Sample','Stored',6),
(2,1,'Undercover → HQ','Replica Set','Seized',2),
(2,2,'Intercept → Locker','Digital Logs','Stored',14),
(2,3,'HQ → Evidence','USB Drive','Seized',8),
(3,1,'Port → Grace','Manifest','Archived',5),
(3,2,'HQ → Storage','Seal Sample','Archived',13),
(3,3,'Escort → HQ','Container Tag','Stored',5),
(4,1,'Team → HQ','Route Map','Stored',10),
(4,2,'Checkpoint → HQ','Traffic Logs','Stored',24),
(5,1,'Audit → Archive','Registry Copy','Archived',19),
(5,2,'Digital → HQ','Digital Records','Stored',30),
(6,1,'Dive Team → HQ','Sediment Sample','Stored',35),
(6,2,'Diver → HQ','Submerged Photo','Stored',22),
(7,1,'Border Team → HQ','Vehicle Record','Stored',17),
(7,2,'Patrol → HQ','Checkpoint Seal','Stored',11),
(8,1,'Drone → HQ','Aerial Footage','Stored',27),
(8,2,'Rail → HQ','Cargo Chip','Stored',28),
(9,1,'Field → HQ','Auction Ticket','Stored',3),
(9,2,'HQ → Storage','Bid Logs','Stored',6),
(10,1,'Coast Guard → HQ','Shipping Logs','Stored',23),
(10,2,'Marine Patrol → HQ','Cargo Image','Stored',14),
(11,1,'Audit → HQ','Insurance File','Stored',29),
(11,2,'HQ → Archive','Value Sheet','Archived',30),
(12,1,'Escort → HQ','Transfer Receipt','Stored',5),
(12,2,'Museum → HQ','Seal Code','Stored',32),
(13,1,'Cyber → HQ','Chat Logs','Stored',14),
(13,2,'HQ → Locker','Seller Profile','Stored',39),
(14,1,'Escort → HQ','Navigation Log','Stored',23),
(14,2,'HQ → Storage','Backup Seal','Stored',5),
(15,1,'Cargo → HQ','Audit Log','Stored',36),
(15,2,'HQ → Archive','Drone File','Archived',28),
(16,1,'Field → HQ','Corridor Photo','Stored',3),
(16,2,'HQ → Database','Border Data','Stored',1),
(17,1,'Rail → HQ','Scan Logs','Stored',11),
(17,2,'HQ → Data','Cargo Tag','Stored',18),
(18,1,'Monitor → HQ','Vendor Logs','Stored',14),
(18,2,'HQ → Locker','Deep Web List','Stored',30),
(19,1,'Customs → HQ','Port Logs','Stored',10),
(19,2,'HQ → Storage','Customs Seal','Stored',20),
(20,1,'Dive → HQ','Dive Notes','Stored',35),
(20,2,'Team → HQ','Recovery Tag','Stored',23),
(21,1,'Sweep → HQ','Intel Sweep','Stored',24),
(21,2,'HQ → Locker','Network Map','Stored',18),
(22,1,'Border → HQ','Border Record','Stored',1),
(22,2,'Team → HQ','Checkpoint List','Stored',4),
(23,1,'Escort → HQ','Object Tag','Stored',5),
(23,2,'HQ → Archive','Protection File','Archived',2),
(24,1,'Forgery → HQ','Forgery Report','Stored',6),
(24,2,'HQ → Storage','Ink Sample','Stored',14),
(25,1,'Registry → HQ','Registry List','Stored',22),
(25,2,'HQ → Locker','Digital Audit','Stored',19),
(26,1,'Intercept → HQ','Map Fragment','Stored',1),
(26,2,'HQ → Storage','Cargo Map','Stored',10),
(27,1,'Dealer → HQ','Dealer Photos','Stored',17),
(27,2,'HQ → Locker','Purchase Logs','Stored',11),
(28,1,'Joint → HQ','Joint Report','Stored',3),
(28,2,'HQ → Locker','Foreign Notes','Stored',21),
(29,1,'Archive → HQ','Archive Page','Stored',30),
(29,2,'HQ → Storage','Authentication List','Stored',6),
(30,1,'Escort → HQ','Escort Form','Stored',5),
(30,2,'HQ → Locker','Risk Sheet','Stored',14),
(31,1,'Audit → HQ','Audit Sheet','Stored',29),
(31,2,'HQ → Locker','Verification Logs','Stored',10),
(32,1,'Custody → HQ','Custody File','Stored',20),
(32,2,'HQ → Storage','Transport Logs','Stored',23),
(33,1,'Convoy → HQ','Convoy Sheet','Stored',4),
(33,2,'HQ → Storage','Drone Images','Stored',28),
(34,1,'Undercover → HQ','Undercover File','Stored',8),
(34,2,'HQ → Locker','Analysis Report','Stored',3),
(35,1,'Recon → HQ','Recon Log','Stored',27),
(35,2,'HQ → Storage','Security Sheet','Stored',32),
(36,1,'Finance → HQ','Finance Logs','Stored',14),
(36,2,'HQ → Locker','Coordination Sheet','Stored',17),
(37,1,'Regional → HQ','Analysis Logs','Stored',30),
(37,2,'HQ → Storage','Ops File','Stored',18),
(38,1,'Protection → HQ','Protection Tag','Stored',5),
(38,2,'HQ → Locker','Coordination File','Stored',1),
(39,1,'Recon → HQ','Recon Sheet','Stored',27),
(39,2,'HQ → Locker','Tracking Sheet','Stored',11),
(40,1,'Scan → HQ','Scan Logs','Stored',3),
(40,2,'HQ → Locker','Backup File','Stored',6);

-- --------------------------------------------------------
-- 15. ARTIFACTMOVEMENT (50 rows)
-- --------------------------------------------------------
INSERT INTO ArtifactMovement 
(HandledBy_AgentID, MoveReason, MovementID, MovedOn, FromLocationID, ToLocationID, ArtifactID) VALUES
(6,'Transfer to HQ',9001,'2024-06-05 14:30:00',7,9,1),
(1,'Move to secure vault',9002,'2024-06-06 10:00:00',9,4,2),
(14,'Transport for analysis',9003,'2025-02-18 18:30:00',8,5,3),
(10,'Transit inspection',9004,'2025-05-03 09:00:00',1,14,4),
(23,'Escort to museum',9005,'2024-11-02 15:20:00',4,18,5),
(6,'Sent to forensic lab',9006,'2024-06-07 16:00:00',7,10,6),
(35,'Recovery extraction',9007,'2024-09-12 12:00:00',26,28,7),
(22,'Transport to archive',9008,'2024-09-20 17:00:00',28,30,8),
(14,'Interception transfer',9009,'2025-02-20 21:00:00',32,17,9),
(20,'Secured in vault',9010,'2025-01-05 19:00:00',17,19,10),
(6,'Shipment movement',9011,'2024-06-10 11:30:00',7,9,11),
(23,'Ship loading',9012,'2024-10-10 10:00:00',18,9,12),
(1,'Court evidence transfer',9013,'2024-02-10 15:00:00',22,17,13),
(10,'Museum exhibit transfer',9014,'2025-04-06 11:00:00',14,4,14),
(36,'Lab analysis relocation',9015,'2025-03-11 09:45:00',17,33,15),
(30,'Evidence storage',9016,'2024-07-21 08:30:00',29,31,16),
(11,'Secure escort',9017,'2024-11-15 10:10:00',11,18,17),
(24,'Temporary holding movement',9018,'2025-03-05 13:30:00',34,21,18),
(5,'Final vault placement',9019,'2024-03-22 09:00:00',18,12,19),
(3,'Inspection shift',9020,'2024-04-11 16:00:00',12,19,20),
(27,'Operational transfer',9021,'2024-06-25 12:10:00',9,20,21),
(14,'Security review',9022,'2025-01-15 13:00:00',5,7,22),
(6,'Courier movement',9023,'2024-06-08 14:00:00',3,11,23),
(23,'Seizure relocation',9024,'2024-05-14 19:00:00',21,25,24),
(10,'Customs inspection',9025,'2024-03-20 10:00:00',22,26,25),
(28,'Vault reassignment',9026,'2025-04-12 17:00:00',5,3,26),
(35,'Site extraction',9027,'2024-09-18 11:00:00',28,1,27),
(17,'Forensic shift',9028,'2024-01-22 14:10:00',40,12,28),
(14,'International transfer',9029,'2025-06-08 18:00:00',12,30,29),
(5,'Cultural review movement',9030,'2024-04-01 09:00:00',6,33,30),
(21,'Recovery reposition',9031,'2025-02-15 20:00:00',23,15,31),
(6,'Museum preparation',9032,'2024-07-12 16:00:00',15,10,32),
(27,'Port movement',9033,'2024-10-19 12:00:00',9,6,33),
(3,'Inspection shift',9034,'2024-01-03 12:00:00',6,3,34),
(32,'Archive transfer',9035,'2024-08-30 13:00:00',30,4,35),
(10,'Security upgrade',9036,'2024-03-29 14:00:00',31,17,36),
(14,'New vault assignment',9037,'2025-05-11 11:00:00',17,5,37),
(6,'Transit movement',9038,'2024-06-09 11:00:00',11,9,38),
(17,'Custody shift',9039,'2025-02-05 10:00:00',22,19,39),
(18,'Legal hold transfer',9040,'2024-09-20 09:30:00',19,33,40),
(27,'Seizure transport',9041,'2024-11-03 19:20:00',14,20,1),
(5,'Post-recovery move',9042,'2024-06-06 07:00:00',20,18,2),
(28,'Dockside inspection',9043,'2024-07-27 08:40:00',18,26,3),
(21,'Security relocation',9044,'2024-03-09 10:10:00',33,29,4),
(14,'Lab sample courier',9045,'2025-01-02 13:40:00',29,23,5),
(11,'Archive request move',9046,'2024-10-11 07:20:00',23,30,6),
(1,'On-site analysis transfer',9047,'2024-06-15 17:30:00',30,33,7),
(23,'Museum inbound movement',9048,'2024-11-29 12:00:00',18,5,8),
(36,'Court order transfer',9049,'2025-03-03 22:00:00',5,11,9);

-- --------------------------------------------------------
-- 16. TRACKS (80+ rows)
-- --------------------------------------------------------
INSERT INTO Tracks (CriminalID, MissionID) VALUES
(1,1),(1,19),(1,33),
(2,12),(2,24),
(3,2),(3,28),(3,33),
(4,4),(4,26),
(5,3),
(6,2),(6,18),(6,37),
(7,1),(7,20),
(8,7),(8,36),
(9,4),(9,26),(9,39),
(10,2),(10,34),
(11,3),(11,18),
(12,29),(12,33),
(13,9),
(14,20),(14,37),
(15,24),(15,39),
(16,7),(16,17),
(17,13),(17,18),
(18,14),(18,15),
(19,21),(19,22),
(20,2),(20,3),
(21,7),(21,17),
(22,36),(22,37),
(23,20),
(24,13),(24,14),
(25,11),(25,12),(25,26),
(26,28),(26,31),
(27,29),(27,30),
(28,15),(28,33),
(29,24),(29,25),
(30,9),(30,20),
(31,16),(31,18),
(32,12),(32,17),
(33,27),(33,35),
(34,34),(34,39),
(35,35),(35,40),
(36,36),(36,38),
(37,37),(37,29),
(38,38),(38,32),
(39,26),(39,22),
(40,33),(40,11);

-- --------------------------------------------------------
-- 17. CRIMINALINVOLVEMENT (80 rows)
-- --------------------------------------------------------
INSERT INTO CriminalInvolvement (MissionID, CriminalID, Reward, Arrested, Role) VALUES
(1,1,50000,0,'Leader'),
(1,7,30000,0,'Accomplice'),
(2,3,45000,0,'Mastermind'),
(2,6,25000,0,'Courier'),
(3,5,20000,1,'Fence'),
(4,4,27000,0,'Broker'),
(4,9,65000,0,'Route Manager'),
(5,2,40000,1,'Forger'),
(6,17,15000,0,'Scout'),
(6,18,34000,1,'Cyber Ops'),
(7,8,50000,1,'Explosives'),
(7,16,29000,0,'Coordinator'),
(8,3,35000,0,'Mastermind'),
(8,27,15000,0,'Carrier'),
(9,13,45000,1,'Seller'),
(10,14,20000,0,'Navigator'),
(10,23,30000,0,'Regional Lead'),
(11,25,17000,0,'Middleman'),
(12,30,25000,1,'Shipper'),
(13,6,35000,0,'Cyber Liaison'),
(13,24,45000,0,'Underground Link'),
(14,20,30000,0,'Document Forger'),
(15,31,14000,0,'Silent Ops'),
(15,17,29000,1,'Tech Runner'),
(16,29,10000,0,'Trail Disruptor'),
(16,22,28000,0,'Appraiser'),
(17,11,23000,1,'Local Handler'),
(17,9,33000,0,'Route Manager'),
(18,3,45000,0,'Mastermind'),
(18,32,21000,0,'Digital Broker'),
(19,14,32000,1,'Navigator'),
(19,39,41000,0,'Supplier'),
(20,7,18000,0,'Tracker'),
(20,1,55000,0,'Leader'),
(21,23,26000,0,'Regional Chief'),
(21,36,37000,0,'Black Web Seller'),
(22,19,42000,0,'Merchant'),
(22,9,33000,0,'Route Manager'),
(23,5,25000,1,'Fence'),
(23,10,18000,0,'Local Network'),
(24,2,45000,0,'Forger'),
(24,14,30000,0,'Appraiser'),
(25,30,21000,0,'Transporter'),
(25,11,33000,1,'Local Handler'),
(26,31,23000,0,'Silent Ops'),
(26,25,29000,0,'Courier'),
(27,1,53000,0,'Leader'),
(27,7,25000,0,'Accomplice'),
(28,33,32000,0,'Arms Dealer'),
(28,35,39000,0,'Cultural Thief'),
(29,37,30000,0,'Regional Head'),
(29,27,18000,0,'Carrier'),
(30,38,40000,1,'Maritime Fraudster'),
(30,14,20000,0,'Navigator'),
(31,21,15000,1,'Document Forger'),
(31,3,44000,0,'Mastermind'),
(32,19,35000,0,'Merchant'),
(32,25,16000,0,'Courier'),
(33,11,35000,1,'Local Actor'),
(33,18,27000,1,'Cyber Ops'),
(34,10,22000,0,'Network Ops'),
(34,6,39000,0,'Counterintel'),
(35,32,18000,0,'Digital Broker'),
(35,36,36000,0,'Dark Web Seller'),
(36,14,30000,0,'Navigator'),
(36,1,56000,0,'Leader'),
(37,29,21000,0,'Trail Disruptor'),
(37,20,33000,0,'Document Forger'),
(38,9,34000,0,'Route Manager'),
(38,15,25000,0,'Forgery Specialist'),
(39,23,26000,0,'Regional Chief'),
(39,33,34000,0,'Arms Specialist'),
(40,2,45000,0,'Forger'),
(40,40,21000,0,'Recon Scout');

-- --------------------------------------------------------
-- 18. INTELSHARE (40+ rows)
-- --------------------------------------------------------
INSERT INTO Intelshare (CriminalID, SenderAgentID, ReceiverAgentID) VALUES
(1,1,6),
(1,6,10),
(2,14,22),
(3,3,14),
(3,14,28),
(4,10,24),
(5,13,5),
(6,14,39),
(7,1,17),
(8,17,11),
(9,11,3),
(10,4,1),
(11,3,28),
(12,29,30),
(13,3,8),
(14,23,5),
(15,14,6),
(16,17,20),
(17,30,14),
(18,14,30),
(19,20,10),
(20,17,3),
(21,24,18),
(22,1,4),
(23,5,29),
(24,14,6),
(25,22,19),
(26,1,10),
(27,11,17),
(28,21,3),
(29,30,6),
(30,5,23),
(31,29,10),
(32,17,14),
(33,4,28),
(34,8,3),
(35,30,27),
(36,14,17),
(37,18,30),
(38,5,23),
(39,27,11),
(40,3,6);

-- --------------------------------------------------------
-- 19. OPERATION_LOGS (40+ rows)
-- --------------------------------------------------------
INSERT INTO Operation_logs (AgentID, ArtifactID, LocationID, MissionID) VALUES
(1,1,7,1),
(6,2,9,1),
(5,3,8,3),
(10,4,1,4),
(23,5,18,14),
(6,6,7,6),
(35,7,26,6),
(22,8,28,6),
(14,9,32,2),
(20,10,17,20),
(6,11,7,1),
(23,12,18,10),
(1,13,22,22),
(10,14,14,10),
(36,15,17,36),
(30,16,29,25),
(11,17,11,21),
(24,18,34,21),
(5,19,18,23),
(3,20,12,24),
(27,21,9,28),
(14,22,5,22),
(6,23,3,24),
(23,24,21,20),
(10,25,22,25),
(28,26,5,28),
(35,27,28,20),
(17,28,40,35),
(14,29,12,29),
(5,30,6,23),
(21,31,23,31),
(6,32,15,32),
(27,33,9,33),
(3,34,6,34),
(32,35,30,35),
(10,36,31,36),
(14,37,17,37),
(6,38,11,38),
(17,39,22,39),
(18,40,19,40);

-- --------------------------------------------------------
-- UPDATE STATEMENTS (Required for Project)
-- --------------------------------------------------------

-- 1. Update an Agent’s phone number
UPDATE Agent
SET Phone = '+91-40-55590001'
WHERE AgentID = 7;

-- 2. Update mission status from Planned → Ongoing
UPDATE Mission
SET Status = 'Ongoing'
WHERE MissionID = 5;

-- 3. Increase historical value of an artifact after re-evaluation
UPDATE Artifact
SET HistoricalValue = HistoricalValue + 5000
WHERE ArtifactID = 16;

-- 4. Change criminal status after arrest
UPDATE Criminal
SET Status = 'Captured'
WHERE CriminalID = 1;

-- 5. Update location risk level
UPDATE Location
SET RiskLevel = 5
WHERE LocationID = 23;

-- 6. Update organization HQ location
UPDATE Organization
SET HQ_LocationID = 9
WHERE OrgID = 1030;

-- 7. Reassign an agent to a different mission role
UPDATE AgentAssignment
SET Role = 'Senior Field Agent'
WHERE AssignedID = 1003 AND MissionID = 1;

-- 8. Change artifact custody status
UPDATE Artifact
SET CurrentStatus = 'Archived'
WHERE ArtifactID = 37;

-- 9. Update evidence status from Stored → Archived
UPDATE Evidence
SET Status = 'Archived'
WHERE MissionID = 14 AND EvidenceID = 2;

-- 10. Correct typo in criminal alias
UPDATE Criminal
SET Alias = 'Night Sparrow'
WHERE CriminalID = 3;

-- --------------------------------------------------------
-- DELETE STATEMENTS (Required for Project)
-- --------------------------------------------------------

-- 1. Delete a specialty not used anywhere
DELETE FROM Specialties
WHERE Speciality_ID = 35;

-- 2. Delete a harmless operation log entry
DELETE FROM Operation_logs
WHERE AgentID = 18 AND ArtifactID = 40 AND LocationID = 19 AND MissionID = 40;

-- 3. Delete an unused intelshare entry
DELETE FROM Intelshare
WHERE CriminalID = 40 AND SenderAgentID = 3 AND ReceiverAgentID = 6;

-- 4. Delete a mission task marked as completed
DELETE FROM MissionTask
WHERE MissionID = 1 AND TaskID = 3;

-- 5. Delete a track record (safe)
DELETE FROM Tracks
WHERE CriminalID = 40 AND MissionID = 11;

-- 6. Delete an outdated evidence record
DELETE FROM Evidence
WHERE MissionID = 5 AND EvidenceID = 1;

-- 7. Delete an artifact movement that was entered twice
DELETE FROM ArtifactMovement
WHERE ArtifactID = 3 AND MovementID = 9043;

-- 8. Delete an agent skill entry (e.g., duplicate)
DELETE FROM AgentSkillset
WHERE AgentID = 6 AND Specialty_ID = 9;

-- 9. Remove criminal involvement in a minor mission
DELETE FROM CriminalInvolvement
WHERE MissionID = 15 AND CriminalID = 17;

-- 10. Delete a redundant assignment
DELETE FROM AgentAssignment
WHERE AssignedID = 1032 AND MissionID = 15;



