import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  const Heading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 60,
          ),
          Center(
            child: Text(
              'My Movie List',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}