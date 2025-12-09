table 70763 "Pay Code Group Line"
{
    Caption = 'Pay Code Group Line';

    fields
    {
        field(1; "Line No."; Integer)
        {
            Caption = 'Line No.';
            AutoIncrement = true;
        }

        field(2; "Pay Code Group Code"; Code[20])
        {
            Caption = 'Pay Code Group Code';
            TableRelation = "Pay Code Group HDR"."Pay Code Group Code" where("Pay Code Group Code" = field("Pay Code Group Code"));
        }

        field(3; "Pay Code"; Code[20])
        {
            Caption = 'Pay Code';
            TableRelation = "Payrol_BenefitTable".BenefitID;
            trigger OnValidate()
            var
                PayCode: Record "Payrol_BenefitTable";
            begin
                if PayCode.Get("Pay Code") then
                    "Pay Code Description" := PayCode.Description;
            end;
        }

        field(4; "Pay Code Description"; Text[100])
        {
            Caption = 'Description';
            Editable = false;
        }

        field(5; Nature; Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,Basic Salary,Allowance,Deduction,Leave Accrual,Air Ticket Accrual,Pension,Advance/Loan,Leave Encashment,';
            OptionMembers = " ",Basic_Salary,Allowance,Deduction,"Leave Accrual","Air Ticket Accrual","Pension","Advance/Loan","Leave Encashment",;
        }

        field(6; "GL Account"; Code[20])
        {
            Caption = 'GL Account';
            TableRelation = "G/L Account"."No.";
        }
    }

    keys
    {
        key(PK; "Pay Code Group Code", "Line No.")
        {
            Clustered = true;
        }
    }
}
