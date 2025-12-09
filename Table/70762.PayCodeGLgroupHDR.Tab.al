table 70762 "Pay Code Group HDR"
{
    Caption = 'Pay Code Group HDR';

    fields
    {
        field(1; "Pay Code Group Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }

        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(PK; "Pay Code Group Code")
        {
            Clustered = true;
        }
    }
    trigger OnDelete()
    var
        PCG: Record "Pay Code Group Line";
    begin
        PCG.SetRange("Pay Code Group Code", "Pay Code Group Code");
        if PCG.FindSet() then
            PCG.DeleteAll();
    end;
}
