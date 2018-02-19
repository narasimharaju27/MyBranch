trigger Attendeetriggercount on Account(after update) {
    set<Id> setAccountId = new set<Id>();
    List<Account> lstAccounttoUpdate = new List<Account>(); 
    for (AggregateResult ar : [Select Count(Id) numRecs, AccountId acctId From Contact Where AccountId In :Trigger.New Group By AccountId]) {
    Id acctId = (Id) ar.get('acctId');
    Account acct = Trigger.newMap.get(acctId);
    acct.NumberofLocations__c = (Decimal) ar.get('numRecs');
    lstAccounttoUpdate.add(acct);
   }
        
    
    update lstAccounttoUpdate;

}