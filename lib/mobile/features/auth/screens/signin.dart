import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:project2001/constants/global_variables.dart';
import 'package:project2001/mobile/features/auth/screens/signup.dart';
import 'package:project2001/mobile/features/auth/services/auth_service.dart';
import 'package:project2001/mobile/features/home/home.dart';
import 'package:project2001/widgets/custom_button.dart';
import 'package:project2001/widgets/custom_textfield.dart';

class SignIn extends StatefulWidget {
  static const routeName = '/SignIn';
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void onSignIn() async {
    _formKey.currentState!.validate();
    _formKey.currentState!.save();
    signInUser();
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: GlobalVariables.primaryColor,
        title: Text("Prijava".toUpperCase()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                    controller: _emailController,
                    hintText: 'Email',
                    obsecureText: false),
                const SizedBox(height: 15),
                CustomTextField(
                    controller: _passwordController,
                    hintText: 'Sifra',
                    obsecureText: true),
                const SizedBox(height: 25),
                CustomButton(
                  text: 'Prijavi se',
                  onTap: () {
                    //_formKey.currentState!.validate();
                    //onSignIn();
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Navigator.pushReplacementNamed(context, Home.routeName);
                    }
                  },
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    const Expanded(
                        child: Divider(
                      thickness: 1.0,
                      color: Colors.black12,
                      height: 35,
                    )),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 214, 214, 214),
                          shape: BoxShape.circle),
                      child: const Center(
                        child: Text(
                          'ili',
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        thickness: 1.0,
                        color: Colors.black12,
                        height: 36.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                SignInButton(
                  Buttons.Facebook,
                  text: "Facebook Prijava",
                  onPressed: () {},
                ),
                const SizedBox(height: 10),
                SignInButton(
                  Buttons.Google,
                  text: "Google Prijava",
                  onPressed: () {},
                ),
                const SizedBox(height: 10),
                CustomButton(
                    onTap: (() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUp()),
                      );
                    }),
                    text: 'Registracija'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
