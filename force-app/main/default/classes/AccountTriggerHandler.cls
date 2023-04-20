public class AccountTriggerHandler {
    public static void updateAccount(List<Account> accList, Map<Id, Account> accOldMap){
        List<account> accToBeUpdated = new LIst<Account>();
        
        for(Account acc : accList){
            Account a = new Account();
            a.id = acc.Id;
            a.Description = 'Test Recursion';
            
            accToBeUpdated.add(a);
        }
        if(!accToBeUpdated.isEmpty()){
            update accToBeUpdated;
        }
    }
    public static void preventDeletion(List<Account> accList){
        system.debug('inside preventDeletion');
        for(Account acc : accList){
            if(acc.Active__c == 'Yes'){
                acc.addError(Label.Prevent_Account_Deletion);   
            }
        }
    }
    public static void updateDesc(List<Account> accList){
                    for(Account acc : accList){
                acc.Description = 'Account is Created message from Trigger';
            }
    }
    public Static void populateRating(List<Account> accList){
        for(Account acc : accList){
            if(acc.Industry  != null && acc.Industry == 'Media'){
                acc.Rating = 'Hot';
            }
        }
    }
    public static void createOpp(List<Account> accList){
        List<Opportunity> oppList = new List<Opportunity>();
        for(Account acc : accList){
            Opportunity opp = new Opportunity();
            opp.Name = acc.Name;
            opp.closeDate = system.today();
            opp.StageName = 'Prospecting';
            opp.AccountId = acc.Id;
            oppList.add(opp);
        }
        System.debug('oppList' + oppList);
        if(oppList.isEmpty()){
            insert oppList;
        }
    }
    
    public Static void updatePhone(List<Account> accList, Map<id, Account> accOldMap){
        system.debug('updatePhone after Triggered');
        /*for(Account acc : accList){
            if(acc.Phone != accOldMap.get(acc.Id).Phone){
                acc.Description = 'phone is updated' + accOldMap.get(acc.Id).Phone + 'New Value =' + acc.Phone;            }
        }*/
    }
    public Static void updateRelatedContact(List<Account> accList, Map<id, Account> accOldMap){
        system.debug('updateRelatedContact Triggered');
        /*List<Contact> conList = new List<Contact>();
        Map<Id, Account> accMap = new Map<Id,Account>();
        
        for(Account acc : accList){
            if(acc.Phone != accoldMap.get(acc.Id).Phone){
                accMap.put(acc.Id, acc);
            }
        }
        system.debug('accMap' + accMap);
        for(Contact con : [SELECT Id,HomePhone,AccountId FROM Contact
                           WHERE AccountId IN: accMap.keySet()]){
                               system.debug('contact con' + con);
                               if(accMap.containsKey(con.AccountId)){
                                   con.HomePhone = accMap.get(con.Account.Id).phone;
                                   conList.add(con);
                                   system.debug(conList);
                               }
                           }
        if(!conList.isEmpty()){
            update conList;
        }*/
    }
}