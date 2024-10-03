import 'package:flutter/material.dart';
import 'package:my_movie_list/components/button.dart';
import 'package:my_movie_list/components/heading.dart';
import 'package:my_movie_list/components/input_field.dart';
import 'package:my_movie_list/components/text_login.dart';
import 'package:my_movie_list/components/vertical_text.dart';
import 'package:my_movie_list/screens/auth/signup_page.dart';
import 'package:my_movie_list/services/alert_service.dart';
import 'package:my_movie_list/services/auth_services.dart';
import 'package:my_movie_list/services/navigation_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final NavigationService _navigationService = NavigationService();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? email, password;
  final AlertService _alertService = AlertService();
  final AuthService _authService = AuthService();

  Future<void> login(String email, String password) async {
    try {
      await _authService.login(email, password);
      _alertService.showSnackBar(message: "Logged In Successfully");
      Navigator.of(context).pushReplacement(_navigationService.createRoute(route: SignupPage()));
    } catch (e) {
      print(e);
      _alertService.showSnackBar(message: "Error Logging In");
    }
  }

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
            Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  //Heading(),
                  Row(children: <Widget>[
                    VerticalText(
                      text: "Sign In",
                    ),
                    TextLogin(
                      text: "Track all your movies and TV shows",
                    ),
                  ]),
                  InputField(
                      labelText: "Email",
                      onSaved: (value) {
                        setState(() {
                          email = value;
                        });
                      }),
                  InputField(
                      labelText: "Password",
                      isobsecure: true,
                      onSaved: (value) {
                        setState(() {
                          password = value;
                        });
                      }),
                  ButtonLogin(
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        formKey.currentState?.save();
                        login(email!, password!);
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 30),
                    child: Container(
                      alignment: Alignment.topRight,
                      height: 20,
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Your first time?',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(_navigationService.createRoute(route: SignupPage()));
                            },
                            child: Text(
                              ' Sign Up',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
