global class testingcntrl {

    public PageReference testingcntrls() {
        return null;
    }

    public list<Contact> lstContacts{get;set;}
    public id AccountId{get;set;}
    public testingcntrl() {
        AccountId = Apexpages.currentPage().getParameters().get('Id');
        lstContacts = [select id,name from contact where AccountId= :AccountId];
    }
    
    global void testingcntrl(id accId) {
        //AccountId = '0012800000klZSk';
        system.debug(accId);
        lstContacts = [select id,name from contact where AccountId= :accId];
    }
}