import 'package:add_to_app/alunos_info_page.dart';
import 'package:add_to_app/alunos_list_page.dart';
import 'package:add_to_app/personalData_page.dart';
import 'package:add_to_app/professor_info_page.dart';
import 'package:add_to_app/professor_list_page.dart';
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
        'AlunosList': (context) => AlunosListPage(),
        'AlunosInfo': (context) => AlunosInfo(),
        'ProfessoresList': (context) => ProfessoresListPage(),
        'ProfessoresInfo': (context) => ProfessoresInfo(),
      },
    );
  }
}

Widget isAlertDialogIncorrectFields(BuildContext context, text) {
  //AlertDialog para alertar informação incorreta
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          direction: Axis.vertical,
          children: [
            AlertDialog(
              titlePadding:
                  EdgeInsets.only(top: 40, bottom: 20, left: 30, right: 10),
              actions: [
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ),
              ],
              title: Text(
                text,
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      });
}

Widget menu_bar(context) {
  //barra de menu
  return (Drawer(
    child: SingleChildScrollView(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("user"),
            accountEmail: Text("user@user.com"),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("Home");
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Pessoas'),
            subtitle: Text("Informações"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Alunos'),
            subtitle: Text("Informações"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("AlunosList");
            },
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('Professores'),
            subtitle: Text("Informações"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("ProfessoresList");
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('Login');
            },
          ),
        ],
      ),
    ),
  ));
}
