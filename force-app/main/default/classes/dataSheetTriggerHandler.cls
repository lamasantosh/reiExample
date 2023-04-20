public class dataSheetTriggerHandler {
    public static void populateData(List<datasheet__c> posList){
        for(datasheet__c ds : posList){
            if(ds.property__c == 'oneCheck'){
                ds.Namae__c = 'datasheet from Trigger';
        }
        
    }
    }
}