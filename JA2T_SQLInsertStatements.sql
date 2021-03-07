-- Insert Into Contract Statements
INSERT INTO CONTRACT (ContractID, ContractName, ContractRequestedBy, ContractCategory, ContractLocation) VALUES (seqContract_ID.nextVal, 'North Shore Highschool Maintenance', 'Evanston Schools', 'Maintenance', 'Evanston');
INSERT INTO CONTRACT (ContractID, ContractName, ContractRequestedBy, ContractCategory, ContractLocation) VALUES (seqContract_ID.nextVal,'Hyatt New Fountain', 'Hyatt Regency', 'New Business', 'Chicago');
INSERT INTO CONTRACT (ContractID, ContractName, ContractRequestedBy, ContractCategory, ContractLocation) VALUES (seqContract_ID.nextVal,'Rockford City Hall Trees', 'Rockford City', 'New Business', 'Rockford');

-- Insert into Project Statements
INSERT INTO PROJECT VALUES ('IL-SBJ-428-007', 'North Shore HS Maintenance - Trees, Lawn, Flowerbed', 25, '06-Jun-20', '1600 Dodge Ave', 'Evanston', 'Illinois', 60201, 'Steinmetz');
INSERT INTO PROJECT VALUES ('IL-HYT-554-009', 'Hyatt Regency - Magnificent Mile, Install New Fountain Outside of Entrance', 400, '01-May-20', '633 N St Clair St', 'Chicago', 'Illinois', 60611, 'Stretch');
INSERT INTO PROJECT VALUES ('IL-RCK-303-006', 'Rockford City Hall - Tree Trimming and Plant new trees along south Lawn', 360, '01-Apr-21', '425 E State St', 'Rockford', 'Illinois', 61104, 'Nguyen');

-- Insert into Invoice Values 
INSERT INTO INVOICE (InvoiceDate, InvoiceSchedule, InvoiceAmount, InvoiceDescription) VALUES ('01-Apr-20', 'Monthly', 5058.50, 'First Invoice for North Shore HS');
INSERT INTO INVOICE (InvoiceDate, InvoiceSchedule, InvoiceAmount, InvoiceDescription) VALUES ('01-May-20', 'One-Time', 15000.00, 'Initial Billing for Hyatt Fountain');
INSERT INTO INVOICE (InvoiceDate, InvoiceSchedule, InvoiceAmount, InvoiceDescription) VALUES ('01-July-20', 'Bi-Monthly', 6000.00, 'Maintenance Contract for Rockford Public Library');

-- Insert into Invoice Line Item
INSERT INTO INVOICE_LINE_ITEM (InvoiceID, InvoiceItemID, ContractID, Category) VALUES (1, 1, 1, 'Labor');
INSERT INTO INVOICE_LINE_ITEM (InvoiceID, InvoiceItemID, ContractID, Category) VALUES (1, 2, 1, 'Materials');
INSERT INTO INVOICE_LINE_ITEM (InvoiceID, InvoiceItemID, ContractID, Category) VALUES (2, 1, 2, 'Labor');

--Insert Bid Data
INSERT INTO BID VALUES (seqBid_ID.nextVal, '22-Nov-20', 25600.75);
INSERT INTO BID VALUES (seqBid_ID.nextVal, '15-Aug-19', 175500.25);
INSERT INTO BID VALUES (seqBid_ID.nextVal, '9-Jan-20', 202000.00);

-- Insert Contractor Data
-- EEOCompliance can be NULL from Exhibit B
INSERT INTO CONTRACTOR_INFO VALUES ('31-0646843', 'Lily Landscaping Company', 'Franklintown', 'Illinois','62270','Cook County',Null,'31-Dec-20');
INSERT INTO CONTRACTOR_INFO VALUES ('12-3456789', 'Onyx General', 'Chinatown', 'Illinois','62272','Food County','yes','16-Feb-21');
INSERT INTO CONTRACTOR_INFO VALUES ('98-7654321', 'Modern Structure', 'Downtown', 'Illinois','62268','Bird County','no','30-Nov-20');

