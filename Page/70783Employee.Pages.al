page 70783 "Employee API"
{
    APIVersion = 'v2.0';
    Caption = 'Employee', Locked = true;
    ChangeTrackingAllowed = true;
    DelayedInsert = true;
    EntityName = 'Employee';
    EntitySetName = 'Employee';
    //  ODataKeyFields = SystemId;
    PageType = API;
    APIPublisher = 'TechVentures';
    APIGroup = 'TechVentures';
    SourceTable = Employee;
    Extensible = false;

    layout
    {
        area(content)
        {
            repeater(A)
            {
                field(no; Rec."No.")
                {
                    Caption = 'No';
                }
                field(firstname; Rec."First Name")
                {
                    Caption = 'First Name';
                }
                field(lastname; Rec."Last Name")
                {
                    Caption = 'Last Name';
                }
                field(jobtitle; Rec."Job Title")
                {
                    Caption = 'Job Title';
                }
                field(phoneno; Rec."Phone No.")
                {
                    Caption = 'Phone No';
                }
                field(Effective; Rec.Effective)
                {
                    Caption = 'Effective';
                }
                field(Expiration; Rec.Expiration)
                {
                    Caption = 'Expiration';
                }
                field("ContractType"; Rec."Contract Type")
                {
                    Caption = 'Contract Type';
                }
                field(ContractorNumber; Rec.ContractorNumber)
                {
                    Caption = 'Contract Number';
                }
                field(PayGroup; Rec.PayGroup)
                {
                    Caption = 'Pay Group';
                }
                //New Field
                field(birthDate; Rec."Birth Date")
                {
                    Caption = 'Birth Date';
                }
                field(employeeAge; Rec."Employee Age")
                {
                    Caption = 'Employee Age';
                }
                field(titleNo; Rec.Title)
                {
                    Caption = 'Title No';
                }
                field(middleName; Rec."Middle Name")
                {
                    Caption = 'Middle Name';
                }
                field(positionDescription; Rec.Position)
                {
                    Caption = 'Position Description';
                }
                field(positionCategory; Rec."Position Category")
                {
                    Caption = 'Position Category';
                }
                field(positionOccupation; Rec.Occupation)
                {
                    Caption = 'Position Occupation';
                }
                field(employeeType; Rec."Employee Type")
                {
                    Caption = 'Employee Type';
                }
                field(division; Rec."Division Code")
                {
                    Caption = 'Division';
                }
                field(department; Rec."Emplymt. Contract Code")
                {
                    Caption = 'Department';
                }
                field(section; Rec."Section Code")
                {
                    Caption = 'Section';
                }
                field(lineManager; Rec."Supervisor Name")
                {
                    Caption = 'Line Manager';
                }
                field(lineManagerName; Rec."Supervisor Full Name")
                {
                    Caption = 'Line Manager Name';
                }
                field(maritalStatus; Rec."Social Status")
                {
                    Caption = 'Marital Status';
                }
                field(balanceLCY; Rec."Balance (LCY)")
                {
                    Caption = 'Balance (LCY)';
                }
                field(fullName; Rec."Search Name")
                {
                    Caption = 'Full Name';
                }
                field(gender; Rec.Gender)
                {
                    Caption = 'Gender';
                }
                field(companyPhoneNo; Rec."Phone No.")
                {
                    Caption = 'Company Phone No';
                }
                field(companyEmail; Rec."Company E-Mail")
                {
                    Caption = 'Company Email';
                }
                field(nationality; Rec.Nationality)
                {
                    Caption = 'Nationality';
                }
                field(finalApprover; Rec."Top Manager")
                {
                    Caption = 'Final Approver';
                }
                field(finalApproverName; Rec."Top Manager Name")
                {
                    Caption = 'Final Approver Name';
                }
                field(address; Rec.Address)
                {
                    Caption = 'Address';
                }
                field(address2; Rec."Address 2")
                {
                    Caption = 'Address 2';
                }
                field(city; Rec.City)
                {
                    Caption = 'City';
                }
                field(postCode; Rec."Post Code")
                {
                    Caption = 'Post Code';
                }
                field(countryRegionCode; Rec."Country/Region Code")
                {
                    Caption = 'Country / Region Code';
                }
                field(privatePhoneNo; Rec."Mobile Phone No.")
                {
                    Caption = 'Private Phone No';
                }
                field(pager; Rec.Pager)
                {
                    Caption = 'Pager';
                }
                field(extension; Rec.Extension)
                {
                    Caption = 'Extension';
                }
                field(officePhoneNo; Rec."Phone No.")
                {
                    Caption = 'Office Phone No';
                }
                field(privateEmail; Rec."E-Mail")
                {
                    Caption = 'Private Email';
                }
                field(placeOfBirth; Rec."Place of Birth")
                {
                    Caption = 'Place of Birth';
                }
                field(altAddressCode; Rec."Alt. Address Code")
                {
                    Caption = 'Alt. Address Code';
                }
                field(altAddressStartDate; Rec."Alt. Address Start Date")
                {
                    Caption = 'Alt. Address Start Date';
                }
                field(altAddressEndDate; Rec."Alt. Address End Date")
                {
                    Caption = 'Alt. Address End Date';
                }
                field(employmentDate; Rec."Employment Date")
                {
                    Caption = 'Employment Date';
                }
                field(serviceYear; Rec."Service Year")
                {
                    Caption = 'Service Year';
                }
                field(serviceMonth; Rec."Service Month")
                {
                    Caption = 'Service Month';
                }
                field(serviceDays; Rec."Service Days")
                {
                    Caption = 'Service Days';
                }
                field(probationDuration; Rec."Probation Period Type")
                {
                    Caption = 'Probation Duration';
                }
                field(probationDate; Rec.Probation_Date)
                {
                    Caption = 'Probation Date';
                }
                field(probationStatus; Rec.Probation_Status)
                {
                    Caption = 'Probation Status';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                }
                field(inactiveDate; Rec."Inactive Date")
                {
                    Caption = 'Inactive Date';
                }
                field(causeOfInactivityCode; Rec."Cause of Inactivity Code")
                {
                    Caption = 'Cause of Inactivity Code';
                }
                field(terminationDate; Rec."Termination Date")
                {
                    Caption = 'Termination Date';
                }
                field(groundsForTermCode; Rec."Grounds for Term. Code")
                {
                    Caption = 'Grounds for Term. Code';
                }
                field(shift; Rec.Shift)
                {
                    Caption = 'Shift';
                }
                field(leaveGroup; Rec.LeaveGroup)
                {
                    Caption = 'Leave Group';
                }
                field(userId; Rec.UserId)
                {
                    Caption = 'User ID';
                }
                field(employeePostingGroup; Rec."Employee Posting Group")
                {
                    Caption = 'Employee Posting Group';
                }
                field(pension; Rec.Pension)
                {
                    Caption = 'Pension';
                }
                field(gratuity; Rec.Gratuity)
                {
                    Caption = 'Gratuity';
                }
                field(gratuityGroup; Rec.GratuityGroup)
                {
                    Caption = 'Gratuity Group';
                }
                field(pensionGroup; Rec.PensionGroup)
                {
                    Caption = 'Pension Group';
                }
                field(payroll; Rec.Payroll)
                {
                    Caption = 'Payroll';
                }
                field(bloodGroup; Rec.Blood_Group)
                {
                    Caption = 'Blood Group';
                }
                field(religion; Rec.Religion)
                {
                    Caption = 'Religion';
                }
                field(socialSecurityNo; Rec."Social Security No.")
                {
                    Caption = 'Social Security No';
                }
                field(unionMembershipNo; Rec."Union Membership No.")
                {
                    Caption = 'Union Membership No';
                }
                field(unionCode; Rec."Union Code")
                {
                    Caption = 'Union Code';
                }
                field(airport; Rec.Airport)
                {
                    Caption = 'Airport';
                }
                field(accrualMonth; Rec."Accrual Months")
                {
                    Caption = 'Accrual Month';
                }
                field(maximumDependents; Rec."Maximum Dependents")
                {
                    Caption = 'Maximum Dependents';
                }
                field(inclEmployee; Rec."Maximum Dependents")
                {
                    Caption = 'Incl. Employee';
                }
                field(ticketType; Rec."Ticket Type")
                {
                    Caption = 'Ticket Type';
                }
                field(monthAccrualAmount; Rec."Monthly Accrual Amount")
                {
                    Caption = 'Month Accrual Amount';
                }
                field(dailyAccrualAmount; Rec."Daily Accrual Amount")
                {
                    Caption = 'Daily Accrual Amount';
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                }
                field(bankBranchNo; Rec."Bank Branch No.")
                {
                    Caption = 'Bank Branch No';
                }
                field(bankAccountNo; Rec."Bank Account No.")
                {
                    Caption = 'Bank Account No';
                }
                field(iban; Rec.IBAN)
                {
                    Caption = 'IBAN';
                }
                field(swiftCode; Rec."Swift Code")
                {
                    Caption = 'Swift Code';
                }
                field(bankName; Rec."MOL Id.")
                {
                    Caption = 'Bank Name';
                }
                field(wpsAgentId; Rec."WPS Agent Id.")
                {
                    Caption = 'WPS Agent ID';
                }
            }
        }
    }
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        // EmployeeContractMgt: Codeunit "Employee Contract Management";
        Client: HttpClient;
        Content: HttpContent;
        ResponseMessage: HttpResponseMessage;
        JsonBody: Text;
        ApiUrl: Text;
        PayrolContractTable: Record "Payrol_ContractTable";
        NoSeriesMgt: Codeunit "No. Series";
        AdditionDeductionSetup: Record EmployeeContractSetup;
    begin
        // if PayrolContractTable.Get(Rec.ContractorNumber) then
        //     exit;
        // Create contract
        AdditionDeductionSetup.Get();
        PayrolContractTable.Init();
        PayrolContractTable.ContractorNumber := NoSeriesMgt.GetNextNo(AdditionDeductionSetup."Contract Nos.", 0D, true);
        PayrolContractTable.Worker := Rec."No.";
        PayrolContractTable.WorkerName := Rec."First Name" + ' ' + Rec."Last Name";
        PayrolContractTable."Contract Type" := Rec."Contract Type";
        PayrolContractTable.Effective := Rec.Effective;
        PayrolContractTable.Expiration := Rec.Expiration;
        PayrolContractTable.PayGroup := Rec.PayGroup;
        if PayrolContractTable.Insert(true) then begin
            // CRITICAL: Assign the generated contract number back to the employee record
            Rec.ContractorNumber := PayrolContractTable.ContractorNumber;
        end;
        exit(true);
    end;
}