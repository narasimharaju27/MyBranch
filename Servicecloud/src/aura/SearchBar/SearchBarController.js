({
    searchKeyChange: function(component, event) {
        
        var searchKey = component.find("name");
        alert(searchKey);
        var action = component.get("c.findAll");
        action.setParams({
          "searchKey": searchKey
        });
        action.setCallback(this, function(a) {
            component.set("v.Accounts", a.getReturnValue());
        });
        
        $A.enqueueAction(action);
    }
})