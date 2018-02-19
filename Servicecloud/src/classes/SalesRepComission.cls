public class SalesRepComission {
    public List<user> lstusers{get;set;}
    public SalesRepComission(){
        list<string> lststrprofilesa = system.label.lststrprofiles.split(';');
        list<profile> lstprofile = [select id from profile where name IN : lststrprofilesa];
        lstusers = [select id,name,Percent_per_month__c,Percent_per_year__c,No_of_Years__c,No_of_Months__c from User where profileId IN : lstprofile];  
    }
    public pagereference ListUsers() {
        system.debug(lstusers+'this is the list of users');   
        try{
        update lstusers;  
            apexpages.Message msg = new Apexpages.Message(ApexPages.Severity.Confirm,'Update Success!');
            apexpages.addmessage(msg);
        }
        catch(exception e){
           apexpages.Message msg = new Apexpages.Message(ApexPages.Severity.Error,'Opps!: '+e.getMessage()); 
           apexpages.addmessage(msg);
        }
        
        return null;
    } 
}