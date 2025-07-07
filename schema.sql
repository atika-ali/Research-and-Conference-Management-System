
-- Student Table
CREATE TABLE Student (
    StudentID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100),
    Program VARCHAR(50),
    Year INT
);

-- Faculty Table
CREATE TABLE Faculty (
    FacultyID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Department VARCHAR(50)
);

-- Project Table
CREATE TABLE Project (
    ProjectID VARCHAR(10) PRIMARY KEY,
    Title VARCHAR(100),
    Objective TEXT,
    StartDate DATE,
    EndDate DATE,
    FundingAmount DECIMAL(10,2),
    Sponsor VARCHAR(100)
);

-- Publication Table
CREATE TABLE Publication (
    DOI VARCHAR(50) PRIMARY KEY,
    Title VARCHAR(100),
    Year INT,
    Type VARCHAR(50),
    Publisher VARCHAR(100),
    ProjectID VARCHAR(10),
    FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID)
);

-- Conference Table
CREATE TABLE Conference (
    ConferenceID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(100),
    Date DATE,
    Type VARCHAR(50)
);

-- ProjectsMade (Junction Table)
CREATE TABLE ProjectsMade (
    ProjectID VARCHAR(10),
    StudentID VARCHAR(10),
    FacultyID VARCHAR(10),
    DOI VARCHAR(50),
    ConferenceID VARCHAR(10),
    InvolvementHours INT,
    Role VARCHAR(50),
    PRIMARY KEY (ProjectID, StudentID, FacultyID, DOI, ConferenceID),
    FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID),
    FOREIGN KEY (DOI) REFERENCES Publication(DOI),
    FOREIGN KEY (ConferenceID) REFERENCES Conference(ConferenceID)
);
