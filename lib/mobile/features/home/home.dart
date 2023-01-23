import 'package:flutter/material.dart';
import 'package:project2001/mobile/features/auth/screens/signin.dart';

class Home extends StatelessWidget {
  static const routeName = '/Home';

  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 70,
          child: Image.asset('assets/images/parena.png'),
        ),
      ),
    );
  }
}
