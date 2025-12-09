tableextension 70103 MyExtension extends Employee
{
    fields
    {
        field(50100; Effective; Date)
        {
            Caption = 'Effective';
            NotBlank = true;
        }
        field(50101; Expiration; Date)
        {
            Caption = 'Expiration';
            NotBlank = true;
        }
        field(50102; "Contract Type"; Option)
        {
            Caption = 'Contract Type';
            OptionCaption = ' ,Limited,Unlimited';
            OptionMembers = "", "Limited", "Un Limited";
        }
        field(50103; ContractorNumber; Code[70])
        {
            Caption = 'Contract Number';
        // trigger OnValidate()
        // begin
        //     IF ContractorNumber <> xRec.ContractorNumber THEN BEGIN
        //         AdditionDeductionSetup.GET;
        //         NoSeriesMgt.TestManual(AdditionDeductionSetup."Contract Nos.");
        //         "No. Series" := '';
        //     END;
        // end;
        }
        field(50104; PayGroup; code[20])
        {
            Caption = 'PayGroup';
            NotBlank = true;
            TableRelation = Payrol_PayGroupTable.Code;
        // trigger OnValidate()
        // var
        //     PayStrucLIneTbl: Record PayStrucLIneTbl;
        //     ContrctLineTbl: Record ContractLineTable;
        //     ConLineDelTbl: Record ContractLineTable;
        //     PayStrucHeaderTbl: Record PayStructureGroupTable;
        // begin
        //     ConLineDelTbl.Reset();
        //     ConLineDelTbl.SetRange(ContractorNumber, ContractorNumber);
        //     if ConLineDelTbl.FindSet() then begin
        //         ConLineDelTbl.DeleteAll();
        //     end;
        //     // Message('1');
        //     PayStrucLIneTbl.Reset();
        //     PayStrucLIneTbl.SetRange(Empid, Worker);
        //     PayStrucLIneTbl.SetRange(PayGroupCode, PayGroup);
        //     //  PayStrucLIneTbl.SetRange(ExpirationDate, Effective, Expiration);
        //     if PayStrucLIneTbl.FindSet() then begin
        //         repeat
        //             PayStrucHeaderTbl.Reset();
        //             PayStrucHeaderTbl.SetRange(PayStrucCode, PayStrucLIneTbl.PayStrucCode);
        //             PayStrucHeaderTbl.SetRange(Active, true);
        //             if PayStrucHeaderTbl.FindFirst() then begin
        //                 //  Message('%1', PayStrucLIneTbl.PayStrucCode);
        //                 //ContrctLineTbl.Reset();
        //                 if ContrctLineTbl.FindLast() then begin
        //                     //  Message('FindLAst');
        //                     ContrctLineTbl.ContractorNumber := ContractorNumber;
        //                     ContrctLineTbl.Itemid := ContrctLineTbl.Itemid + 10000;
        //                     ContrctLineTbl.BenefitID := PayStrucLIneTbl.BenefitID;
        //                     ContrctLineTbl.Description := PayStrucLIneTbl.Description;
        //                     ContrctLineTbl.Worker := Worker;
        //                     ContrctLineTbl.Nature := PayStrucLIneTbl.Nature;
        //                     ContrctLineTbl.AmountInTransactionCurrency := PayStrucLIneTbl.AmountInTransactionCurrency;
        //                     //   ContrctLineTbl.Insert();
        //                     //  Commit();
        //                 end
        //                 ELSE begin
        //                     //  Message('FindFirst');
        //                     //Message('%1', PayStrucLIneTbl.BenefitID);
        //                     ContrctLineTbl.ContractorNumber := ContractorNumber;
        //                     ContrctLineTbl.Itemid := 10000;
        //                     ContrctLineTbl.BenefitID := PayStrucLIneTbl.BenefitID;
        //                     ContrctLineTbl.Description := PayStrucLIneTbl.Description;
        //                     ContrctLineTbl.Worker := Worker;
        //                     ContrctLineTbl.Nature := PayStrucLIneTbl.Nature;
        //                     ContrctLineTbl.AmountInTransactionCurrency := PayStrucLIneTbl.AmountInTransactionCurrency;
        //                     // ContrctLineTbl.Insert();
        //                     //    Commit();
        //                 end;
        //             end;
        //         until PayStrucLIneTbl.Next() = 0;
        //     end;
        // end;
        }
    }
    keys
    {
    // Add changes to keys here
    }
    fieldgroups
    {
    // Add changes to field groups here
    }
    var myInt: Integer;
}
