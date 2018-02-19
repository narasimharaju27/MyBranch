public Class parentCtrl
{
    public PageReference pr{get;set;}
    public parentCtrl()
    {
        pr = new PageReference('/apex/accounstab');
        //pr.getParameters().put('id', '0012800000klZSk');
        pr.setredirect(false);
        apexpages.currentpage().getparameters().put('id','0012800000klZSk');
        system.Debug('---------------------- ' + pr.getUrl());

    }        
}