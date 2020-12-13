import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _email = '';
  String _login = '';
  String _senha = '';
  String _confirmSenha = '';
  String msg = '';
  Color validcolor = Colors.grey[700];

  void isValidRegister(validing) {
    if (validing) {
      msg = 'Cadastro concluído!';
      validcolor = Colors.green;
    } else {
      msg = 'Campo(s) inválido(s)!';
      validcolor = Colors.red;
    }
    setState(() {
      msg = msg;
      validcolor = validcolor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastro'),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width, //busca tamanho da tela
            height: MediaQuery.of(context).size.height, //busca tamanho da tela
            child: Padding(
              padding: const EdgeInsets.all(20), //limita o tamanho dos widgets
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    msg,
                    style: TextStyle(color: validcolor),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  TextFormField(
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
                    onChanged: (text) {
                      _email = text;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email:',
                      labelStyle: TextStyle(fontSize: 15),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    //espaçamento entre widgets
                    height: 10,
                  ),
                  TextFormField(
                    onChanged: (text) {
                      _senha = text;
                    },
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      labelText: 'Senha:',
                      labelStyle: TextStyle(fontSize: 15),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    //espaçamento entre widgets
                    height: 10,
                  ),
                  TextFormField(
                    onChanged: (text) {
                      _confirmSenha = text;
                    },
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      labelText: 'Confirmar senha:',
                      labelStyle: TextStyle(fontSize: 15),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    //espaçamento entre widgets
                    height: 10,
                  ),
                  SizedBox(
                      //espaço que o botão irá ocupar
                      width: 150,
                      height: 40,
                      child: RaisedButton(
                        onPressed: () {
                          if (_login != '' &&
                              _email != '' &&
                              _senha != '' &&
                              _confirmSenha != '' &&
                              _senha == _confirmSenha) {
                            // condição que precisa deixar os espaços preenchidos e senhas iguais
                            isValidRegister(true);
                            Navigator.pop(context, 'Login');
                          } else {
                            isValidRegister(false);
                          }
                        },
                        color: Colors.grey[700],
                        child: Text(
                          'Cadastrar',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
