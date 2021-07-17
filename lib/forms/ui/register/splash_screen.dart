import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lecture_exercise/forms/helpers/shared_preferences_helper.dart';
import 'package:lecture_exercise/forms/ui/home/ui/home_page.dart';
import 'package:lecture_exercise/forms/ui/register/main_register_screen.dart';

class splach extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((value) {
      if (SpHelper.spHelper.getUser() != null) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
        return HomePage('');
        }));
      } else {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
        return  FormUi();
        }));
      }
    });

    return Scaffold();
  }
}
