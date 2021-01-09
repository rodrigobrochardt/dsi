import 'package:add_to_app/app_widget.dart';
import 'package:add_to_app/pessoas_list_page.dart';
import 'package:flutter/material.dart';

import 'database.dart';

class Aluno {
  String id, nome, matricula, endereco, cpf;
  //atributos  de aluno
  Aluno({this.id, this.nome, this.matricula, this.cpf, this.endereco});
}

class AlunosInfo extends StatefulWidget {
  String nome, cpf, endereco, matricula, id;
  String
      titulo; //variavel para verificar se esta adicionando ou criando novo aluno para mudar titulo da tela
  AlunosInfo({
    this.id,
    this.nome,
    this.cpf,
    this.endereco,
    this.matricula,
    this.titulo,
  });
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
                        //botão para salvar
                        onPressed: () {
                          if (widget.nome != '' &&
                              widget.cpf != '' &&
                              widget.endereco != '' &&
                              widget.matricula != '') {
                            // condição que precisa deixar os espaços preenchidos e senhas iguais
                            if (widget.titulo == "Adicionando Aluno") {
                              //condição para saber se esta adicionando
                              Database().createNewAluno(widget.nome, widget.cpf,
                                  widget.endereco, widget.matricula);
                            } else {
                              //condição para saber se esta editando
                              Database().updateAluno(
                                  widget.id,
                                  widget.nome,
                                  widget.cpf,
                                  widget.endereco,
                                  widget.matricula);
                            }

                            Navigator.pop(context); //voltar para tela anterior
                          } else {
                            isAlertDialogIncorrectFields(
                                context, 'Campo(s) inválido(s)!', Colors.red);
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
