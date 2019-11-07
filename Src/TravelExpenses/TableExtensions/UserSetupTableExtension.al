tableextension 50100 "User Setup Extension" extends "User Setup"
{
    fields
    {
        field(50000; "Travel Order Approver"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Travel Order Approver';
        }
    }

    var
        myInt: Integer;
}