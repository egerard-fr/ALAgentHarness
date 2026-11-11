tableextension 50101 "DIR Item" extends Item
{
    modify("Unit Cost")
    {
        trigger OnAfterValidate()
        var
            Item: Record Item;
            UnitCostMsg: Label '%1 must be more than 10.', Comment = '%1 = Unit Cost field caption|fr-FR=%1 doit être supérieur à 10.';
            TableUpdatedMsg: Label '%1 was updated.', Comment = '%1 = Item table caption|fr-FR=%1 a été mis à jour.';
        begin
            Message(UnitCostMsg, Item.FieldCaption("Unit Cost"));
            Message(TableUpdatedMsg, Item.TableCaption());
        end;
    }
}