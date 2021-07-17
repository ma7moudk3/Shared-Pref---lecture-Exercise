import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  String label;
  bool isPassword;
  TextEditingController controller;
  CustomTextfield(this.label, this.controller, [this.isPassword = false]);

  @override
  _CustomTextfieldState createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool isObsecure = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(20),
      child: TextFormField(
        obscureText: widget.isPassword ? isObsecure : false,
        controller: widget.controller,
        decoration: InputDecoration(
            suffixIcon: Visibility(
              visible: widget.isPassword,
              child: IconButton(
                icon: Icon(Icons.remove_red_eye),
                onPressed: () {
                  this.isObsecure = !this.isObsecure;
                  setState(() {});
                },
              ),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            labelText: widget.label,
            fillColor: Colors.blue.withOpacity(0.2),
            filled: true),
      ),
    );
  }
}
