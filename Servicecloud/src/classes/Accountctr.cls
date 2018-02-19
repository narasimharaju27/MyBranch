public class Accountctr {
    public list<Contact> lstContact{get;set;}
    public Accountctr() {
        lstContact = [select id, name from contact];
    }
}