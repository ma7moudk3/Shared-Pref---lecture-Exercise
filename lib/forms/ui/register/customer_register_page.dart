import 'package:flutter/material.dart';
import 'package:lecture_exercise/forms/globals.dart';
import 'package:lecture_exercise/forms/helpers/shared_preferences_helper.dart';
import 'package:lecture_exercise/forms/models/form_user.dart';
import 'package:string_validator/string_validator.dart';


class CustomerRegister extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email;
  String password;
  setEmail(String email) {
    this.email = email;
  }

  setPassword(String password) {
    this.password = password;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: formKey,
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.all(20),
              child: TextFormField(
                onSaved: (v) {
                  setEmail(v);
                },
                validator: (String value) {
                  if (value.length == 0) {
                    return 'Required Field';
                  } else if (!isEmail(value)) {
                    return 'Invalid Email Syntax';
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: 'Email',
                    fillColor: Colors.blue.withOpacity(0.2),
                    filled: true),
              )),
          Container(
              margin: EdgeInsets.all(20),
              child: TextFormField(
                onSaved: (v) {
                  setPassword(v);
                },
                validator: (String value) {
                  if (value.length == 0) {
                    return 'Required Field';
                  } else if (value.length < 6) {
                    return 'the password must be larger than 6 lettres';
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: 'Password',
                    fillColor: Colors.blue.withOpacity(0.2),
                    filled: true),
              )),
          ElevatedButton(
            child: Text('Sign Up As Customer'),
            onPressed: () async {
               
            //  Navigator.of(context).pushNamedAndRemoveUntil(
              //    'newRoute', ModalRoute.withName('name'));
              // var result = await Navigator.of(context).pushNamed('omar',
              //     arguments: 'this is arguments from customer page');
              // print(result);
                  if (formKey.currentState.validate()) {
                     formKey.currentState.save();
                    FormUser formUser =
                       FormUser.customer(email: email, password: password);
                      SpHelper.spHelper.SaveUser(formUser);
                  }
            },
          )
        ],
      ),
    );
  }
}
