page 70781 "Pay Code Group Subform"
{
    PageType = ListPart;
    SourceTable = "Pay Code Group Line";
    Caption = 'Pay Code Group Lines';
    ApplicationArea = All;
    AutoSplitKey = true;
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Pay Code"; Rec."Pay Code")
                {
                    applicationArea = All;
                }
                field("Pay Code Description"; Rec."Pay Code Description")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Nature; Rec.Nature)
                {
                    ApplicationArea = All;
                }
                field("GL Account"; Rec."GL Account")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    var
        h: Page "Sales Order Subform";
}
