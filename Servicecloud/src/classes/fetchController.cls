public class fetchController
{    
    public Id revReqID {get;set;}
    public List<Contact> lstCon{get;set;}
    public List<Contact> lstConOrp{get;set;}
    public Set<Id> removeAccountId;
    public Set<Id> addAccountId;
    public List<Contact> contact;
    public List<Contact> updateCont = new List<Contact>();
    public Account account{get;set;}
    
    public fetchController(){
        revReqID = '0012800000lIdu3';
        lstCon= new List<Contact>();
        lstCon= [select id,Name,Email from Contact where AccountId =: revReqID ];
        lstConOrp= new List<Contact>();
        lstConOrp= [select id,Name,Email from Contact where AccountId =: null ];
        account = [select id,Name from Account where id = :revReqID ];
    }
    public void assignAccountId(){
        Set<Id> addAccountId = ( Set<Id> )JSON.deserialize( Apexpages.currentPage().getParameters().get('addAccount'), Set<Id>.class ) ;
        
        for(Contact addCon : [select id,name,AccountId from contact where Id In: addAccountId]){
         if(addCon.AccountId == null){
             addCon.AccountId = revReqID;
             updateCont.add(addCon);
         }
        }
        if(updateCont != null)
        update updateCont;
        
        
    }
    public void removeAccountId(){
        Set<Id> removeAccountId = ( Set<Id> )JSON.deserialize( Apexpages.currentPage().getParameters().get('removeAccount'), Set<Id>.class ) ;
        
        for(Contact remCon : [select id,name,AccountId from contact where Id In: removeAccountId]){
         if(remCon.AccountId != null){
             remCon.AccountId = null;
             updateCont.add(remCon);
         }
        }
        if(updateCont != null)
        update updateCont;
        
    }
}