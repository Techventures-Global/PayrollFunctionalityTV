table 70764 "PostedPayCycleUserNotify"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "User Name"; Code[100])
        {
            TableRelation = User."User Security ID";

            trigger OnLookup()
            var
                USER: Record User;
                USERP: Page Users;
            begin
                USER.Reset();
                CLEAR(USERP);
                USERP.SETRECORD(USER);
                USERP.SETTABLEVIEW(USER);
                USERP.LOOKUPMODE(TRUE);
                IF USERP.RUNMODAL = ACTION::LookupOK THEN BEGIN
                    USERP.GETRECORD(USER);
                    "User Name" := USER."User Name";
                end;
            end;
        }
    }
    keys
    {
        key(Key1; "User Name")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        // Add changes to field groups here
    }
    var
        myInt: Integer;

    trigger OnInsert()
    begin
    end;

    trigger OnModify()
    begin
    end;

    trigger OnDelete()
    begin
    end;

    trigger OnRename()
    begin
    end;
}
