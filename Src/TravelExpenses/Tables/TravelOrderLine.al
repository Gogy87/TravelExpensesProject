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

        field(3; "Cost Type"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Cost Type';
            TableRelation = "Travel Cost".Code;
            ValidateTableRelation = true;

            trigger OnValidate()
            var
                TravelCost: Record "Travel Cost";
            begin
                IF TravelCost.GET("Cost Type") THEN begin
                    "Cost Description" := TravelCost.Description;
                    "Unit Cost" := TravelCost."Unit Cost";
                END ELSE begin
                    "Cost Description" := '';
                    "Unit Cost" := 0;
                END;
            end;
        }

        field(4; "Cost Description"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Cost Description';
        }

        field(5; "Transportation Type"; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'Transportation Type';
            OptionMembers = "Own Car","Company Car",Taxi,Train,Plane,Ship,Spaceship;
            OptionCaption = 'Own Car,Taxi,Train,Plane,Ship,Spaceship';
        }
        field(6; Quantity; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quantity';
        }

        field(7; "Unit Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Unit Cost';
        }

        field(8; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Starting Time';
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