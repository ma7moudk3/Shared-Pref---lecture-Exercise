import 'package:flutter/material.dart';
import 'package:lecture_exercise/forms/models/form_user.dart';
import 'package:lecture_exercise/forms/ui/home/ui/home_page.dart';
import 'package:lecture_exercise/forms/ui/register/customer_register_page.dart';
import 'package:lecture_exercise/forms/ui/register/mershant_register_page.dart';


enum UserType { customer, mershant }

class FormUi extends StatefulWidget {
  @override
  _FormUiState createState() => _FormUiState();
}

class _FormUiState extends State<FormUi> {
  FormUser formUser;
  setFormUser(formuser) {
    this.formUser = formuser;
  }

  UserType geoupValue;
  String email;
  String password;
  setEmail(String email) {
    this.email = email;
  }

  setPassword(String password) {
    this.password = password;
  }

  saveForm() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return HomePage('');
    }));
    // if (formKey.currentState.validate()) {
    //   formKey.currentState.save();
    // } else {
    //   return;
    // }
  }

  GlobalKey<FormState> mershantKey = GlobalKey<FormState>();
  GlobalKey<FormState> customerKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Ui'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                        title: Text('Customer'),
                        value: UserType.customer,
                        groupValue: geoupValue,
                        onChanged: (v) {
                          this.geoupValue = v;
                          setState(() {});
                        }),
                  ),
                  Expanded(
                    child: RadioListTile(
                        title: Text('Mershant'),
                        value: UserType.mershant,
                        groupValue: geoupValue,
                        onChanged: (v) {
                          this.geoupValue = v;
                          setState(() {});
                        }),
                  )
                ],
              ),
            ),
            this.geoupValue == UserType.customer
                ? CustomerRegister()
                : MershantRegister(),
          ],
        ),
      ),
    );
  }
}
