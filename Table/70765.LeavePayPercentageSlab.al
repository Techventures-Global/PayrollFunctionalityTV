table 70765 "Leave Pay Percentage Slab"
{
    Caption = 'Leave Pay Percentage Slab';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Leave Type Code"; Code[20])
        {
            Caption = 'Leave Type Code';
            TableRelation = "LeaveTypeTable".Leaveid;
        }

        field(2; "From Day"; Integer)
        {
            Caption = 'From Day';
            trigger OnValidate()
            var
                LeavePaySlab: Record "Leave Pay Percentage Slab";
                PreviousSlab: Record "Leave Pay Percentage Slab";
            begin
                // Validation 1: From Day must be ≤ To Day
                if ("To Day" <> 0) and ("From Day" > "To Day") then
                    Error('From Day (%1) cannot be greater than To Day (%2).', "From Day", "To Day");

                // Validation 2: Check for overlapping ranges
                LeavePaySlab.SetRange("Leave Type Code", "Leave Type Code");
                LeavePaySlab.SetFilter("From Day", '<>%1', xRec."From Day"); // Exclude current record if modifying
                if LeavePaySlab.FindSet() then
                    repeat
                        if (LeavePaySlab."From Day" <> "From Day") or (LeavePaySlab."To Day" <> xRec."To Day") then begin
                            // Check if new range overlaps with existing range
                            if ("From Day" >= LeavePaySlab."From Day") and ("From Day" <= LeavePaySlab."To Day") then
                                Error('From Day %1 overlaps with existing range %2..%3.',
                                    "From Day", LeavePaySlab."From Day", LeavePaySlab."To Day");

                            if ("To Day" <> 0) and ("To Day" >= LeavePaySlab."From Day") and ("To Day" <= LeavePaySlab."To Day") then
                                Error('To Day %1 overlaps with existing range %2..%3.',
                                    "To Day", LeavePaySlab."From Day", LeavePaySlab."To Day");

                            // Check if new range completely encompasses existing range
                            if ("From Day" <= LeavePaySlab."From Day") and ("To Day" >= LeavePaySlab."To Day") then
                                Error('Range %1..%2 overlaps with existing range %3..%4.',
                                    "From Day", "To Day", LeavePaySlab."From Day", LeavePaySlab."To Day");
                        end;
                    until LeavePaySlab.Next() = 0;

                // Validation 3: From Day must be greater than previous To Day + 1
                PreviousSlab.SetRange("Leave Type Code", "Leave Type Code");
                PreviousSlab.SetFilter("To Day", '<%1', "From Day");
                if PreviousSlab.FindLast() then begin
                    if "From Day" <> (PreviousSlab."To Day" + 1) then
                        Error('From Day must be %1 to maintain continuous slabs. Previous slab ends at %2.',
                            PreviousSlab."To Day" + 1, PreviousSlab."To Day");
                end else begin
                    // This is the first slab, it should start from 1
                    if "From Day" <> 1 then
                        Error('The first slab must start from Day 1.');
                end;

                // Validation 4: Check if there's a next slab that needs adjustment warning
                LeavePaySlab.SetRange("Leave Type Code", "Leave Type Code");
                LeavePaySlab.SetFilter("From Day", '>%1', "From Day");
                if LeavePaySlab.FindFirst() then begin
                    if ("To Day" <> 0) and (LeavePaySlab."From Day" <> ("To Day" + 1)) then
                        Error('To Day must be %1 to maintain continuous slabs with the next slab starting at %2.',
                            LeavePaySlab."From Day" - 1, LeavePaySlab."From Day");
                end;
            end;
        }

        field(3; "To Day"; Integer)
        {
            Caption = 'To Day';
            trigger OnValidate()
            var
                LeavePaySlab: Record "Leave Pay Percentage Slab";
                NextSlab: Record "Leave Pay Percentage Slab";
            begin
                // Validation 1: From Day must be ≤ To Day
                if ("From Day" <> 0) and ("From Day" > "To Day") then
                    Error('To Day (%1) cannot be less than From Day (%2).', "To Day", "From Day");

                // Validation 2: Check for overlapping ranges
                LeavePaySlab.SetRange("Leave Type Code", "Leave Type Code");
                LeavePaySlab.SetFilter("From Day", '<>%1', "From Day"); // Exclude current record
                if LeavePaySlab.FindSet() then
                    repeat
                        // Check if new To Day overlaps with existing range
                        if ("To Day" >= LeavePaySlab."From Day") and ("To Day" <= LeavePaySlab."To Day") then
                            Error('To Day %1 overlaps with existing range %2..%3.',
                                "To Day", LeavePaySlab."From Day", LeavePaySlab."To Day");

                        // Check if new range completely encompasses existing range
                        if ("From Day" <= LeavePaySlab."From Day") and ("To Day" >= LeavePaySlab."To Day") then
                            Error('Range %1..%2 overlaps with existing range %3..%4.',
                                "From Day", "To Day", LeavePaySlab."From Day", LeavePaySlab."To Day");
                    until LeavePaySlab.Next() = 0;

                // Validation 3: Next slab must start at To Day + 1 (continuity check)
                NextSlab.SetRange("Leave Type Code", "Leave Type Code");
                NextSlab.SetFilter("From Day", '>%1', "From Day");
                if NextSlab.FindFirst() then begin
                    if NextSlab."From Day" <> ("To Day" + 1) then
                        Error('To Day must be %1 to maintain continuous slabs. Next slab starts at %2.',
                            NextSlab."From Day" - 1, NextSlab."From Day");
                end;
            end;
        }

        field(4; "Pay %"; Decimal)
        {
            Caption = 'Pay %';
            DecimalPlaces = 0 : 5;
        }
    }

    keys
    {
        key(PK; "Leave Type Code", "From Day")
        {
            Clustered = true;
        }
    }

}
