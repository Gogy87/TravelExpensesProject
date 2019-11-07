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

        field(4; "Starting Location"; text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Starting Location';
            TableRelation = "Post Code".City;
            ValidateTableRelation = true;
        }

        field(5; "Travel Start Date"; Date)
        {
            DataClassification = EndUserIdentifiableInformation;
            Caption = 'Travel Start Date';
        }

        field(6; "Travel Start Time"; Time)
        {
            DataClassification = EndUserIdentifiableInformation;
            Caption = 'Travel Start Time';
        }

        field(7; "Ending Location"; text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Ending Location';
            TableRelation = "Post Code".City;
            ValidateTableRelation = true;
        }

        field(8; "Travel End Date"; Date)
        {
            DataClassification = EndUserIdentifiableInformation;
            Caption = 'Travel End Date';
        }

        field(9; "Travel End Time"; Time)
        {
            DataClassification = EndUserIdentifiableInformation;
            Caption = 'Travel End Time';
        }

        field(10; "Status"; Option)
        {
            DataClassification = EndUserIdentifiableInformation;
            OptionMembers = "In Progress","Released","Approved","Rejected";
            OptionCaption = 'In Progress, Released, Approved, Rejected';
            Caption = 'Status';
            Editable = false;
        }

        field(11; "Approved By"; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Approved By';
            Editable = false;
        }

        field(12; "Date Of Approval"; date)
        {
            DataClassification = CustomerContent;
            Caption = 'Date Of Approval';
            Editable = false;
        }

        field(13; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum ("Travel Order Line".Amount where("Document No." = field("No.")));
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