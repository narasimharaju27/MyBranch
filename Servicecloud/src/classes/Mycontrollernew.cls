public class Mycontrollernew {

    Public Account account{get;set;} 
      //this.blg = (Blog__c)controller.getRecord();

  public Datetime entrytime= null;
  public Datetime  endtime = null;
  
    public Mycontrollernew(ApexPages.StandardController controller) {
    this.account = (Account)controller.getRecord();
    
    }

     //public Account account{get;set;}
     public String act{get;set;}
     public String readonly {get;set;}
     public Mycontrollernew(){
     }
     
     public void makingfield() {
     //account = this.Acc;
     account.SLAExpirationDate__c= account.SLAExpirationDate__c;
          System.debug(account.SLAExpirationDate__c+'thsis');
      
     }
 }