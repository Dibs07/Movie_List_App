import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String labelText;
  bool isobsecure;
  final void Function(String?) onSaved;

  InputField({super.key, required this.labelText, this.isobsecure=false, required this.onSaved});

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          onSaved: widget.onSaved,
          style: TextStyle(
            color: Colors.white,
          ),
          obscureText: widget.isobsecure!,
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.lightBlueAccent,
            labelText: widget.labelText,
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}