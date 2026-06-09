import'../utils/app_errors.dart';


class Validators {
  static String? validateEmail(String email){
    final emailRegex = RegExp( r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',);

    if(email.trim().isEmpty){
      return AppErrors.getMessage(AppErrors.emailRequired);
    }
      
    if(!emailRegex.hasMatch(email.trim())){
      return AppErrors.getMessage(AppErrors.invalidEmail);
    }
    
    return null;

  }


  static String? validateName(String name){

    if(name.trim().isEmpty){
      return AppErrors.getMessage(AppErrors.nameRequired);

    }
      
    if(!RegExp(r'^[a-zA-Z\s]+$').hasMatch(name)){
      return AppErrors.getMessage(AppErrors.invalidName);
    }
    
    return null;


  }


  static String? validatePhone(String phone){

    if(phone.trim().isEmpty){
      return AppErrors.getMessage(AppErrors.phoneRequired);

    }
      
    if(!RegExp(r'^[0-9]{10}$').hasMatch(phone)){
      return AppErrors.getMessage(AppErrors.invalidPhone);
    }
    
    return null;

  }

  
  static String? validatePassword(String password){
    
     if(password.trim().isEmpty){
      return AppErrors.getMessage(AppErrors.passwordRequired);

    }
      
    if(password.length<6){
      return AppErrors.getMessage(AppErrors.passwordTooShort);
    }
    
    return null;

  }


  static String? validateConfirmPassword(String password , String confirmpassword){
    
     if(confirmpassword.trim().isEmpty){
      return AppErrors.getMessage(AppErrors.confirmPasswordRequired);

    }
      
    if(password != confirmpassword){
      return AppErrors.getMessage(AppErrors.passwordMismatch);
    }
    
    return null;

  }



  static String? validateTaskTitile(String title){

      if(title.trim().isEmpty){
        return AppErrors.titleRequired;
      }
      return null;
    }


  static String? validateDescription(String description){

      if(description.trim().isEmpty){
        return AppErrors.descriptionRequired;
      }
      return null;
  }

  


}