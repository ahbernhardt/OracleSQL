-- CREATE BID TABLE
CREATE  TABLE BID(
    BidID               Int                     NOT NULL,
    BidDate             Date                    NOT NULL,
    BidAmount           Decimal(12,2)           NOT NULL,
    CONSTRAINT          BID_PK                  PRIMARY KEY(BidID)
    );
    CREATE SEQUENCE seqBid_ID INCREMENT BY 1 START WITH 1;

-- CREATE CONTRACTOR_INFO TABLE
CREATE TABLE CONTRACTOR_INFO ( 
    ContractorNumber                 VarChar(11)                NOT NULL, 
    ContractorName                   VarChar(45)                NOT NULL, 
    ContractorCity                   VarChar(25)                NOT NULL, 
    ContractorState                  VarChar(20)                NOT NULL, 
    ContractorZip                    VarChar(5)                 NOT NULL,
    ContractorCounty                 VarChar(25)                NOT NULL,
    EEOCompliance                    VARCHAR(3)                 NULL,
    EEOComplianceExpiryDate          Date                       NULL,
    CONSTRAINT                       CONTRACTOR_INFO_PK         PRIMARY KEY(ContractorNumber)
    );


-- CREATE SUPPLIER_INFO TABLE
CREATE TABLE SUPPLIER_INFO ( 
    SupplierID                      INT                        NOT NULL, 
    SupplierName                    VarChar(45)                NOT NULL, 
    SupplierPhone                   VarChar(12)                NOT NULL, 
    SupplierEmail                   VarChar(100)               NOT NULL, 
    SupplierAddress                 VarChar(150)               NOT NULL,
    CONSTRAINT                      SUPPLIER_INFO_PK                PRIMARY KEY(SupplierID)
    );
    CREATE SEQUENCE seqSupplierInfo_ID INCREMENT BY 1 START WITH 1;

-- CREATE CONTRACT TABLE
CREATE TABLE CONTRACT ( 
    ContractID                      INT                        NOT NULL, 
    ContractName                    VarChar(45)                NOT NULL, 
    ContractRequestedBy             VarChar(25)                NOT NULL, 
    ContractCategory                VarChar(20)                NOT NULL, 
    ContractLocation                VarChar(25)                NOT NULL,
    CONSTRAINT                      CONTRACT_PK                PRIMARY KEY(ContractID)
    );
    CREATE SEQUENCE seqContract_ID INCREMENT BY 1 START WITH 1;

-- CREATE Project Table
CREATE TABLE PROJECT(
 
ProjectNumber              VARCHAR(14)      NOT NULL,
ProjectDescription         VARCHAR(100)     NOT NULL,
ProjectHoursApproved       INT              NOT NULL,
ProjectDate                DATE             NOT NULL,
ProjectStreetAddress       VARCHAR(40)      NOT NULL,
ProjectCity                VARCHAR(30)      NOT NULL,
ProjectState               VARCHAR(20)      NOT NULL,
ProjectZipCode             VARCHAR(10)      NOT NULL,
ProjectSupervisor          VARCHAR(30)      NOT NULL,
 
CONSTRAINT              PROJECT_PK          PRIMARY KEY(ProjectNumber));

-- CREATE SUPPLIER_PROJECT TABLE
CREATE TABLE SUPPLIER_PROJECT ( 
    SupplierID                              INT                        NOT NULL, 
    ProjectNumber                           VARCHAR(14)                NOT NULL, 
    SupplierProjectDescription              VarChar(300)               NOT NULL, 
    SupplierProjectCost                     Decimal(12,2)              NOT NULL, 
    SupplierProjectQuantity                 INT                        NOT NULL,
    CONSTRAINT                              SUPPLIER_PROJECT_PK                 PRIMARY KEY(SupplierID, ProjectNumber),
      CONSTRAINT                            SUPPLIERID_PROJECT_FK               FOREIGN KEY(SupplierID)           REFERENCES SUPPLIER_INFO(SupplierID),
      CONSTRAINT                            SUPPLIER_PROJECTNUMBER_FK           FOREIGN KEY(ProjectNumber)        REFERENCES PROJECT(ProjectNumber) 
    );
    CREATE SEQUENCE seqSupplierProject_ID INCREMENT BY 1 START WITH 1;

--Create Skill Table
CREATE TABLE SKILL  (
    SkillCode                   Char(3)         PRIMARY KEY     NOT NULL,
    SkillClassification         VarChar(40)     NOT NULL,
    SkillPaymentRate            Decimal(4,2)     NULL,
    FringeBenefitPayment        Decimal(4,2)     NULL,
    OvertimeSkillPaymentRate    Decimal(4,2)     NULL);
 