-- Insert Supplier Data
INSERT INTO SUPPLIER_INFO VALUES (seqSupplierInfo_ID.nextVal, 'Ace', '503-123-1234', 'AceHammer@supplier.com','765 E. Wood St, IL 62270');
INSERT INTO SUPPLIER_INFO VALUES (seqSupplierInfo_ID.nextVal, 'StoneWork', '503-444-6666', 'request@stonework.store','8681 S. Stone Ave, IL 62272');
INSERT INTO SUPPLIER_INFO VALUES (seqSupplierInfo_ID.nextVal, 'Skyline', '503-123-9876', 'supplier@skyline.material','123 W. Forest St, IL 62268');

--Insert Supplier Project Job Data 
INSERT INTO SUPPLIER_PROJECT VALUES (1, 'IL-SBJ-428-007', 'Tile #TL-123', 21.75, 100);
INSERT INTO SUPPLIER_PROJECT VALUES (2, 'IL-HYT-554-009', 'Stone #1', 8.75, 200); 
INSERT INTO SUPPLIER_PROJECT VALUES (3, 'IL-HYT-554-009', 'glass #105', 108.50, 20);

-- Insert Data into Employee_Info  
INSERT INTO EMPLOYEE_INFO (EmployeeSocialSecurityNumber, EmployeeFirstName, EmployeeMI, EmployeeLastName, EmployeeStreetAddress, EmployeeCity,
                            EmployeeState, EmployeeZipCode, EmployeePhone, EmployeeDateofBirth, EmployeeGender, EmployeeMaritalStatus, EmployeeRace)
VALUES ('123-45-6789', 'Michael', 'G', 'Scott', '1725 paper lane', 'Scranton', 'Pennsylvania', '18504', '123-456-7890', '12-Sep-1980', 'M', 'Single', '5');

INSERT INTO EMPLOYEE_INFO (EmployeeSocialSecurityNumber, EmployeeFirstName, EmployeeMI, EmployeeLastName, EmployeeStreetAddress, EmployeeCity,
                            EmployeeState, EmployeeZipCode, EmployeePhone, EmployeeDateofBirth, EmployeeGender, EmployeeMaritalStatus, EmployeeRace)
VALUES ('555-66-7777', 'Jim', 'B', 'Halpert', '1725 sales lane', 'Scranton', 'Pennsylvania', '18504', '098-765-4321', '18-Jan-1993', 'M', 'Married', '5');

INSERT INTO EMPLOYEE_INFO (EmployeeSocialSecurityNumber, EmployeeFirstName, EmployeeMI, EmployeeLastName, EmployeeStreetAddress, EmployeeCity,
                            EmployeeState, EmployeeZipCode, EmployeePhone, EmployeeDateofBirth, EmployeeGender, EmployeeMaritalStatus, EmployeeRace)
VALUES ('098-76-5432', 'Kevin', 'R', 'Milone', '1725 accounting lane', 'Scranton', 'Pennsylvania', '18504', '345-190-5321', '09-Dec-1986', 'M', 'Single', '5');

INSERT INTO EMPLOYEE_INFO (EmployeeSocialSecurityNumber, EmployeeFirstName, EmployeeMI, EmployeeLastName, EmployeeStreetAddress, EmployeeCity,
                            EmployeeState, EmployeeZipCode, EmployeePhone, EmployeeDateofBirth, EmployeeGender, EmployeeMaritalStatus, EmployeeRace)
VALUES ('098-76-9999', 'Calvin', 'R', 'Milone', '1725 accounting lane', 'Scranton', 'Pennsylvania', '18504', '345-190-5321', '09-Dec-1986', 'M', 'Single', '3');

