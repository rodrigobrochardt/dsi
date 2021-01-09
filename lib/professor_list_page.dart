import 'package:add_to_app/app_widget.dart';
import 'package:add_to_app/professor_info_page.dart';
import 'package:add_to_app/database.dart';
import 'package:flutter/material.dart';

class ProfessoresListPage extends StatefulWidget {
  @override
  _ProfessoresListPage createState() => _ProfessoresListPage();
}

class _ProfessoresListPage extends State<ProfessoresListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: menu_bar(context),
      appBar: AppBar(
        title: Text('Lista de Professores'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProfessoresInfo(
                      nome: "",
                      cpf: "",
                      endereco: "",
                      matricula: "",
                      titulo: "Adicionando Professor",
                    )),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[700],
      ),
      body: StreamBuilder<List<Professor>>(
          stream: Database().listProfessores(),
          builder: (
            context,
            snapshot,
          ) {
            print(snapshot.data);
            if (!snapshot.hasData) {
              return Loading();
            }

            List<Professor> professor = snapshot.data;
            return ListView.builder(
              //Gera automaticamente os items na tela
              itemCount: professor.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return Dismissible(
                  onDismissed: (direction) {
                    Database().removeProfessor(professor[index].id);
                  },
                  child: ListTile(
                      //define como vai aparecer na tela os items
                      leading: Icon(Icons.person),
                      title: Text(professor[index].nome),
                      subtitle: Text("CPF: ${professor[index].cpf}"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfessoresInfo(
                                id: professor[index].id,
                                nome: professor[index].nome,
                                cpf: professor[index].cpf,
                                endereco: professor[index].endereco,
                                matricula: professor[index].matricula,
                                titulo: "Editando Professor",
                              ),
                            ));
                      }),
                  key: Key(professor[index].cpf),
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
