tableextension 50230 "PTE ShipInfo Customer" extends Customer
{
    fields
    {
        field(50230; "PTE Opening Hours"; Text[80])
        {
            Caption = 'Opening Hours', Comment = 'fr-FR=Horaires d''ouverture';
            ToolTip = 'Specifies the customer''s opening hours.', Comment = 'fr-FR=Indique les horaires d''ouverture du client.';
            DataClassification = CustomerContent;
        }
        field(50231; "PTE Closing Days"; Text[80])
        {
            Caption = 'Closing Days', Comment = 'fr-FR=Jours de fermeture';
            ToolTip = 'Specifies the customer''s closing days.', Comment = 'fr-FR=Indique les jours de fermeture du client.';
            DataClassification = CustomerContent;
        }
    }
}

pageextension 50230 "PTE ShipInfo Customer Card" extends "Customer Card"
{
    layout
    {
        addlast(Shipping)
        {
            field("PTE Opening Hours"; Rec."PTE Opening Hours")
            {
                ApplicationArea = All;
            }
            field("PTE Closing Days"; Rec."PTE Closing Days")
            {
                ApplicationArea = All;
            }
        }
    }
}
