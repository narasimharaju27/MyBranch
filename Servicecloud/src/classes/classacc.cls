public class classacc
{
    public string urlid{get;set;}
    public Contact contact{get;set;}
    public classacc()
    {
        urlid = apexpages.currentpage().getparameters().get('id');
        system.Debug('+++++++++++++++++' + urlid);
        contact = [select id,name, email from contact where accountid =: urlid];
        system.Debug('...........................' + contact );
    }
    
}