-- Create Employee Info Table   
CREATE TABLE EMPLOYEE_INFO(
 
EmployeeSocialSecurityNumber        VARCHAR(11)     NOT NULL,
EmployeeFirstName                   VARCHAR(20)     NOT NULL,
EmployeeMI                          VARCHAR(2)      NULL,
EmployeeLastName                    VARCHAR(30)     NOT NULL,
EmployeeStreetAddress               VARCHAR(30)     NOT NULL,
EmployeeCity                        VARCHAR(30)     NOT NULL,
EmployeeState                       VARCHAR(20)     NOT NULL,
EmployeeZipCode                     VARCHAR(10)     NOT NULL,
EmployeePhone                       VARCHAR(12)     NOT NULL,
EmployeeDateofBirth                 DATE            NOT NULL,
EmployeeGender                      CHAR(1)         NOT NULL,
EmployeeMaritalStatus               VARCHAR(10)     NOT NULL,
EmployeeRace                        INT             NOT NULL,
 
CONSTRAINT              EMPLOYEE_INFO_PK       PRIMARY KEY(EmployeeSocialSecurityNumber));

-- Create Employee Job Table
CREATE TABLE EMPLOYEE_JOB(
EmployeeJobTrackingNumber  INT GENERATED ALWAYS AS IDENTITY   PRIMARY KEY  NOT NULL,
ProjectNumber                      VARCHAR(14)  NOT NULL,
EmployeeNumber                     VARCHAR(11)  NOT NULL,
SkillCode                          CHAR(3)      NOT NULL,
ProjectDescription                 VARCHAR(30)  NOT NULL,
ProjectDateWorked                  DATE         NOT NULL,
Start_Time                         TIMESTAMP    NOT NULL,
End_Time                           TIMESTAMP    NOT NULL,
JobHours                           INT          NOT NULL,
OvertimeHoursWorked                INT          NULL,
 
CONSTRAINT              EMPLOYEE_PROJECTNUMBER_FK   FOREIGN KEY(ProjectNumber) REFERENCES
                                                    PROJECT(ProjectNumber),
 
CONSTRAINT              EMPLOYEE_SSN_FK             FOREIGN KEY(EmployeeNumber) REFERENCES
                                                    EMPLOYEE_INFO(EmployeeSocialSecurityNumber),
                                                    
CONSTRAINT              EMPLOYEE_SKILL_FK           FOREIGN KEY(SkillCode) REFERENCES
                                                    SKILL(SkillCode)
);

-- Invoice Table
CREATE TABLE INVOICE (
    InvoiceID   INT     GENERATED ALWAYS AS IDENTITY    PRIMARY KEY    NOT NULL,
    InvoiceDate DATE    NOT NULL,
    InvoiceSchedule     VarChar(20)     NOT NULL,
    InvoiceAmount       Decimal(12,2)   NULL,
    InvoiceDescription   VarChar(250)   NULL);

--Invoice Line Item Table
CREATE TABLE INVOICE_LINE_ITEM(
    InvoiceID           INT     NOT NULL,
    InvoiceItemID       INT     NOT NULL,
    ContractID          INT     NOT NULL,
    Category            VarChar(40) NULL,
    CONSTRAINT  InvoiceID_FK    FOREIGN KEY (InvoiceID)
    REFERENCES INVOICE (InvoiceID),
    CONSTRAINT  ContractID_FK   FOREIGN KEY (ContractID)
    REFERENCES CONTRACT (ContractID), 
    PRIMARY KEY (InvoiceID, InvoiceItemID)); 
    
--Payroll Table
CREATE TABLE PAYROLL (
    CheckNumber INT     GENERATED ALWAYS AS IDENTITY    PRIMARY KEY    NOT NULL,
    EmployeeNumber    VARCHAR(11)          NOT NULL,
    GrossPay          Decimal(12,2)     NULL,
    Deductions        Decimal(12,2)     NULL,
    NetPay            Decimal(12,2)     NULL,
    PayPeriod         DATE              NULL,
    CONSTRAINT   EmployeeNumber_FK   FOREIGN KEY (EmployeeNumber)
    REFERENCES   EMPLOYEE_INFO (EmployeeSocialSecurityNumber));
    
--Tool Table
CREATE TABLE TOOL   (
    ToolID  INT     GENERATED ALWAYS AS IDENTITY    PRIMARY KEY        NOT NULL,
    ToolType        VarChar(30)     NOT NULL,
    ToolBrand       VarChar(30)     NOT NULL,
    ToolMaintenancePerformed    DATE    NULL,
    Rental          VarChar(3)     NOT NULL);
    
--Rental Table
CREATE TABLE RENTAL (
    RentalID    INT  GENERATED ALWAYS AS IDENTITY    PRIMARY KEY       NOT NULL,
    RentalSupplier   VarChar(50) NOT NULL,
    RentalStartDate  DATE        NOT NULL,
    RentalEndDate    DATE        NOT NULL,
    RentalTotalCost  Decimal(9,2)    NULL);
    
-- Vehicle Table
CREATE TABLE VEHICLE (
    VehicleID   INT  GENERATED ALWAYS AS IDENTITY    PRIMARY KEY       NOT NULL,
    VehicleMake                     VarChar(50) NOT NULL,
    VehicleModel                    VarChar(50) NOT NULL,
    VehicleMaintenancePerformed     DATE        NULL,
    Rental                          VarChar(3)     NOT NULL);
  
