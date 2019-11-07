table 50103 "Travel Order Setup"
{
    Caption = 'Travel Order Setup';
    LookupPageId = "Travel Order Setup";

    fields
    {
        field(1; "Primary Key"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Primary Key';
            Editable = false;

        }

        field(2; "Travel Order No. Series"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Travel Order No. Series';
            TableRelation = "No. Series";
            ValidateTableRelation = True;

        }

        field(3; "Posted Travel Order No. Series"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Posted Travel Order No. Series';
            TableRelation = "No. Series";
            ValidateTableRelation = True;

        }

        field(4; "Travel Order G/LAccount"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Travel Order G/L Account';
            TableRelation = "G/L Account";
            ValidateTableRelation = true;

        }

        field(5; "Allow Posting From"; date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Allow Posting From';
        }

        field(6; "Allow Posting To"; date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Allow Posting To';
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

}