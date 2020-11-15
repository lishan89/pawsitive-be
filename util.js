var validateEmail = function(mail) 
{
 if (/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/.test(myForm.emailAddr.value))
  {
    return (true)
  }
    return (false)
}
var isEmpty = function(str) {
    return (!str || 0 === str.trim().length);
}

module.exports.validateEmail = validateEmail;
module.exports.isEmpty = isEmpty;