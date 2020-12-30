import 'package:add_to_app/app_widget.dart';
import 'package:flutter/material.dart';

class PersonalDataPage extends StatefulWidget {
  PersonalDataPage({Key key}) : super(key: key);
  @override
  _PersonalDataPageState createState() => _PersonalDataPageState();
}

class _PersonalDataPageState extends State<PersonalDataPage> {
  String _nome = '';
  String _dataDeNascimento = '';
  String _cpf = '';
  String _endereco = '';
  String _sexo;
  String _nacionalidade = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dados da conta'),
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
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onChanged: (text) {
                      _nome = text;
                    },
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: 'Nome:',
                      labelStyle: TextStyle(fontSize: 15),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    //espaçamento entre widgets
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: DropdownButton<String>(
                            hint: Text("Sexo"),
                            value: _sexo,
                            onChanged: (changedValue) {
                              setState(() {
                                _sexo = changedValue;
                              });
                            },
                            items: <String>['Masculino', 'Feminino']
                                .map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList()),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      new Flexible(
                        child: TextFormField(
                          onChanged: (text) {
                            _dataDeNascimento = text;
                          },
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Data de nascimento:',
                            labelStyle: TextStyle(fontSize: 15),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    //espaçamento entre widgets
                    height: 10,
                  ),
                  TextFormField(
                    onChanged: (text) {
                      _cpf = text;
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'CPF:',
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
                      _endereco = text;
                    },
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: 'Endereço:',
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
                      _nacionalidade = text;
                    },
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: 'Nacionalidade:',
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
                          if (_nome != "" &&
                              _sexo != null &&
                              _dataDeNascimento != "" &&
                              _cpf != "" &&
                              _endereco != "" &&
                              _nacionalidade != "") {
                            Navigator.pop(context, 'Home');
                          } else {
                            isAlertDialogIncorrectFields(
                                context, 'Campo(s) inválido(s)!', Colors.red);
                          }
                        },
                        color: Colors.grey[700],
                        child: Text(
                          'Atualizar',
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
