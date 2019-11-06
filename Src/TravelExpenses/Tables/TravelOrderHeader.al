table 50100 "Travel Order Header"
{
    DataClassification = ToBeClassified;
    Caption = 'Travel Order Header';

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
            Editable = false;
        }

        field(2; "Employee No."; Code[20])
        {
            DataClassification = EndUserIdentifiableInformation;
            Caption = 'Employee No.';
            TableRelation = Employee."No.";

            trigger OnValidate()
            var
                Employee: Record Employee;
            begin
                IF Employee.Get("Employee No.") then
                    "Employee Name" := Employee."First Name" + ' ' + Employee."Last Name"
                else
                    "Employee Name" := '';
            end;
        }

        field(3; "Employee Name"; Text[100])
        {
            DataClassification = EndUserIdentifiableInformation;
            Caption = 'Employee Name';
        }

        field(4; "Travel Start Date"; Date)
        {
            DataClassification = EndUserIdentifiableInformation;
            Caption = 'Travel Start Date';
        }

        field(5; "Travel Start Time"; Time)
        {
            DataClassification = EndUserIdentifiableInformation;
            Caption = 'Travel Start Time';
        }

        field(6; "Travel End Date"; Date)
        {
            DataClassification = EndUserIdentifiableInformation;
            Caption = 'Travel End Date';
        }

        field(7; "Travel End Time"; Time)
        {
            DataClassification = EndUserIdentifiableInformation;
            Caption = 'Travel End Time';
        }

        field(8; "Status"; Option)
        {
            DataClassification = EndUserIdentifiableInformation;
            OptionMembers = "In Progress","Released","Approved","Rejected";
            OptionCaption = 'In Progress, Released, Approved, Rejected';
            Caption = 'Status';
            Editable = false;
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    var
        NoSeriesMgmt: Codeunit NoSeriesManagement;
    begin
        "No." := NoSeriesMgmt.GetNextNo('TRAVEL', Today, true);
        Status := Status::"In Progress";
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    var
        TravelOrderLine: Record "Travel Order Line";
    begin
        TravelOrderLine.Reset();
        TravelOrderLine.SetRange("Document No.", "No.");
        IF TravelOrderLine.FINDSET then
            TravelOrderLine.DeleteAll();
    end;

    trigger OnRename()
    begin

    end;

}