trigger Accounttrigger on Account (after update) {
    set<id> accountid = new set<Id>();
    map<id,Account> mapIdToAccount= new map<id,Account>();
    List<Contact> lstcontact = new List<Contact>();
    for(Account acc:trigger.new) {
        
        Account ac = trigger.oldmap.get(acc.id);
        if(acc.name != ac.name) {
            accountid.add(acc.id);
            mapIdToAccount.put(acc.id,acc); 
        }
    }
    for(Contact con : [select Id,name from contact where Accountid IN: accountid]){
        con.Phone= mapIdToAccount.get(con.Accountid).name;
        lstcontact.add(con);
    }
    if(lstcontact.size()>0)
    update lstcontact;
}