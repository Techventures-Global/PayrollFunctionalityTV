page 71001 "Leave Pay Percentage Slab Sub"
{
    Caption = 'Pay Percentage Slabs';
    PageType = ListPart;
    SourceTable = "Leave Pay Percentage Slab";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("From Day"; Rec."From Day")
                {
                    ApplicationArea = All;
                }
                field("To Day"; Rec."To Day")
                {
                    ApplicationArea = All;
                }
                field("Pay %"; Rec."Pay %")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    // trigger OnOpenPage()
    // begin
    //     CurrPage.SetSelectionFilter(Rec);
    // end;
}
