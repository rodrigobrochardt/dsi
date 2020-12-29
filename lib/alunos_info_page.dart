import 'package:add_to_app/alunos_list_page.dart';
import 'package:add_to_app/app_widget.dart';
import 'package:flutter/material.dart';

class Aluno {
  //atributos  de aluno
  String nome;
  String matricula;
  String cpf;
  String endereco;
  Aluno({this.nome, this.matricula, this.cpf, this.endereco});
  Aluno.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    matricula = json['matricula'];
    cpf = json['cpf'];
    endereco = json['endereco'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['matricula'] = this.matricula;
    data['cpf'] = this.cpf;
    data['endereco'] = this.endereco;
    return data;
  }
}

class AlunosInfo extends StatefulWidget {
  String nome, cpf, endereco, matricula;
  String
      titulo; //variavel para verificar se esta adicionando ou criando novo aluno para mudar titulo da tela
  AlunosInfo({this.nome, this.cpf, this.endereco, this.matricula, this.titulo});
  @override
  _AlunosInfoState createState() => _AlunosInfoState();
}

class _AlunosInfoState extends State<AlunosInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.titulo),
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
                    initialValue: widget.nome,
                    onChanged: (text) {
                      widget.nome = text;
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
                  TextFormField(
                    initialValue: widget.endereco,
                    onChanged: (text) {
                      widget.endereco = text;
                    },
                    keyboardType: TextInputType.emailAddress,
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
                    initialValue: widget.cpf,
                    onChanged: (text) {
                      widget.cpf = text;
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
                    initialValue: widget.matricula,
                    onChanged: (text) {
                      widget.matricula = text;
                    },
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: 'Matrícula:',
                      labelStyle: TextStyle(fontSize: 15),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    //espaçamento entre widgets
                    height: 20,
                  ),
                  SizedBox(
                      //espaço que o botão irá ocupar
                      width: double.infinity,
                      height: 40,
                      child: RaisedButton(
                        onPressed: () {
                          if (widget.nome != '' &&
                              widget.cpf != '' &&
                              widget.endereco != '' &&
                              widget.matricula != '') {
                            // condição que precisa deixar os espaços preenchidos e senhas iguais
                            Navigator.pop(context, [
                              widget.nome,
                              widget.cpf,
                              widget.endereco,
                              widget.matricula
                            ]);
                          } else {
                            isAlertDialogIncorrectFields(
                                context, 'Campo(s) inválido(s)!');
                          }
                        },
                        color: Colors.grey[700],
                        child: Text(
                          'Salvar',
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
