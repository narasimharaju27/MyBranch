public class Attachmentclass {
public Attachmentclass(ApexPages.StandardController controller){}
    public pagereference pageload(){
        system.debug(ApexPages.currentPage().getParameters().get('lkid')+'Test123');
        system.debug(ApexPages.currentPage().getParameters().get('retURL')+'Test1234');
        system.debug(ApexPages.currentPage().getParameters().get('retURL').substring(1,16) + 'Test123456');
        
        string accountid = ApexPages.currentPage().getParameters().get('retURL').substring(1,16);
        Attachment__c act = new Attachment__c();
        act.account__c = accountid;
        insert act;
        pagereference pg = new pagereference('/p/attach/NoteAttach?pid='+act.id+'&retURL='+accountid);
        
        return pg;
    }
}