import 'package:add_to_app/app_widget.dart';
import 'package:add_to_app/pessoas_list_page.dart';
import 'package:flutter/material.dart';

class Professor extends Pessoa {
  //atributos  de professor
  Professor({String nome, String matricula, String cpf, String endereco})
      : super(nome: nome, matricula: matricula, cpf: cpf, endereco: endereco);
  Professor.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    matricula = json['matricula'];
    cpf = json['cpf'];
    endereco = json['endereco'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> prof = new Map<String, dynamic>();
    prof['nome'] = this.nome;
    prof['matricula'] = this.matricula;
    prof['cpf'] = this.cpf;
    prof['endereco'] = this.endereco;
    return prof;
  }
}

class ProfessoresInfo extends StatefulWidget {
  String nome, cpf, endereco, matricula;
  String
      titulo; //variavel para verificar se esta adicionando ou criando novo professor para mudar titulo da tela
  ProfessoresInfo(
      {this.nome, this.cpf, this.endereco, this.matricula, this.titulo});
  @override
  _ProfessoresInfo createState() => _ProfessoresInfo();
}

class _ProfessoresInfo extends State<ProfessoresInfo> {
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
