public class TestRollback {
    public static savepoint sp; 
    public boolean blntextarea{get;set;} 
    public TestRollback(){
       blntextarea = false; 
       try
    {
        sp = Database.setSavepoint();
        Account ac = new Account();
        ac.Name = 'Narasimharaju Rollback' + system.now();
        insert ac;
        system.debug(ac.id+'India1123$');
        
        }
        catch(Exception e)
        {
            system.debug('ERROR :::'+ e.getMessage());
        }
    }
    
    public void CreateRecord(){
    try
    {
        sp = Database.setSavepoint();
        Account ac = new Account();
        ac.Name = 'Narasimharaju Rollback' + system.now();
        insert ac;
        system.debug(ac.id+'India1123$');
        
        }
        catch(Exception e)
        {
            system.debug('ERROR :::'+ e.getMessage());
        }
    }
    public void rollbackrecord(){
        //Database.rollback(sp);
        blntextarea = true;
    }
}