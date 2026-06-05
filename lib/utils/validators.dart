class Validators {
  static String? validateEmail(String email){
    final emailRegex = RegExp( r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',);

    if(email.trim().isEmpty){
      return "email require";

    }
      
    if(!emailRegex.hasMatch(email.trim())){
      return "please enter a valid email";
    }
    
    return null;

  }

  static String? validateName(String name){

    if(name.trim().isEmpty){
      return "namw require";

    }
      
    if(!RegExp(r'^[a-zA-Z\s]+$').hasMatch(name)){
      return "Name should contain only letters";
    }
    
    return null;


  }

    static String? validatePhone(String phone){

    if(phone.trim().isEmpty){
      return "name require";

    }
      
    if(!RegExp(r'^[0-9]{10}$').hasMatch(phone)){
      return "phone should contain only numbers";
    }
    
    return null;

  }

  
  static String? validatePassword(String password){
    
     if(password.trim().isEmpty){
      return "password require";

    }
      
    if(password.length<6){
      return "password must be greater than 6 characters";
    }
    
    return null;

  }

  static String? validateConfirmPassword(String password , String confirmpassword){
    
     if(confirmpassword.trim().isEmpty){
      return "Please confirm password ";

    }
      
    if(password != confirmpassword){
      return "Passwords do not match";
    }
    
    return null;

  }



      static String? validateTaskTitile(String title){

      if(title.trim().isEmpty){
        return "Please enter title";
      }
      return null;
    }


    static String? validateDescription(String description){

      if(description.trim().isEmpty){
        return "Please enter description";
      }
      return null;
    }

  


}