// codeunit 70100 "Employee Contract Management"
// {
//     procedure CallContractAPI(EmployeeRec: Record Employee)
//     var
//         Client: HttpClient;
//         Content: HttpContent;
//         ResponseMessage: HttpResponseMessage;
//         JsonBody: Text;
//         ApiUrl: Text;
//         PayrolContractTable: Record "Payrol_ContractTable";
//         NoSeriesMgt: Codeunit "No. Series";
//         AdditionDeductionSetup: Record EmployeeContractSetup;
//     begin
//         if PayrolContractTable.Get(EmployeeRec.ContractorNumber) then
//             exit;
//         // Create contract
//         PayrolContractTable.Init();
//         PayrolContractTable.ContractorNumber := NoSeriesMgt.GetNextNo(AdditionDeductionSetup."Contract Nos.", WorkDate(), true);
//         // PayrolContractTable.ContractorNumber := EmployeeRec.ContractorNumber;
//         PayrolContractTable.Worker := EmployeeRec."No.";
//         PayrolContractTable.WorkerName := EmployeeRec."First Name" + ' ' + EmployeeRec."Last Name";
//         PayrolContractTable."Contract Type" := EmployeeRec."Contract Type";
//         PayrolContractTable.Effective := EmployeeRec.Effective;
//         PayrolContractTable.Expiration := EmployeeRec.Expiration;
//         PayrolContractTable.PayGroup := EmployeeRec.PayGroup;
//         if PayrolContractTable.Insert(true) then;
//     end;

//     // ------------------------------------------------------------
//     // URL Builder
//     // ------------------------------------------------------------
//     local procedure GetContractApiUrl(): Text
//     begin
//         exit(GetUrl(ClientType::Api, CompanyName) +
//             '/TechVentures/TechVentures/v2.0/payrolContracts');
//     end;

//     // ------------------------------------------------------------
//     // HTTP Helpers
//     // ------------------------------------------------------------
//     local procedure PrepareClientHeaders(var Client: HttpClient)
//     begin
//         Client.DefaultRequestHeaders().Clear();
//         Client.DefaultRequestHeaders().Add('Accept', 'application/json');
//     end;

//     local procedure PrepareHttpContent(var Content: HttpContent; JsonText: Text)
//     var
//         Headers: HttpHeaders;
//     begin
//         Content.WriteFrom(JsonText);
//         Content.GetHeaders(Headers);
//         Headers.Clear();
//         Headers.Add('Content-Type', 'application/json');
//     end;

//     // ------------------------------------------------------------
//     // JSON Builder
//     // ------------------------------------------------------------
//     local procedure BuildContractJson(EmployeeRec: Record Employee) JsonText: Text
//     var
//         JsonObject: JsonObject;
//     begin
//         JsonObject.Add('ContractorNumber', EmployeeRec.ContractorNumber);
//         JsonObject.Add('Worker', EmployeeRec."No.");
//         JsonObject.Add('WorkerName', StrSubstNo('%1 %2', EmployeeRec."First Name", EmployeeRec."Last Name"));
//         JsonObject.Add('ContractType', Format(EmployeeRec."Contract Type"));

//         AddDate(JsonObject, 'Effective', EmployeeRec.Effective);
//         AddDate(JsonObject, 'Expiration', EmployeeRec.Expiration);

//         JsonObject.Add('PayGroup', EmployeeRec.PayGroup);

//         // CORRECT WAY: Convert JsonObject → Text
//         JsonObject.WriteTo(JsonText);
//     end;

//     // Helper: Add date only if non-zero
//     local procedure AddDate(var JsonObject: JsonObject; FieldName: Text; DateValue: Date)
//     begin
//         if DateValue <> 0D then
//             JsonObject.Add(FieldName, Format(DateValue, 0, '<Year4>-<Month,2>-<Day,2>'));
//     end;

//     // ------------------------------------------------------------
//     // Response Handler
//     // ------------------------------------------------------------
//     local procedure HandleApiResponse(ResponseMessage: HttpResponseMessage)
//     var
//         ResponseText: Text;
//     begin
//         ResponseMessage.Content().ReadAs(ResponseText);

//         if not ResponseMessage.IsSuccessStatusCode() then
//             Error(
//                 'Contract API returned an error.\Status Code: %1\Details: %2',
//                 ResponseMessage.HttpStatusCode(),
//                 ResponseText);

//         Message('Contract created successfully via Contract API.');
//     end;
// }
