import 'package:add_to_app/personalData_page.dart';
import 'package:add_to_app/register_page.dart';
import 'package:flutter/material.dart';

import 'forgot_page.dart';
import 'dsi_page.dart';
import 'home_page.dart';
import 'login_page.dart';

class DSIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add to App',
      theme: ThemeData(
        primaryColor: Colors.grey[700],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'Login',
      routes: {
        //tags para trocar de tela
        'Forgot': (context) => ForgotPage(),
        'Home': (context) => HomePage(),
        'DSI': (context) => DSIPage(),
        'Login': (context) => LoginPage(),
        'Register': (context) => RegisterPage(),
        'PersonalData': (context) => PersonalDataPage(),
      },
    );
  }
}

class ForgotPasswordPage {}
