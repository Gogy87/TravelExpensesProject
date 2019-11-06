table 50101 "Travel Order Line"
{
    DataClassification = ToBeClassified;
    Caption = 'Travel Order Line';

    fields
    {
        field(1; "Document No."; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Document No.';
            Editable = false;
        }

        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Line No.';
            Editable = false;
        }

        field(3; "Transportation Type"; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'Transportation Type';
            OptionMembers = "Own Car","Company Car",Taxi,Train,Plane,Ship,Spaceship;
            OptionCaption = 'Own Car,Taxi,Train,Plane,Ship,Spaceship';
        }

        field(4; "Starting Location"; text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Starting Location';
            TableRelation = "Post Code".City;
            ValidateTableRelation = true;
        }

        field(5; "Ending Location"; text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Ending Location';
            TableRelation = "Post Code".City;
            ValidateTableRelation = true;
        }

        field(6; "Trip Duration (hours)"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Trip Duration (hours)';

            trigger OnValidate()
            begin
                IF "Starting Date" <> 0D then begin
                    IF "Starting Time" <> 0T then
                        "Ending Time" := "Starting Time" + "Trip Duration (hours)"
                    else
                        ERROR('You must specify "Starting Time"');
                end else
                    ERROR('You must specify "Starting Date');
            end;
        }

        field(7; "Starting Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Starting Date';
        }

        field(8; "Starting Time"; Time)
        {
            DataClassification = ToBeClassified;
            Caption = 'Starting Time';
        }

        field(9; "Ending Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Ending Date';
            Editable = false;
        }

        field(10; "Ending Time"; Time)
        {
            DataClassification = ToBeClassified;
            Caption = 'EndingTime';
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}