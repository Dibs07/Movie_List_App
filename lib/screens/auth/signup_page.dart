import 'package:flutter/material.dart';
import 'package:my_movie_list/components/button.dart';
import 'package:my_movie_list/components/input_field.dart';
import 'package:my_movie_list/components/text_login.dart';
import 'package:my_movie_list/components/vertical_text.dart';
import 'package:my_movie_list/screens/auth/login_page.dart';
import 'package:my_movie_list/services/alert_service.dart';
import 'package:my_movie_list/services/auth_services.dart';
import 'package:my_movie_list/services/navigation_service.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final NavigationService _navigationService = NavigationService();
  final AlertService _alertService = AlertService();
  final AuthService _authService = AuthService();
  String? email, password;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> login(String email,String password)async {
    try {
    await _authService.register(email, password);
    _alertService.showSnackBar(message: "Signed Up Successfully");
    } catch (e) {
      print(e);
      _alertService.showSnackBar(message: "Error Signing Up");
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
                  Row(children: <Widget>[
                    VerticalText(
                      text: "Sign Up",
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
                      //color: Colors.red,
                      height: 20,
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  _navigationService.createRoute(
                                      route: LoginPage()));
                            },
                            child: Text(
                              ' Sign In',
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
