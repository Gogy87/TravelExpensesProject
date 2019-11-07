table 50102 "Travel Cost"
{
    DataClassification = ToBeClassified;
    Caption = 'Travel Cost';

    fields
    {
        field(1; Code; code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code';
        }

        field(2; Description; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';
        }

        field(3; "Unit Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Unit Cost';
        }
    }

    keys
    {
        key(PK; Code)
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