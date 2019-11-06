page 50101 "Travel Order Card"
{
    PageType = Card;
    SourceTable = "Travel Order Header";
    Caption = 'Travel Order';

    layout
    {
        area(Content)
        {
            Group(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;

                }


                field("Employee No."; "Employee No.")
                {
                    ApplicationArea = All;

                }


                field("Employee Name"; "Employee Name")
                {
                    ApplicationArea = All;

                }


                field("Travel Start Date"; "Travel Start Date")
                {
                    ApplicationArea = All;

                }


                field("Travel Start Time"; "Travel Start Time")
                {
                    ApplicationArea = All;

                }

                field("Travel End Date"; "Travel End Date")
                {
                    ApplicationArea = All;

                }


                field("Travel End Time"; "Travel End Time")
                {
                    ApplicationArea = All;

                }

                field(Status; Status)
                {
                    ApplicationArea = All;

                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}