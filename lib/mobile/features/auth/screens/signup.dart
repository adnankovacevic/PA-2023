import 'package:flutter/material.dart';

import 'package:project2001/constants/global_variables.dart';
import 'package:project2001/mobile/features/auth/screens/signin.dart';
import 'package:project2001/mobile/features/auth/services/auth_service.dart';
import 'package:project2001/widgets/custom_textfield.dart';

enum Spol {
  man,
  woman,
}

class SignUp extends StatefulWidget {
  static const routeName = '/SignUp';
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService authService = AuthService();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool man = true;
  bool women = false;
  Spol _spol = Spol.man;

  void onSignUp() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      signUpUser();
    }
  }

  void signInNavigation() {
    setState(() {
      Navigator.of(context).pushNamed(SignIn.routeName);
    });
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      username: _usernameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  void checkSpol() {
    setState(() {
      man = !women;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: GlobalVariables.primaryColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text("Registracija"),
          centerTitle: false,
          actions: [
            TextButton(
              onPressed: onSignUp,
              child: Text(
                'Gotovo'.toUpperCase(),
                style: const TextStyle(color: Colors.black54, fontSize: 17),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(children: [
                CustomTextField(
                    controller: _usernameController,
                    hintText: 'Korisnicko ime',
                    obsecureText: false),
                const SizedBox(height: 15),
                CustomTextField(
                    controller: _passwordController,
                    hintText: 'Sifra',
                    obsecureText: true),
                const SizedBox(height: 15),
                CustomTextField(
                    controller: _confirmPasswordController,
                    hintText: 'Sifra ponovo',
                    obsecureText: true),
                const SizedBox(height: 15),
                CustomTextField(
                    controller: _emailController,
                    hintText: 'Email',
                    obsecureText: false),
                const SizedBox(height: 15),
                Row(
                  children: <Widget>[
                    const Text(
                      'Spol:',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16.5,
                      ),
                    ),
                    Radio(
                      value: Spol.man,
                      groupValue: _spol,
                      onChanged: ((Spol? value) => setState(() {
                            _spol = value!;
                          })),
                    ),
                    const Text(
                      'Muško',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Radio(
                      value: Spol.woman,
                      groupValue: _spol,
                      onChanged: ((Spol? value) => setState(() {
                            _spol = value!;
                          })),
                    ),
                    const Text(
                      'Žensko',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ));
  }
}
