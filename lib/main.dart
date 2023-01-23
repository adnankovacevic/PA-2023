import 'package:flutter/material.dart';
import 'package:project2001/mobile/features/auth/screens/signin.dart';
import 'package:project2001/mobile/features/auth/screens/signup.dart';
import 'mobile/features/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Arena',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const Home(),
      routes: {
        Home.routeName: (context) => const SignIn(),
        SignUp.routeName: (context) => const SignUp(),
        SignIn.routeName: (context) => const Home()
      },
    );
  }
}
