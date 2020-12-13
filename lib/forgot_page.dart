import 'package:flutter/material.dart';

class ForgotPage extends StatefulWidget {
  ForgotPage({Key key}) : super(key: key);
  @override
  _ForgotPageState createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  String _email = '';
  String msg = '';
  Color validcolor = Colors.grey[700];

  void isValidForgot(valid) {
    if (valid) {
      msg = 'Senha Enviada por Email!';
      validcolor = Colors.green;
    } else {
      msg = 'Email inválido!';
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
        title: Text('Recuperar senha'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding:
              const EdgeInsets.all(20), //permite dar espaçamento das bordas
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
                  _email = text;
                },
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Email:',
                  labelStyle: TextStyle(fontSize: 15),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                //espaço que o botão irá ocupar
                width: 150,
                height: 40,
                child: RaisedButton(
                  onPressed: () {
                    if (_email != '') {
                      isValidForgot(true);
                      Navigator.pop(context, 'Login');
                    } else {
                      isValidForgot(false);
                    }
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
    );
  }
}
