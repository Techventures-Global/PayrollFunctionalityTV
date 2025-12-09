pageextension 70101 PayCodePage extends Payrol_BenefitCard
{
    layout
    {
        modify(Nature)
        {
            Visible = false;
        }
        modify(PayCodeAccount)
        {
            Visible = false;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Page "Sales Order";
}