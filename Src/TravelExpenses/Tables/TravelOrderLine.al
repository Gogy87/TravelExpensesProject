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

        field(4; "Cost Description"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Cost Description';
        }

        field(5; "Transportation Type"; enum "Transportation Type Enum")
        {
            DataClassification = ToBeClassified;
            Caption = 'Transportation Type';
        }
        field(6; Quantity; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quantity';

            trigger OnValidate()
            begin
                Amount := Quantity * "Unit Cost";
            end;
        }

        field(7; "Unit Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Unit Cost';

            trigger OnValidate()
            begin
                Amount := Quantity * "Unit Cost";
            end;
        }

        field(8; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Amount';
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
    var
        TravOrderLine: Record "Travel Order Line";
    begin
        TravOrderLine.Reset();
        TravOrderLine.SetRange("Document No.", "Document No.");
        IF TravOrderLine.FindLast() then
            "Line No." := TravOrderLine."Line No." + 10000
        Else
            "Line No." := 10000;
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