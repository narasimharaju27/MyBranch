public with sharing class MyCustomLookupController {
  public string textstr{get;set;}
  public string strCountry{get;set;}
  public List<Contact> lstSearchCountry {get;set;}

  public MyCustomLookupController() {
      //mapCountry = new Map<Id, Contact>([select Id, Name from Contact limit 10000]);  
  }
   public pagereference onChangeCountryBox()
    {
        String strQuery;
        lstSearchCountry = new List<Contact>();
        if(strCountry == '')
        {
            lstSearchCountry = new List<Contact>();
        }   
        else if(strCountry != '' && strCountry != null)
        {
            strQuery = strCountry + '%';            
            lstSearchCountry = [Select Id, Name, AccountId from Contact where Name like :strQuery LIMIT 50000];
        }             
        return null;
    }

}