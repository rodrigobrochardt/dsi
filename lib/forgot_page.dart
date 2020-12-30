import 'package:add_to_app/app_widget.dart';
import 'package:flutter/material.dart';

class ForgotPage extends StatefulWidget {
  ForgotPage({Key key}) : super(key: key);
  @override
  _ForgotPageState createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  String _email = '';

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
              SizedBox(
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
                height: 10,
              ),
              SizedBox(
                //espaço que o botão irá ocupar
                width: 150,
                height: 40,
                child: RaisedButton(
                  onPressed: () {
                    if (_email != '') {
                      Navigator.pop(context, 'Login');
                    } else {
                      isAlertDialogIncorrectFields(
                          context, 'Email inválido!', Colors.red);
                    }
                  },
                  child: Text(
                    'Recuperar',
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
