// There are many ways to pick a DOM node; here we get the form itself and the email
// input box, as well as the span element into which we will place the error message.

var form  = document.getElementsByTagName('form')[0];
var email = document.getElementById('mail');
var full_name = document.getElementById('full-name');
var error = document.querySelector('.error');

email.addEventListener("keyup", function (event) {
  if (email.validity.valid) {
    error.innerHTML = "";
    error.className = "error";
  }
}, false);

full-name.addEventListener("keyup", function (event) {
  if (full-name.validity.valid) {
    error.innerHTML = "";
    error.className = "error";
  }
}, false);

form.addEventListener("submit", function (event) {
  if (!email.validity.valid) {
    error.innerHTML = "Please provide a valid email!";
    error.className = "error active";
    event.preventDefault();
  }
  if (!full-name.validity.valid {
    error.innerHTML = "Please provide your first and last name!";
    error.className: "error active";
    event.preventDefault();
  })
}, false);