INSERT INTO EMPLOYEE_INFO (EmployeeSocialSecurityNumber, EmployeeFirstName, EmployeeMI, EmployeeLastName, EmployeeStreetAddress, EmployeeCity,
                            EmployeeState, EmployeeZipCode, EmployeePhone, EmployeeDateofBirth, EmployeeGender, EmployeeMaritalStatus, EmployeeRace)
VALUES ('555-66-8888', 'Alice', 'B', 'Miller', '1725 sales lane', 'Scranton', 'Pennsylvania', '18504', '098-765-4321', '18-Jan-1993', 'F', 'Married', '5');

INSERT INTO EMPLOYEE_INFO (EmployeeSocialSecurityNumber, EmployeeFirstName, EmployeeMI, EmployeeLastName, EmployeeStreetAddress, EmployeeCity,
                            EmployeeState, EmployeeZipCode, EmployeePhone, EmployeeDateofBirth, EmployeeGender, EmployeeMaritalStatus, EmployeeRace)
VALUES ('098-76-5555', 'Rose', 'R', 'Bernt', '1725 accounting lane', 'Scranton', 'Pennsylvania', '18504', '345-190-5321', '09-Dec-1986', 'F', 'Single', '2');

-- Insert Data into Payroll
INSERT INTO PAYROLL (EmployeeNumber, GrossPay, Deductions, NetPay, PayPeriod)   VALUES  ('123-45-6789',  '550.89', '50.10', '500.79', '09-Nov-2020');
INSERT INTO PAYROLL (EmployeeNumber, GrossPay, Deductions, NetPay, PayPeriod)   VALUES  ('555-66-7777',  '650.10', '55.10', '595.00', '08-Jul-2020');
INSERT INTO PAYROLL (EmployeeNumber, GrossPay, Deductions, NetPay, PayPeriod)   VALUES  ('098-76-5432',  '600.70', '50.10', '550.60', '08-Oct-2020');

-- Insert Skill Data 
INSERT INTO SKILL VALUES ('LAB', 'Labor', 15, 3, 22.5);
INSERT INTO SKILL VALUES ('MAS', 'Masonry', 17, 3, 25.5);
INSERT INTO SKILL VAlUES ('EQP', 'Equipment Operation', 20, 3, 30);

-- Insert Data into Employee_Job
INSERT INTO EMPLOYEE_JOB (ProjectNumber, EmployeeNumber, SkillCode, ProjectDescription, ProjectDateWorked, Start_Time, End_Time, JobHours, OvertimeHoursWorked)
VALUES ('IL-SBJ-428-007', '098-76-5432', 'MAS', 'Concrete', '08-Jul-2020' , '08-Jul-2020 01:25:24', '08-Jul-2020 09:25:22', 8, 2);

INSERT INTO EMPLOYEE_JOB (ProjectNumber, EmployeeNumber, SkillCode, ProjectDescription, ProjectDateWorked, Start_Time, End_Time, JobHours, OvertimeHoursWorked)
VALUES ('IL-SBJ-428-007', '555-66-7777', 'MAS', 'Concrete', '08-Jun-2020' , '08-Jun-2020 01:25:24', '08-Jun-2020 09:25:22', 6, 0);
 
INSERT INTO EMPLOYEE_JOB (ProjectNumber, EmployeeNumber, SkillCode, ProjectDescription, ProjectDateWorked, Start_Time, End_Time, JobHours, OvertimeHoursWorked)
VALUES ( 'IL-HYT-554-009', '098-76-5432', 'EQP', 'Backhoe Driver', '08-Nov-2020' , '08-Nov-2020 03:45:24', '08-Nov-2020 10:45:30', 7, 0);

INSERT INTO EMPLOYEE_JOB (ProjectNumber, EmployeeNumber, SkillCode, ProjectDescription, ProjectDateWorked, Start_Time, End_Time, JobHours, OvertimeHoursWorked)
VALUES ( 'IL-HYT-554-009', '098-76-9999', 'EQP', 'Backhoe Driver', '06-Nov-2020' , '06-Nov-2020 03:45:24', '06-Nov-2020 10:45:30', 7, 0);

