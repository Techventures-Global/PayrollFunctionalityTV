page 70782 "Pay Code Group List"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "Pay Code Group HDR";
    UsageCategory = Lists;
    CardPageId = "Pay Code Group Card";
    Editable = false;
    layout
    {
        area(Content)
        {
            repeater(Group)
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
        }
    }
    actions
    {
        area(Processing)
        {
            action("Delete All Lines")
            {
                Caption = 'Delete All Lines';
                ApplicationArea = All;
                Image = Delete;
                trigger OnAction()
                var
                    PayCodeGroupLine: Record "Pay Code Group Line";
                begin
                    SendPostedPayCycleEmail(Rec);
                end;
            }
        }
    }
    local procedure SendPostedPayCycleEmail(PayCycle: Record "Pay Code Group HDR")
    var
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;
        Recipients: List of [Text];
        BodyText: Text;
        PostedPayCycleUserNotify: Record PostedPayCycleUserNotify;
        User: Record User;
    begin
        PostedPayCycleUserNotify.Reset();
        if PostedPayCycleUserNotify.FindSet() then
            repeat
                User.Reset();
                User.SetRange("User Name", PostedPayCycleUserNotify."User Name");
                if User.FindFirst() then
                    Recipients.Add(User."Authentication Email");
            until PostedPayCycleUserNotify.Next() = 0;
        BodyText :=
          StrSubstNo(
            'Pay Cycle %1 has been successfully posted on %2.',
            PayCycle."Pay Code Group Code",
            Format(CurrentDateTime()));

        EmailMessage.Create(
            Recipients,
            StrSubstNo('Pay Cycle %1 Posted', PayCycle."Pay Code Group Code"),
            BodyText,
            false);

        Email.Send(EmailMessage, Enum::"Email Scenario"::"Pay Cycle Posting");
    end;
}
