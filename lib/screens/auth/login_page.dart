import 'package:flutter/material.dart';
import 'package:my_movie_list/components/button.dart';
import 'package:my_movie_list/components/first_time.dart';
import 'package:my_movie_list/components/input_email.dart';
import 'package:my_movie_list/components/password_input.dart';
import 'package:my_movie_list/components/text_login.dart';
import 'package:my_movie_list/components/vertical_text.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blueGrey, Colors.lightBlueAccent]),
        ),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(children: <Widget>[
                  VerticalText(),
                  TextLogin(),
                ]),
                InputEmail(),
                PasswordInput(),
                ButtonLogin(),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 30),
                  child: Container(
                    alignment: Alignment.topRight,
                    //color: Colors.red,
                    height: 20,
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Your first time?',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white70,
                          ),
                        ),
                        TextButton(
                          // padding: EdgeInsets.all(0),
                          onPressed: () {},
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
