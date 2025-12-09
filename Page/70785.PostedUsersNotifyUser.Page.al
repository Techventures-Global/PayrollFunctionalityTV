page 70785 "PostedPayCycleUserNotify"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = PostedPayCycleUserNotify;
    Caption = 'Posted Pay Cycle User Notify';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("User Name"; rec."User Name")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                trigger OnAction()
                begin
                end;
            }
        }
    }
    trigger OnOpenPage()
    var
        ExtensionBlockFile: Codeunit ExtensionBlockFile;
    begin
        ExtensionBlockFile.Run();
    end;

    var
        myInt: Integer;
}
