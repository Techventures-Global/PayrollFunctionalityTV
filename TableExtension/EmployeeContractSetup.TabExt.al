// tableextension 70104 EmployeeContractSetupTabExt extends PayStructureGroupTable
// {
//     fields
//     {
//         field(50100; "Notifying Users"; Text[250])
//         {
//             DataClassification = ToBeClassified;
//         }
//     }

//     keys
//     {
//         // Add changes to keys here
//     }

//     fieldgroups
//     {
//         // Add changes to field groups here
//     }

//     var
//         myInt: Integer;

//     trigger OnInsert()
//     var
//         AdditionDeductionSetup: Record 70243;
//         NoSeriesMgt: Codeunit "No. Series";
//     begin
//         if PayStrucCode = '' then begin
//             AdditionDeductionSetup.Get();
//             PayStrucCode := NoSeriesMgt.GetNextNo(AdditionDeductionSetup.DocStrCode, 0D, true);
//         end;
//     end;
// }