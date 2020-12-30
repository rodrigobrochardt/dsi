import 'dart:convert';

import 'package:add_to_app/app_widget.dart';
import 'package:add_to_app/professor_info_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class ProfessoresListPage extends StatefulWidget {
  var professores = new List<Professor>(); //instancia o objeto professor

  ProfessoresListPage() {
    professores = [];
  }

  @override
  _ProfessoresListPage createState() => _ProfessoresListPage();
}

class _ProfessoresListPage extends State<ProfessoresListPage> {
  _ProfessoresListPage() {
    loadProfessor(); //chama a função quando iniciar a tela
  }
  void addProfessor() async {
    // função que sincroniza com a pagina de adicionar/editar e altera o objeto na lista
    final List result = await Navigator.push(
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
    if (result != null) {
      setState(() {
        widget.professores.add(Professor(
            nome: result[0],
            cpf: result[1],
            endereco: result[2],
            matricula: result[3]));
        saveProfessor();
      });
    }
  }

  void editProfessor(int index) async {
    // função que sincroniza com a pagina de adicionar/editar e altera o objeto na lista
    final List result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ProfessoresInfo(
                nome: widget.professores[index].nome,
                cpf: widget.professores[index].cpf,
                endereco: widget.professores[index].endereco,
                matricula: widget.professores[index].matricula,
                titulo: "Editando Professor",
              )),
    );
    if (result != null) {
      setState(() {
        // atualiza a tela
        widget.professores[index].nome = result[0];
        widget.professores[index].cpf = result[1];
        widget.professores[index].endereco = result[2];
        widget.professores[index].matricula = result[3];
        saveProfessor(); //salva nas preferences
      });
    }
  }

  void removeProfessor(int index) {
    //Remove o objeto da lista
    setState(() {
      widget.professores.removeAt(index);
      saveProfessor();
    });
  }

  Future loadProfessor() async {
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('prof');
    if (data != null) {
      Iterable decoded = jsonDecode(data); //pega as informações
      List<Professor> result = decoded
          .map((x) => Professor.fromJson(x))
          .toList(); //mapeia no objeto professor
      setState(() {
        widget.professores = result; // atualiza no widget
      });
    }
  }

  void saveProfessor() async {
    var prefs = await SharedPreferences
        .getInstance(); //espera obter instancia do preferences
    await prefs.setString(
        'prof',
        jsonEncode(
            widget.professores)); //seta os dados para json com chave prof
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: menu_bar(context),
      appBar: AppBar(
        title: Text('Lista de Professores'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addProfessor();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[700],
      ),
      body: ListView.builder(
        //Gera automaticamente os items na tela
        itemCount: widget.professores.length,
        itemBuilder: (BuildContext ctxt, int index) {
          final professor =
              widget.professores[index]; // busca o professor na lista
          return Dismissible(
            onDismissed: (direction) {
              removeProfessor(index);
            },
            child: ListTile(
              //define como vai aparecer na tela os items
              leading: Icon(Icons.person),
              title: Text(professor.nome),
              subtitle: Text("CPF: ${professor.cpf}"),
              onTap: () {
                editProfessor(index);
              },
            ),
            key: Key(professor.matricula),
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
      ),
    );
  }
}
