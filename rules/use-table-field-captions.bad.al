tableextension 50101 "DIR Item" extends Item
{
    modify("Unit Cost")
    {
        trigger OnAfterValidate()
        var
            UnitCostMsg: Label 'Unit Cost must be more than 10.', Comment = 'fr-FR=Coût unitaire doit être supérieur à 10.';
            TableUpdatedMsg: Label 'Item was updated.', Comment = 'fr-FR=Article a été mis à jour.';
        begin
            Message(UnitCostMsg);
            Message(TableUpdatedMsg);
        end;
    }
}