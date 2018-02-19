({
	getWeather: function(component, helper) {
        var action = component.get("c.getWeather");
		var searchKey = component.get("v.searchKey");
        action.setParams({
            "q": searchKey ? searchKey.replace(/ /g, '_') : component.get("v.latitude") + "," + component.get("v.longitude")
        });
        action.setCallback(this, function(response) {
            var data = JSON.parse(response.getReturnValue());
             if (data.current_observation) {
                component.set("v.currentWeather", data.current_observation);
                component.set("v.forecast", data.forecast);
            } else {
                alert("Location ambiguous or not found. Specify state or country.");
            }
        });
        $A.clientService.runActions([action]);
	}

})