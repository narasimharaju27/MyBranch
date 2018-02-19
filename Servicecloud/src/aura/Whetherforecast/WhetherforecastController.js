({
	myAction : function(component, event, helper) {
		
	}
})({
    doInit : function(component, event, helper) {
        component.set("v.message", "Getting current location...");
        console.log(navigator.geolocation);
        navigator.geolocation.getCurrentPosition(
            function(position) {
                component.set("v.latitude", position.coords.latitude);
                component.set("v.longitude", position.coords.longitude);
                helper.getWeather(component);
                component.set("v.message", "");
            },
            function(error) {
                component.set("v.message", "");
                alert("Geolocation not available. Please enter a location manually.")
            });
    },
    
    searchHandler: function(component, event, helper) {
        helper.getWeather(component);
    }
})