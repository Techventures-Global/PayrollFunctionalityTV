page 70786 "Pay Structure Group HDR API"
{
    PageType = API;
    APIPublisher = 'TechVentures';
    APIGroup = 'TechVentures';
    APIVersion = 'v2.0';
    ChangeTrackingAllowed = true;
    DelayedInsert = true;
    EntityName = 'payStructureGroupHDR';
    EntitySetName = 'payStructureGroupsHDR';
    SourceTable = PayStructureGroupTable;
    Extensible = false;
    Permissions = TableData "PayStructureGroupTable" = rimd;
    ODataKeyFields = SystemId;
    //https://api.businesscentral.dynamics.com/v2.0/f989f3c9-8f4d-4100-be9a-70fb26c62037/Sanbox/api/TechVentures/TechVentures/v2.0/companies(4766ae6f-521b-f011-9af7-00224869b2e2)/payStructureGroupsHDR?$expand=payStructureLines
    layout
    {
        area(Content)
        {
            repeater(A)
            {
                field(SystemId; Rec.SystemId)
                {
                    ApplicationArea = All;
                }
                field(payStrucCode; Rec.PayStrucCode)
                {
                    Caption = 'Pay Structure Code';
                }
                field(empId; Rec.EmpId)
                {
                    Caption = 'Employee ID';
                }
                field(empName; Rec.EmpName)
                {
                    Caption = 'Employee Name';
                }
                field(contractNum; Rec.ContractNum)
                {
                    Caption = 'Contract Number';
                }
                field(payGrpCode; Rec.PayGrpCode)
                {
                    Caption = 'Pay Group Code';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(effectiveDate; Rec.EffectiveDate)
                {
                    Caption = 'Effective Date';
                }
                field(expiration; Rec.Expiration)
                {
                    Caption = 'Expiration Date';
                }
                field(noSeries; Rec."No. Series")
                {
                    Caption = 'No. Series';
                }
                field(active; Rec.Active)
                {
                    Caption = 'Active';
                }
                field(ticketType; Rec."Ticket Type")
                {
                    Caption = 'Ticket Type';
                }
                field(employeeType; Rec."Employee Type")
                {
                    Caption = 'Employee Type';
                }
                field(position; Rec.Position)
                {
                    Caption = 'Position';
                }
                field(department; Rec.Department)
                {
                    Caption = 'Department';
                }
                field(grade; Rec.Grade)
                {
                    Caption = 'Grade';
                }
                field(lineManager; Rec."Line Manager")
                {
                    Caption = 'Line Manager';
                }
                field(finalApproval; Rec."Final Approval")
                {
                    Caption = 'Final Approver';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                }

                part(PayGroupLine1; "Pay Structure Line API")
                {
                    ApplicationArea = All;
                    Caption = 'PayGroupLine1', Locked = true;
                    EntityName = 'payStructureLine';
                    EntitySetName = 'payStructureLines';
                    SubPageLink = PayStrucCode = field(PayStrucCode), ContractNum = field(ContractNum), Empid = field(EmpId), PayGroupCode = FIELD(PayGrpCode);
                    Multiplicity = Many;
                }
            }
        }
    }
    // trigger OnNewRecord(BelowxRec: Boolean)
    // var
    //     AdditionDeductionSetup: Record 70243;
    //     NoSeriesMgt: Codeunit "No. Series";
    // begin
    //     if Rec.PayStrucCode = '' then begin
    //         if AdditionDeductionSetup.Get() then
    //             Rec.PayStrucCode := NoSeriesMgt.GetNextNo(AdditionDeductionSetup.DocStrCode, 0D, true);
    //     end;
    // end;
}