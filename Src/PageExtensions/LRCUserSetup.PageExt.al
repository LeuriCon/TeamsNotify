/// <summary>
/// PageExtension LRC User Setup (ID 50100) extends Record User Setup.
/// </summary>
pageextension 50100 "LRC User Setup" extends "User Setup"
{
    layout
    {
        addlast(Control1)
        {
            field("LRC Teams Webhook Link"; Rec."LRC Teams Webhook Link")
            {
                ApplicationArea = all;
                ToolTip = 'Teams endpoint to receive the message';
            }
        }
    }
    actions
    {
        addfirst(Processing)
        {
            action(httptestteams)
            {
                ApplicationArea = All;
                Caption = 'Test Teams';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = TestFile;
                PromotedOnly = true;
                ToolTip = ' ', Locked = true;

                trigger OnAction()
                var
                    LRCTeamsNotify: Codeunit "LRC Teams Notify";
                begin
                    LRCTeamsNotify.PostSimpleMessage(Rec."LRC Teams Webhook Link", Rec."Phone No.");
                end;
            }
        }

    }
}