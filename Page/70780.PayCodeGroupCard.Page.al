page 70780 "Pay Code Group Card"
{
    PageType = Document;
    SourceTable = "Pay Code Group HDR";
    Caption = 'Pay Code Group';
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Code; Rec."Pay Code Group Code")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }

            part(Lines; "Pay Code Group Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Pay Code Group Code" = field("Pay Code Group Code");
                UpdatePropagation = Both;
            }
        }
    }
}
