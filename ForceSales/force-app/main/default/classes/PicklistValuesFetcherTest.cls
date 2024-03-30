@isTest
private class PicklistValuesFetcherTest {
    
    @isTest
    static void testGetPicklistValues() {
        // Inicia lista 
        List<PicklistValuesFetcher.PickListData> picklistDataList = new List<PicklistValuesFetcher.PickListData>();
        
        // Añadir información de variables
        PicklistValuesFetcher.PickListData picklistData = new PicklistValuesFetcher.PickListData();
        picklistData.objectType = 'Opportunity';
        picklistData.fieldApiName = 'StageName';
        picklistDataList.add(picklistData);
        
        // Llamar al metodo de la clase PicklistValuesFetcher
        Test.startTest();
        List<List<String>> picklistValuesResult = PicklistValuesFetcher.getPicklistValues(picklistDataList);
        Test.stopTest();
        
        System.assertEquals(1, picklistValuesResult.size(), 'Se esperaba una lista de valores de picklist');
        
    }
}