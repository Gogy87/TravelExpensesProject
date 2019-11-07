page 50103 "Travel Order Setup"
{
    PageType = Card;
    SourceTable = "Travel Order Setup";
    Caption = 'Travel Order Setup';
    ApplicationArea = All;
    DeleteAllowed = false;
    InsertAllowed = false;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            Group(General)
            {
                field("Travel Order No. Series"; "Travel Order No. Series")
                {
                    ApplicationArea = All;
                }

                field("Posted Travel Order No. Series"; "Posted Travel Order No. Series")
                {
                    ApplicationArea = All;
                }
            }

            Group(Posting)
            {

                field("Travel Order G/LAccount"; "Travel Order G/LAccount")
                {
                    ApplicationArea = All;
                }

                field("Allow Posting From"; "Allow Posting From")
                {
                    ApplicationArea = All;
                }

                field("Allow Posting To"; "Allow Posting To")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Reset;
        if not Get then begin
            Init;
            Insert;
        end;
    end;

}