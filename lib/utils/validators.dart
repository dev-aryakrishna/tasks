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
  static String? validatePassword(String password){
    
     if(password.trim().isEmpty){
      return "password require";

    }
      
    if(password.length<6){
      return "password must be greater than 6 characters";
    }
    
    return null;

  }

    static String? validateDescription(String description){

      if(description.trim().isEmpty){
        return "Please enter description";
      }
      return null;
    }

    static String? validateTaskTitile(String title){

      if(title.trim().isEmpty){
        return "Please enter description";
      }
      return null;
    }



}