page 50102 "travel Order Subform"
{
    PageType = ListPart;
    SourceTable = "Travel Order Line";
    Caption = 'Lines';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Cost Type"; "Cost Type")
                {
                    ApplicationArea = All;

                }

                field("Cost Description"; "Cost Description")
                {
                    ApplicationArea = All;

                }

                field("Transportation Type"; "Transportation Type")
                {
                    ApplicationArea = All;

                }

                field(Quantity; Quantity)
                {
                    ApplicationArea = All;

                }

                field("Unit Cost"; "Unit Cost")
                {
                    ApplicationArea = All;

                }

                field(Amount; Amount)
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