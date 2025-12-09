pageextension 70105 EmployeeContracSetup extends "Employee Contract Setup"
{
    layout
    {
        addlast(content)
        {
            group(EmailNotificationSettings)
            {
                Caption = 'Email Notification Settings';
                part(Posted; PostedPayCycleUserNotify)
                {
                    ApplicationArea = all;
                }
            }
        }

    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}