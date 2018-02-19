trigger Contacttrigger on Contact (after insert) {
    set<Id> setAccountId = new set<Id>();
    List<Account> lstAccounttoUpdate = new List<Account>(); 
    
    for(Contact ct: trigger.new){
        setAccountId.add(ct.AccountId);
        
    }
    List<contact> lstct = [select id,AccountId from contact where AccountId IN : setAccountId];
    map<Id,List<contact>> mapAccountIdToContact = new map<Id,List<contact>>();
    for(contact c:lstct) {
        if(mapAccountIdToContact.containskey(c.AccountId)){
           mapAccountIdToContact.get(c.AccountId).add(c);
        } else {
           List<Contact> lstcon = new List<Contact>();
           lstcon.add(c);
           system.debug(lstcon.size() +'India123$');
           mapAccountIdToContact.put(c.AccountId,lstcon) ;
        }
    }
    List<Account> lstAccount = [select id,Number_of_childs__c from Account where Id IN:setAccountId];
        system.debug(mapAccountIdToContact.get('00128000002LGPjAAO').size()+'This is India'+mapAccountIdToContact.get('00128000002LGPjAAO'));
    for(Account ac : lstAccount) {
        
        ac.Number_of_childs__c = mapAccountIdToContact.get(ac.id).size();
        lstAccounttoUpdate.add(ac);
    }
    update lstAccounttoUpdate;
    
    
    

}