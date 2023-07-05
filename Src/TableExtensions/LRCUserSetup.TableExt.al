/// <summary>
/// TableExtension LRC User Setup (ID 50100) extends Record MyTargetTable.
/// </summary>
tableextension 50100 "LRC User Setup" extends "User Setup"
{
    fields
    {
        field(50100; "LRC Teams Webhook Link"; Text[250])
        {
            Caption = 'Teams Webhook Link';
            DataClassification = SystemMetadata;
        }
    }
}