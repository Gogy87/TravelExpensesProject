page 50100 "Travel Order List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Travel Order Header";
    CardPageId = 50101;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
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