// This is a closure function https://medium.com/javascript-scene/master-the-javascript-interview-what-is-a-closure-b2f0d2152b36
(function() {
  var initialize = function() {
    /*
      Array to Store EventVariables
      Events and ActionListenrs declaration and Callbacks....
    */
    var EventVariables = [];
    var departmentvalue1;
    var departmentvalue2;
    var name = document.querySelector("#name");
    var phno = document.querySelector("#phno");
    var email = document.querySelector("#email");
    var button = document.querySelector(".button");
    button.addEventListener("click", onSubmit);
    var department1 = document.querySelector("#department1");
    var department2 = document.querySelector("#department2");

    department1.addEventListener("change", disableDuplicateSecondaryDepartment);
    departmentvalue1 = disableDuplicateSecondaryDepartment();

    department2.addEventListener("change", setdepartment2);
    function setdepartment2() {
      return department2.value;
    }
    departmentvalue2 = setdepartment2();
    EventVariables = [name, phno, email, department1, department2];
    var EventVariablesValues = EventVariables.map(event => event.value);
    return EventVariablesValues;
  };

  //CallBack Function for department disabling.

  var disableDuplicateSecondaryDepartment = function() {
    for (let i = 0; i < 4; i++) {
      if (department2.children[i].innerText == department1.value) {
        department2.children[i].disabled = true;
        if (i < 3) {
          department2.children[i + 1].selected = true;
        } else {
          department2.children[2].selected = true;
        }
      } else {
        department2.children[i].disabled = false;
      }
    }

    return department1.value;
  };

  // Data of Form from HTML document in Object.

  var constructData = function() {
    var data = {};
    var FinalValues = initialize();
    console.log(FinalValues);
    data.name = FinalValues[0];
    data.phno = FinalValues[1];
    data.emailaddress = FinalValues[2];
    data.department1 = FinalValues[3];
    data.department2 = FinalValues[4];

    console.log(data.name.length);

    return data;
  };

  //Validating name,phno,email...

  var validateResults = function(data) {
    var isValid = true;
    const emailExpression = /^([a-zA-Z0-9\.])+@college+(\.edu)*$/;
    if (
      data.phno.length == 0 ||
      data.phno.length > 10 ||
      (data.name.trim() === "" || data.name.length > 101) ||
      !emailExpression.test(data.emailaddress)
    ) {
      isValid = false;
    } else {
      isValid = true;
    }

    return isValid;
  };

  //Submit callback to validate and print results..

  var onSubmit = function(e) {
    e.preventDefault();
    console.log("ok");
    var data = constructData();
    console.log(data);

    if (validateResults(data)) {
      printResults(data);
    } else {
      var resultsDiv = document.getElementById("results");
      resultsDiv.innerHTML = "";
      resultsDiv.classList.add("hide");
    }
  };

  var printResults = function(data) {
    var constructElement = function([key, value]) {
      return `<p class='result-item'>${key}: ${value}</p>`;
    };

    var resultHtml = (Object.entries(data) || []).reduce(function(
      innerHtml,
      keyValuePair
    ) {
      debugger;
      return innerHtml + constructElement(keyValuePair);
    },
    "");
    var resultsDiv = document.getElementById("results");
    resultsDiv.innerHTML = resultHtml;
    resultsDiv.classList.remove("hide");
  };

  /*
    Initialize the javascript functions only after the html DOM content has loaded.
    This is to ensure that the elements are present in the DOM before binding any event listeners to them.
  */
  document.addEventListener("DOMContentLoaded", initialize);
})();
