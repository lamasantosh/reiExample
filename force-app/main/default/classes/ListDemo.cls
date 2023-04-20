public class ListDemo {
    public static void apexScenario1(){
        List<Account> acclist = new List<Account>();
        acclist = [SELECT Id, Name, (SELECT Id FROM Contacts)
                  FROM Account WHERE Phone != null];
        
        if(!acclist.isEmpty()){
            for(Account acc : acclist){
                system.debug(acc.Name + 'has' + acc.Contacts.size() + 'Contacts related');
            }
        }
    } 
    public static void apexScenario2(){
        List<Account> acclist = new List<Account>();
        acclist = [SELECT Id,Name, (SELECT Id,Amount FROM Opportunities)
                  FROM Account WHERE Phone != null];
        system.debug('acclist' + acclist);
        Decimal total = 0;
            for(Account acc : acclist){
                for(Opportunity opp : acc.Opportunities){
                    if(opp.Amount != null){
                        total = total + opp.amount;
                    }
                }
            }
        system.debug('total amount' + total);
    }
    
    public static void apexScenario3(){
        List<Opportunity> oppList = new List<Opportunity>();
        opplist = [SELECT Id, StageName FROM Opportunity WHERE CreatedDate = THIS_YEAR];
        if(!oppList.isEmpty()){
            for(Opportunity opp : opplist){
                if(opp.StageName == 'Closed Won'){
                    opp.Description = 'Opportunity is Closed Won';
                }else if(opp.StageName == 'Opportunity is Closed'){
                    opp.Description = 'Opportunity is Open';
                }
            }
            update oppList;
        }
    }
    
    public static void apexScenario4(){
        List<Account> accList = new List<Account>();
        accList = [SELECT Id, (SELECT Id FROM Contacts)
                  FROM Account WHERE CreatedDate = THIS_YEAR];
        system.debug('accList' + accList);
        if(!accList.isEmpty()){
            for(Account acc : accList){
                acc.Total_Contact_Count__c = acc.Contacts.size();
            }
            update accList;
        }
    }
}