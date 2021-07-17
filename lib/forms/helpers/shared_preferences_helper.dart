import 'dart:convert';

import 'package:lecture_exercise/forms/globals.dart';
import 'package:lecture_exercise/forms/models/form_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpHelper{
  SpHelper._();
  static SpHelper spHelper = SpHelper._();
  SharedPreferences sharedPreferences;
  initSharedPreferences() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  SaveUser(FormUser user){
    sharedPreferences.setString('formUser',json.encode({...user.toMap()}));
    Globals.globals.formUser =user;
  }
  FormUser getUser(){
    String user =  sharedPreferences.getString('formUser');
    if(user == null){
      return null ;
    }else{
 Map userMap = json.decode(user);
   FormUser formUser = FormUser.map(userMap);
   Globals.globals.formUser =formUser;
   return formUser ;
    }
   
  }

  singout(){
    sharedPreferences.remove('fromUser');
  }
}