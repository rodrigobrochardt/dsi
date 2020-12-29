import 'dart:convert';

import 'package:add_to_app/alunos_info_page.dart';
import 'package:add_to_app/app_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class AlunosListPage extends StatefulWidget {
  var alunos = new List<Aluno>(); //instancia o objeto aluno

  AlunosListPage() {
    alunos = [];
    // alunos.add(Aluno(
    //     nome: "Rodrigo",
    //     cpf: "123",
    //     endereco: "Rua blablabla",
    //     matricula: "321"));
  }

  @override
  _AlunosListPageState createState() => _AlunosListPageState();
}

class _AlunosListPageState extends State<AlunosListPage> {
  _AlunosListPageState() {
    loadAluno(); //chama a função quando iniciar a tela
  }
  void addAluno() async {
    // função que sincroniza com a pagina de adicionar/editar e altera o objeto na lista
    final List result = await Navigator.push(
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
    if (result != null) {
      setState(() {
        widget.alunos.add(Aluno(
            nome: result[0],
            cpf: result[1],
            endereco: result[2],
            matricula: result[3]));
        saveAluno();
      });
    }
  }

  void editAluno(int index) async {
    // função que sincroniza com a pagina de adicionar/editar e altera o objeto na lista
    final List result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AlunosInfo(
                nome: widget.alunos[index].nome,
                cpf: widget.alunos[index].cpf,
                endereco: widget.alunos[index].endereco,
                matricula: widget.alunos[index].matricula,
                titulo: "Editando Aluno",
              )),
    );
    if (result != null) {
      setState(() {
        // atualiza a tela
        widget.alunos[index].nome = result[0];
        widget.alunos[index].cpf = result[1];
        widget.alunos[index].endereco = result[2];
        widget.alunos[index].matricula = result[3];
        saveAluno(); //salva nas preferences
      });
    }
  }

  void removeAluno(int index) {
    //Remove o objeto da lista
    setState(() {
      widget.alunos.removeAt(index);
      saveAluno();
    });
  }

  Future loadAluno() async {
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('data');
    if (data != null) {
      Iterable decoded = jsonDecode(data); //pega as informações
      List<Aluno> result = decoded
          .map((x) => Aluno.fromJson(x))
          .toList(); //mapeia no objeto aluno
      setState(() {
        widget.alunos = result; // atualiza no widget
      });
    }
  }

  void saveAluno() async {
    var prefs = await SharedPreferences
        .getInstance(); //espera obter instancia do preferences
    await prefs.setString('data',
        jsonEncode(widget.alunos)); //seta os dados para json com chave data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: menu_bar(context),
      appBar: AppBar(
        title: Text('Lista de Alunos'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addAluno();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[700],
      ),
      body: ListView.builder(
        //Gera automaticamente os items na tela
        itemCount: widget.alunos.length,
        itemBuilder: (BuildContext ctxt, int index) {
          final aluno = widget.alunos[index]; // busca o aluno na lista
          return Dismissible(
            onDismissed: (direction) {
              removeAluno(index);
            },
            child: ListTile(
              //define como vai aparecer na tela os items
              leading: Icon(Icons.person),
              title: Text(aluno.nome),
              subtitle: Text("CPF: ${aluno.cpf}"),
              onTap: () {
                editAluno(index);
              },
            ),
            key: Key(aluno.matricula),
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
