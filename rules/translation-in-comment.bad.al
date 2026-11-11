action(SPPDeleteSelectedOrders)
{
    ApplicationArea = All;
    Caption = 'Delete Selected Orders';
    ToolTip = 'Delete the selected sales orders and their related warehouse shipment lines.';
    Image = Delete;
}

ConfirmDeleteQst: Label 'Delete the %1 selected sales orders?', Comment = '%1 = number of selected orders, fr-FR=Supprimer les %1 commandes vente sélectionnées ?';