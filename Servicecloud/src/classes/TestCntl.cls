public class TestCntl {
    public id AccountId{get;set;}
    public TestCntl(){
    	AccountId = Apexpages.currentPage().getParameters().get('Id');  
        system.debug(AccountId + '1234');
        /*testingcntrl tara = new testingcntrl();
            tara.testingcntrls(AccountId);*/
         
    }
}