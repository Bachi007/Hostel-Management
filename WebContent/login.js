function login(){
        var user = document.loginform.user_name.value;
        var pass = document.loginform.pass_word.value;
  if(user == "" || pass == ""){
          alert("sorry...Please Enter Username and Passowrd");
     }else{
  if((user == "admin" || user == "sukrutha" || user == "sasikala"|| user == "rajendra") && pass == "123456"){
      alert("login successfully");
    }else{
         alert("Please Enter Correct Credentials");
  }
       }
           }