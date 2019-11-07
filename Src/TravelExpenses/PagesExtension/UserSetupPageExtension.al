pageextension 50100 "User Setup" extends "User Setup"
{
    layout
    {
        addlast(Control1)
        {
            field("Travel Order Approver"; "Travel Order Approver")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}