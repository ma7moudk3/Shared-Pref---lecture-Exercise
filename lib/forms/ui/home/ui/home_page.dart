import 'package:flutter/material.dart';
import 'package:lecture_exercise/forms/globals.dart';
import 'package:lecture_exercise/forms/helpers/shared_preferences_helper.dart';
import 'package:lecture_exercise/forms/ui/register/main_register_screen.dart';


class HomePage extends StatelessWidget {
  String name;
  HomePage(this.name);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(this.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Text(Globals.globals.formUser.userType == UserType.customer
               ? 'hi i am customer, my email is ${Globals.globals.formUser.email} and my password is ${Globals.globals.formUser.password}'
             : 'hi i am mershant, my shop name is ${Globals.globals.formUser.shopName}, and its place in ${Globals.globals.formUser.shopAddress}, ${Globals.globals.formUser.bio}'),
          ElevatedButton(
            child: Text('SignOut'),
            onPressed: () {
              SpHelper.spHelper.singout();
            },
          ),
        ],
      ),
    );
  }
}