INSERT INTO EMPLOYEE_JOB (ProjectNumber, EmployeeNumber, SkillCode, ProjectDescription, ProjectDateWorked, Start_Time, End_Time, JobHours, OvertimeHoursWorked)
VALUES ('IL-HYT-554-009' , '123-45-6789', 'LAB', 'Drive truck', '09-Nov-2020' , '09-Nov-2020 3:15:24', '09-Nov-2020 8:15:30', 5, 0);

INSERT INTO EMPLOYEE_JOB (ProjectNumber, EmployeeNumber, SkillCode, ProjectDescription, ProjectDateWorked, Start_Time, End_Time, JobHours, OvertimeHoursWorked)
VALUES ('IL-HYT-554-009' , '555-66-8888', 'LAB', 'Drive truck', '09-Nov-2020' , '09-Nov-2020 3:15:24', '09-Nov-2020 8:15:30', 5, 0);

INSERT INTO EMPLOYEE_JOB (ProjectNumber, EmployeeNumber, SkillCode, ProjectDescription, ProjectDateWorked, Start_Time, End_Time, JobHours, OvertimeHoursWorked)
VALUES ('IL-HYT-554-009', '098-76-5555', 'MAS', 'Concrete', '08-Jun-2020' , '08-Jun-2020 01:25:24', '08-Jun-2020 09:25:22', 6, 0);
 
INSERT INTO EMPLOYEE_JOB (ProjectNumber, EmployeeNumber, SkillCode, ProjectDescription, ProjectDateWorked, Start_Time, End_Time, JobHours, OvertimeHoursWorked)
VALUES ('IL-HYT-554-009', '123-45-6789', 'MAS', 'Concrete', '08-Jun-2020' , '08-Jun-2020 01:25:24', '08-Jun-2020 09:25:22', 6, 0);
 
-- Insert Tool Data
INSERT INTO TOOL (ToolType, ToolBrand, ToolMaintenancePerformed, Rental) VALUES ('Shovel', 'Bully Tools', '01-May-2020', 'No');
INSERT INTO TOOL (ToolType, ToolBrand, ToolMaintenancePerformed, Rental) VALUES ('Wet Vac', 'Craftsmen', NULL, 'Yes');
INSERT INTO TOOL (ToolType, ToolBrand, ToolMaintenancePerformed, Rental) VALUES ('Riding Mower', 'John Deere', '01-Sep-2020', 'No');

-- Insert Vehicle Data
INSERT INTO VEHICLE (VehicleMake, VehicleModel, VehicleMaintenancePerformed, Rental) VALUES ('Ford', 'F-150', '15-Jul-2020', 'No');
INSERT INTO VEHICLE (VehicleMake, VehicleModel, VehicleMaintenancePerformed, Rental) VALUES ('CAT', 'Backhoe Loader', NULL, 'Yes');
INSERT INTO VEHICLE (VehicleMake, VehicleModel, VehicleMaintenancePerformed, Rental) VALUES ('Ford', 'Transit', NULL, 'Yes');

-- Insert Rental Data 
INSERT INTO RENTAL (RentalSupplier, RentalStartDate, RentalEndDate, RentalTotalCost) VALUES ('Home Depot', '01-Sep-2020', '02-Sep-2020', 100.00);
INSERT INTO RENTAL (RentalSupplier, RentalStartDate, RentalEndDate, RentalTotalCost) VALUES ('Illinois Truck', '01-Aug-2020', '15-Aug-2020', 6750.00);
INSERT INTO RENTAL (RentalSupplier, RentalStartDate, RentalEndDate, RentalTotalCost) VALUES ('Enterprise', '01-Jul-2020', '08-Jul-2020', 820.00);