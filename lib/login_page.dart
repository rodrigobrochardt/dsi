import 'package:add_to_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'app_widget.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _login = '';
  String _senha = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        //permite scrollar os widgets pra cima
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding:
                const EdgeInsets.all(20), //permite dar espaçamento das bordas
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, //centraliar
              children: [
                Image(
                  image: AssetImage('images/logo/bsi.png'),
                  height: 100,
                ),
                SizedBox(
                  //espaçamento entre widgets
                  height: 40,
                ),
                SizedBox(
                  height: 1,
                ),
                TextFormField(
                  //widget para inserir login
                  onChanged: (text) {
                    _login = text;
                  },
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Login:',
                    labelStyle: TextStyle(fontSize: 15),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  //espaçamento entre widgets
                  height: 10,
                ),
                TextFormField(
                  //widget para inserir senha
                  onChanged: (text) {
                    _senha = text;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Senha:',
                    labelStyle: TextStyle(fontSize: 15),
                    border: OutlineInputBorder(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'Forgot');
                      },
                      child: Text(
                        'Esqueci minha senha',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  //espaço que o botão irá ocupar
                  width: 150,
                  height: 40,
                  child: RaisedButton(
                    onPressed: () {
                      if (_login != '' && _senha != '') {
                        Navigator.pushReplacementNamed(context, 'Home');
                      } else {
                        isAlertDialogIncorrectFields(
                            context, "Login/Senha inválido(s)");
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(
                  //espaçamento entre widgets
                  height: 5,
                ),
                SizedBox(
                  //espaço que o botão irá ocupar
                  width: 150,
                  height: 40,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'Register');
                    },
                    child: Text(
                      'Cadastrar-se',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
