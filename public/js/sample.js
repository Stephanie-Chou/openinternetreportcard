// var twh = new TwitterHelper(aAccount,
//                             aPassword,
//                             aThrobber,
//                             aServiceStr);
// var request = $.get("http://api.twitter.com/1.1/users/show.xml?screen_name=geekygirldawn", function(event){
//  console.log(event)
// });

// request.done(function(returnVal){
//  console.log(returnVal);ls

// });


function appendTemplateData(dataString) {
        var container = document.getElementById("container");
        container.innerHTML = container.innerHTML + dataString;
    }

    var templateString = "<div><span>Name: <%= lastname %></span></div>";
    var templateString2 = "<div><span>Name: <% print(lastname.toUpperCase()) %></span></div>";

    var studentInfo1 = "<% _.each(students, function(item) { %>" +
                      "<div class='studentRec " +
                      "<% (item.midterm_score + item.final_score) / 2 > 65 ? print('passingStudent') : print('failingStudent') %>'>" +
                      "<span style='font-weight:bold'>Name:</span> <span><%= item.lastname %>, <%= item.firstname %> </span>" +
                      "<span style='font-weight:bold'>School:</span> <span><%= item.school %></span></div>" +
                      "<% }); %>";

    var studentInfo2 = "<% var grouped = _.groupBy(students, function(item) {return item.school;}); " +
                      "for (i in grouped) { _.each(grouped[i], function(item) { %>" +
                      "<div class='studentRec " +
                      "<% (item.midterm_score + item.final_score) / 2 > 65 ? print('passingStudent') : print('failingStudent') %>'>" +
                      "<span style='font-weight:bold'>Name:</span> <span><%= item.lastname %>, <%= item.firstname %> </span>" +
                      "<span style='font-weight:bold'>School:</span> <span><%= item.school %></span></div>" +
                      "<% })}; %>";

    window.addEventListener("load", function(e) {
      // // compile the template string
      var compiledTemplate = _.template(templateString);
      var compiledTemplate = _.template(templateString2);

      // now we can call the template with different data
      var result = compiledTemplate({
        lastname: "Hossenfeffer"
      });

      // to perform a one-off template operation, just pass in the data object
      // as the second parameter to the template
      // var result = _.template(studentInfo1, students);
      appendTemplateData(result);
    });
