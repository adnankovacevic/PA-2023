import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project2001/constants/error_handler.dart';
import 'package:project2001/constants/global_variables.dart';
import 'package:project2001/mobile/features/home/home.dart';
import 'package:http/http.dart' as http;
import 'package:project2001/model/user.dart';
import 'package:project2001/widgets/show_snackbar.dart';

class AuthService {
  // SignUp

  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      User user = User(
        fullname: username,
        email: email,
        password: password,
      );

      http.Response res = await http.post(
        Uri.parse("$uri/api/register"),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            showSnackbar(
                context, "Account created! Login with the same credentials.");
          });
      //Navigator.of(context).pop(Home.routeName);
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

// SignIn

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/login'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          Navigator.pushNamedAndRemoveUntil(
              context, Home.routeName, (route) => false);
        },
      );
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }
}
