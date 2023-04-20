public class OpportunityTriggerHandler {
    public static void updateDesc(List<Opportunity> oppList, Map<Id, Opportunity> oldMap){
        List<Opportunity> oppListToBeUpdate = new List<Opportunity>();
        for(Opportunity opp : oppList){
            Opportunity opp2 = new Opportunity();
            opp2.Id = opp.Id;
            if(opp.StageName != oldMap.get(opp.Id).StageName){
                if(opp.StageName == 'Close Won'){
                    opp2.Description = 'Opportunity is Close Won';
                }else if(opp.StageName == 'Close Lost'){
                    opp2.Description = 'Opportunity is Close Lost';
                }
            }
            oppListToBeUpdate.add(opp2);
        }
        if(!oppListToBeUpdate.isEmpty()){
            update oppListToBeUpdate;
        }
    }
}