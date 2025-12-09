pageextension 70106 LeaveTypeCardPageExt extends LeaveTypeCard
{
    layout
    {
        addafter(Administrator)
        {
            group("Pay Percentage Slab Setup")
            {
                Caption = 'Pay Percentage Slab Setup';

                part(PaySlab; "Leave Pay Percentage Slab Sub")
                {
                    SubPageLink = "Leave Type Code" = field(Leaveid);
                    ApplicationArea = all;
                }
            }
        }

    }



    var
        myInt: Integer;
}