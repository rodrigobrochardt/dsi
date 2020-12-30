import 'dart:convert';
import 'package:add_to_app/app_widget.dart';
import 'package:add_to_app/professor_info_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'alunos_info_page.dart';

class Pessoa {
  String nome;
  String matricula;
  String cpf;
  String endereco;
  Pessoa({this.nome, this.cpf, this.endereco, this.matricula});
  Pessoa.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    matricula = json['matricula'];
    cpf = json['cpf'];
    endereco = json['endereco'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> pessoa = new Map<String, dynamic>();
    pessoa['nome'] = this.nome;
    pessoa['matricula'] = this.matricula;
    pessoa['cpf'] = this.cpf;
    pessoa['endereco'] = this.endereco;
    return pessoa;
  }
}

class PessoasListPage extends StatefulWidget {
  var professores = new List<Professor>(); //lista com objetos professor
  var alunos = new List<Aluno>(); //lista com objetos aluno
  var pessoas = new List<Pessoa>(); // lista com objetos pessoa e seus atributos
  PessoasListPage() {
    // inicia as listas
    professores = [];
    alunos = [];
    pessoas = [];
  }

  @override
  _PessoasListPage createState() => _PessoasListPage();
}

class _PessoasListPage extends State<PessoasListPage> {
  _PessoasListPage() {
    loadPessoas(); //chama a função quando iniciar a tela
  }

  Future loadPessoas() async {
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('prof');
    var data2 = prefs.getString('aluno');
    if (data != null) {
      Iterable decoded = jsonDecode(data); //pega as informações
      List<Professor> result = decoded
          .map((x) => Professor.fromJson(x))
          .toList(); //mapeia no objeto professor
      setState(() {
        widget.professores = result; // guarda na lista
      });
    }
    if (data2 != null) {
      Iterable decoded = jsonDecode(data2); //pega as informações
      List<Aluno> result2 = decoded
          .map((x) => Aluno.fromJson(x))
          .toList(); //mapeia no objeto aluno e guarda na lista
      setState(() {
        widget.alunos += result2; // guarda na lista
      });
    }
    setState(() {
      for (var i = 0; i < widget.professores.length; i++) {
        widget.pessoas.add(
          // adiciona os objetos na lista Pessoa
          Pessoa(
            nome: widget.professores[i].nome,
            cpf: widget.professores[i].cpf,
            endereco: widget.professores[i].endereco,
            matricula: widget.professores[i].matricula,
          ),
        );
      }
      for (var i = 0; i < widget.alunos.length; i++) {
        widget.pessoas.add(
          // adiciona os objetos na lista Pessoa
          Pessoa(
            nome: widget.alunos[i].nome,
            cpf: widget.alunos[i].cpf,
            endereco: widget.alunos[i].endereco,
            matricula: widget.alunos[i].matricula,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: menu_bar(context),
      appBar: AppBar(
        title: Text('Lista de Pessoas'),
      ),
      body: ListView.builder(
        //Gera automaticamente os items na tela
        itemCount: widget.pessoas.length,
        itemBuilder: (BuildContext ctxt, int index) {
          final pessoas = widget.pessoas[index]; // busca as pessoas na lista
          return ListTile(
            //define como vai aparecer na tela os items
            leading: Icon(Icons.person),
            title: Text(pessoas.nome),
            subtitle: Text("CPF: ${pessoas.cpf}"),
            onTap: () {
              isAlertDialogIncorrectFields(
                  context, //alert dialog com as informações
                  "Nome: ${pessoas.nome}\nCPF: ${pessoas.cpf}\nEndereço: ${pessoas.endereco}\nMatricula: ${pessoas.matricula}\n",
                  Colors.grey[700]);
            },
          );
        },
      ),
    );
  }
}
