page 70787 "Pay Structure Line API"
{
    PageType = API;
    APIPublisher = 'TechVentures';
    APIGroup = 'TechVentures';
    APIVersion = 'v2.0';
    ChangeTrackingAllowed = true;
    DelayedInsert = true;
    EntityName = 'payStructureLine';
    EntitySetName = 'payStructureLines';
    SourceTable = PayStrucLIneTbl;
    Extensible = false;
    Permissions = TableData "PayStrucLIneTbl" = rimd;
    ODataKeyFields = SystemId;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
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
                field(benefitId; Rec.BenefitID)
                {
                    Caption = 'Benefit ID';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Benefit Description';
                }
                field(nature; Rec.Nature)
                {
                    Caption = 'Type';
                }
                field(descriptionAR; Rec."Description_AR")
                {
                    Caption = 'Description (AR)';
                }
                field(amountCalPerDay; Rec.AmountCalPerDay)
                {
                    Caption = 'Amount Calculate Per Day';
                }
                field(calculationCode; Rec.CalculationCode)
                {
                    Caption = 'Calculation Code';
                }
                field(lineNo; Rec.LineNo)
                {
                    Caption = 'Line No';
                }
                field(payGroupCode; Rec.PayGroupCode)
                {
                    Caption = 'Pay Group Code';
                }
                field(empId; Rec.Empid)
                {
                    Caption = 'Employee ID';
                }
                field(contractNum; Rec.ContractNum)
                {
                    Caption = 'Contract Number';
                }
                field(payStrucCode; Rec.PayStrucCode)
                {
                    Caption = 'Pay Structure Code';
                }
                field(amountInTransactionCurrency; Rec.AmountInTransactionCurrency)
                {
                    Caption = 'Amount';
                }
                field(effectiveDate; Rec.EffectiveDate)
                {
                    Caption = 'Effective Date';
                }
                field(expirationDate; Rec.ExpirationDate)
                {
                    Caption = 'Expiration Date';
                }
                field(minAmount; Rec."Min. Amount")
                {
                    Caption = 'Min. Amount';
                }
                field(maxAmount; Rec."Max. Amount")
                {
                    Caption = 'Max. Amount';
                }
                field(oldAmount; Rec."Old Amount")
                {
                    Caption = 'Old Amount';
                }
                field(employeerPension; Rec."Employeer Pension")
                {
                    Caption = 'Employer Pension';
                }
            }
        }
    }
}