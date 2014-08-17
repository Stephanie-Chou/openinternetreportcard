var twh = new TwitterHelper(aAccount,
                            aPassword,
                            aThrobber,
                            aServiceStr);
var request = $.get("http://api.twitter.com/1.1/users/show.xml?screen_name=geekygirldawn", function(event){
	console.log(event)
});

request.done(function(returnVal){
	console.log(returnVal);ls

});