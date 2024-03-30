public class PicklistValuesFetcher {
    public class PickListData {
        @InvocableVariable
        public String objectType;

        @InvocableVariable
        public String fieldApiName;
    }

    @InvocableMethod(label='Get PickList Values1' description='Obtiene los valores activos de un Picklist' category='Utilities')
    public static List<List<String>> getPicklistValues(List<PickListData> pickListData) {
        List<List<String>> result = new List<List<String>>();

        for (PickListData pld : pickListData) {
            String objectApiName = pld.objectType;
            String fieldApiName = pld.fieldApiName;
            List<String> picklistValues = new List<String>();
            
            // Obtener los metadatos del campo picklist
            Schema.DescribeFieldResult fieldResult =
                Schema.getGlobalDescribe().get(objectApiName).getDescribe().fields.getMap().get(fieldApiName).getDescribe();
            
            // Iterar a través de los valores del picklist y agregarlos a la lista
            for (Schema.PicklistEntry entry : fieldResult.getPicklistValues()) {
                picklistValues.add(entry.getValue()); // Usa getLabel() o getValue() según lo que necesites
            }
            
            result.add(picklistValues);
        }

        return result;
    }
}