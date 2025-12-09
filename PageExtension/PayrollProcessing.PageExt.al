pageextension 70103 payrollProcesingPage extends Payrol_PayCycleProcessHDR
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        modify(Post)
        {
            trigger OnAfterAction()
            var
                myInt: Integer;
            begin
                //SendPostedPayCycleEmail(Rec);
                CalculateLeaveSalary(Rec);
            end;
        }
    }
    // procedure CalculateLeaveSalary(PayCycleHdrTab: Record Payroll_PayCycleHDRTable)
    // var
    //     Payroll_PayCycleLINETable: Record Payroll_PayCycleLINETable;
    //     ContractLineTable: Record ContractLineTable;
    //     AmountToPay: Decimal;
    //     TechPayPeriod: Record "Tech Pay Period";
    //     TotalNoofDays: Integer;
    //     PerdayAmount: Decimal;
    //     PostedLeaveTable: Record EmployeeLeaveTable;
    // begin
    //     AmountToPay := 0;
    //     PerdayAmount := 0;
    //     TotalNoofDays := 0;
    //     TechPayPeriod.Reset();
    //     TechPayPeriod.SetRange(Monthname, PayCycleHdrTab.Period);
    //     if TechPayPeriod.FindFirst() then;
    //     TotalNoofDays := GetDaysInMonth(TechPayPeriod."Starting Date");
    //     Payroll_PayCycleLINETable.Reset();
    //     Payroll_PayCycleLINETable.SetRange(Payroll_ID, PayCycleHdrTab.PayCycle);
    //     if Payroll_PayCycleLINETable.FindFirst() then;
    //     ContractLineTable.Reset();
    //     ContractLineTable.SetRange(ContractorNumber, Payroll_PayCycleLINETable.ContractorNumber);
    //     ContractLineTable.SetRange("Un-Paid Leave Deduction", false);
    //     if ContractLineTable.FindFirst() then
    //         repeat
    //             AmountToPay += ContractLineTable.Itemid;
    //         until Payroll_PayCycleLINETable.Next() = 0;
    //     PerdayAmount := AmountToPay / TotalNoofDays;

    // end;
    procedure CalculateLeaveSalary(PayCycleHdrTab: Record Payroll_PayCycleHDRTable)
    var
        Payroll_PayCycleLINETable: Record Payroll_PayCycleLINETable;
        ContractLineTable: Record ContractLineTable;
        TechPayPeriod: Record "Tech Pay Period";
        PostedLeaveTable: Record EmployeeLeaveTable;
        AmountToPay, PerdayAmount, TotalSalaryForMonth, DailySalary : Decimal;
        TotalNoofDays: Integer;
        LeaveStartDate, LeaveEndDate, CurrDate : Date;
        LeaveAppliedDay, DaysBeforeCurrentMonth, PayPercentage : Integer;
        EmployeeNo: Code[20];
    begin
        // Get payroll month
        TechPayPeriod.Reset();
        TechPayPeriod.SetRange(Monthname, PayCycleHdrTab.Period);
        TechPayPeriod.FindFirst();

        // Monthly working days
        TotalNoofDays := GetDaysInMonth(TechPayPeriod."Starting Date");

        // Get employee salary from your ContractLineTable
        AmountToPay := 0;
        Payroll_PayCycleLINETable.SetRange(Payroll_ID, PayCycleHdrTab.PayCycle);
        if Payroll_PayCycleLINETable.FindSet() then
            repeat
                ContractLineTable.Reset();
                ContractLineTable.SetRange(ContractorNumber, Payroll_PayCycleLINETable.ContractorNumber);
                if ContractLineTable.FindFirst() then
                    AmountToPay += ContractLineTable.Itemid;
            until Payroll_PayCycleLINETable.Next() = 0;

        // Per-day salary for this month
        PerdayAmount := AmountToPay / TotalNoofDays;

        // --- FIND IF LEAVE AFFECTS THIS MONTH ---
        EmployeeNo := PayCycleHdrTab.Employee;

        PostedLeaveTable.Reset();
        PostedLeaveTable.SetRange(Employeeid, EmployeeNo);
        PostedLeaveTable.SetFilter(Leavefrom, '<=%1', TechPayPeriod."Ending Date");
        PostedLeaveTable.SetFilter(LeaveTo, '>=%1', TechPayPeriod."Starting Date");

        TotalSalaryForMonth := 0;

        if PostedLeaveTable.FindFirst() then begin

            LeaveStartDate := PostedLeaveTable."Leavefrom";
            LeaveEndDate := PostedLeaveTable."LeaveTo";

            // Days consumed before this payroll month
            DaysBeforeCurrentMonth := TechPayPeriod."Starting Date" - LeaveStartDate;

            CurrDate := TechPayPeriod."Starting Date";

            // Loop through entire payroll month
            while CurrDate <= TechPayPeriod."Ending Date" do begin

                if (CurrDate >= LeaveStartDate) and (CurrDate <= LeaveEndDate) then begin
                    // This is a leave day
                    LeaveAppliedDay := DaysBeforeCurrentMonth + (CurrDate - TechPayPeriod."Starting Date") + 1;

                    PayPercentage := GetPayPercentage(PostedLeaveTable."LeaveType", LeaveAppliedDay);
                    DailySalary := PerdayAmount * (PayPercentage / 100);

                end else begin
                    // Worked day → full pay
                    DailySalary := PerdayAmount;
                end;

                TotalSalaryForMonth += DailySalary;

                CurrDate := CurrDate + 1;
            end;

        end else begin
            // No leave in month → full salary
            TotalSalaryForMonth := AmountToPay;
        end;

        // You can now store TotalSalaryForMonth back in your payroll line

    end;


    procedure GetPayPercentage(LeaveTypeCode: Code[20]; DayApplied: Integer): Decimal
    var
        Slab: Record "Leave Pay Percentage Slab";
    begin
        // Find slab where DayApplied falls between From Day and To Day
        Slab.Reset();
        Slab.SetRange("Leave Type Code", LeaveTypeCode);
        if Slab.FindSet() then
            repeat
                if (DayApplied >= Slab."From Day") and (DayApplied <= Slab."To Day") then
                    exit(Slab."Pay %");
            until Slab.Next() = 0;

        // If no slab found → default = 0%
        exit(0);
    end;

    procedure GetDaysInMonth(InputDate: Date): Integer
    var
        MonthNo: Integer;
        YearNo: Integer;
        StartDate: Date;
        EndDate: Date;
    begin
        if InputDate = 0D then
            exit(0);

        // Extract month and year
        MonthNo := Date2DMY(InputDate, 2);
        YearNo := Date2DMY(InputDate, 3);

        // First day of the month
        StartDate := DMY2Date(1, MonthNo, YearNo);

        // Last day of the month = (first day of next month - 1)
        EndDate := CalcDate('<1M>', StartDate) - 1;

        exit(EndDate - StartDate + 1);
    end;

    local procedure SendPostedPayCycleEmail(PayCycle: Record Payroll_PayCycleHDRTable)
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
            PayCycle.PayCycle,
            Format(CurrentDateTime()));

        EmailMessage.Create(
            Recipients,
            StrSubstNo('Pay Cycle %1 Posted', PayCycle.PayCycle),
            BodyText,
            false);

        Email.Send(EmailMessage, Enum::"Email Scenario"::"Pay Cycle Posting");
    end;

    var
        myInt: Integer;
}