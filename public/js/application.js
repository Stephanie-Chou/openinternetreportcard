

function appendTemplateData(dataString) {
        var container = document.getElementById("container");
        container.innerHTML = container.innerHTML + dataString;
    }
var profile = "<h1><%= name%> Profile</h1><p> <%=name%> is a <%=_.sample(adjectives)%> tweeter who excells at <%=_.sample(verb)%>. <%=gender%> is most chatty at <%=time%>. <%=name%> is super into <%=_.each(hashtags, function(item){item})%></p>";

var test = "<p>"+"<%_.each(tweets, function(item){ %>"+"<li>" +"<%= item %>"+"</li>"+ "<% }); %>" +"You are <%=birdType%> who twitters it up around <%= time%>. </p>";

 var timeSentence = "<p>You are <%=birdType%> who twitters it up around <%= time%></p>"
$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
 $("#userInfo").submit(function(event){
        event.preventDefault();
        var handle = $("input[name='handle']").val();
        var request =  $.post('/', {handle: handle});
        var compiledTemplate = _.template(profile);
        var testTemplate = _.template(timeSentence);
        request.done(function(returnValue){
          // var result = compiledtemplate({
          //   name: returnValue.name,
          //   adjectives: returnValue.adjectives,
          //   verb: returnValue.verb,
          //   gender: returnValue.gender,
          //   time: returnValue.time,
          //   hashtags: returnValue.hashtags
          // });

          var result = testTemplate({
            birdType: returnValue.birdType,
            time: returnValue.time
          });
          appendTemplateData(result);
        });


      });

});
