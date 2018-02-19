({
	 setOutput : function(component, event, helper) {
		var cmpMsg = component.find("msg");
	    $A.util.removeClass(cmpMsg, 'hide');
	    
        var name = component.find("name").get("v.value");
        var oName = component.find("oName");
        oName.set("v.value", "This is My world"); 
	 }
})