$(document).ready(function(){
		$.ajax({
			url: "/refresher_dawg",
			type: "get"
		})
		.done(function(data){
			$('#loader').hide();
			$('#loader').after(data);
		})
		.fail(function(){
	
			console.log("ERRORRR");
		});
});


