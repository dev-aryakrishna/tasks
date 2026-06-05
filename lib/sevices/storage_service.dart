import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
 final storage = FlutterSecureStorage();

 Future<void>saveLogin()async{
  await storage.write(
    key: "loggedin", 
    value: 'true'
    );
 }

 Future<String?>getLogin()async{
  return await storage.read(
    key:"loggedin"
  ); 
 }

  Future<void>logout()async{
  await storage.delete(
    key: 'logedin'
    );
 }


}