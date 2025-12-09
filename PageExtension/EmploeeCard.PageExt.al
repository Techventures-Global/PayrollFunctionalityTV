pageextension 70104 EmployCardPage extends "Employee Card"
{
    layout
    {
        addlast(General)
        {
            field(Effective; Rec.Effective)
            {
                ApplicationArea = All;
                Caption = 'Effective';
            }
            field(Expiration; Rec.Expiration)
            {
                ApplicationArea = All;
                Caption = 'Expiration';
            }
            field("Contract Type"; Rec."Contract Type")
            {
                ApplicationArea = All;
                Caption = 'Contract Type';
            }
            field(ContractorNumber; Rec.ContractorNumber)
            {
                ApplicationArea = All;
                Caption = 'Contract Number';
            }
            field(PayGroup; Rec.PayGroup)
            {
                ApplicationArea = All;
                Caption = 'Pay Group';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: page Payrol_ContractorCard;
}