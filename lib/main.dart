import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_movie_list/screens/auth/login_page.dart';
import 'package:my_movie_list/utils.dart';

Future main() async {
  await setup();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}
Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerService();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}


