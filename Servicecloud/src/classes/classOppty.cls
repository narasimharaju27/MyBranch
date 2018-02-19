public class classOppty{
    public string urlid{get;set;}
    public List<Opportunity> lstcontacts{get;set;}
    public classOppty(){
        urlid = apexpages.currentpage().getparameters().get('id');
        lstcontacts = [select id,name from Opportunity where accountid =: urlid];
    }
    
}