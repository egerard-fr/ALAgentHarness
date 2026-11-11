action(SPPDeleteSelectedOrders)
{
    ApplicationArea = All;
    Caption = 'Delete Selected Orders', Comment = 'fr-FR=Supprimer les commandes sélectionnées';
    ToolTip = 'Delete the selected sales orders and their related warehouse shipment lines.', Comment = 'fr-FR=Supprime les commandes vente sélectionnées et leurs lignes d''expédition entrepôt associées.';
    Image = Delete;
}

ConfirmDeleteQst: Label 'Delete the %1 selected sales orders?', Comment = '%1 = number of selected orders|fr-FR=Supprimer les %1 commandes vente sélectionnées ?';