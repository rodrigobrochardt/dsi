import 'package:add_to_app/alunos_info_page.dart';
import 'package:add_to_app/app_widget.dart';
import 'package:add_to_app/pessoas_list_page.dart';
import 'package:flutter/material.dart';

import 'database.dart';

class AlunosListPage extends StatefulWidget {
  @override
  _AlunosListPageState createState() => _AlunosListPageState();
}

class _AlunosListPageState extends State<AlunosListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: menu_bar(context),
      appBar: AppBar(
        title: Text('Lista de Alunos'),
      ),
      floatingActionButton: FloatingActionButton(
        //botão de adicionar
        onPressed: () {
          Navigator.push(
            //navigator para ir a tela de adicionar aluno
            context,
            MaterialPageRoute(
                builder: (context) => AlunosInfo(
                      nome: "",
                      cpf: "",
                      endereco: "",
                      matricula: "",
                      titulo: "Adicionando Aluno",
                    )),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[700],
      ),
      body: StreamBuilder<List<Pessoa>>(
          //widget que permite comunicar com data base
          stream: Database().listPessoas("Aluno"),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Loading(); // widget de loading
            }
            List<Pessoa> aluno = snapshot.data; //lista com dados do aluno

            return ListView.builder(
              //Gera automaticamente os items na tela
              itemCount: aluno.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return Dismissible(
                  onDismissed: (direction) {
                    Database().removePessoa(aluno[index].id);
                  },
                  child: ListTile(
                    //define como vai aparecer na tela os items
                    leading: Icon(Icons.person),
                    title: Text(aluno[index].nome),
                    subtitle: Text("CPF: ${aluno[index].cpf}"),
                    onTap: () {
                      Navigator.push(
                          //navigator para ir a tela de editar aluno
                          context,
                          MaterialPageRoute(
                            builder: (context) => AlunosInfo(
                              id: aluno[index].id,
                              nome: aluno[index].nome,
                              cpf: aluno[index].cpf,
                              endereco: aluno[index].endereco,
                              matricula: aluno[index].matricula,
                              titulo: "Editando Aluno",
                            ),
                          ));
                    },
                  ),
                  key: Key(aluno[index].matricula),
                  background: Container(
                    //fundo vermelho com icone de remover
                    color: Colors.red[300],
                    alignment: AlignmentDirectional.centerStart,
                    child: Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.delete),
                          Icon(Icons.delete),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
