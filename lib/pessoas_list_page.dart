import 'package:add_to_app/app_widget.dart';
import 'package:flutter/material.dart';
import 'database.dart';

class Pessoa {
  String func;
  String id;
  String nome;
  String matricula;
  String cpf;
  String endereco;
  Pessoa(
      {this.id, this.nome, this.cpf, this.endereco, this.matricula, this.func});
}

class PessoasListPage extends StatefulWidget {
  @override
  _PessoasListPage createState() => _PessoasListPage();
}

class _PessoasListPage extends State<PessoasListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: menu_bar(context),
      appBar: AppBar(
        title: Text('Lista de Pessoas'),
      ),
      body: StreamBuilder<List<Pessoa>>(
          stream: Database().listPessoas(""),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Loading(); //widget de loading
            }
            List<Pessoa> pessoa = snapshot.data; //obter dados do database

            return ListView.builder(
              //Gera automaticamente os items na tela
              itemCount: pessoa.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return ListTile(
                  //define como vai aparecer na tela os items
                  leading: Icon(Icons.person),
                  trailing: Icon(Icons.expand),
                  title: Text(pessoa[index].nome),
                  subtitle: Text("CPF: ${pessoa[index].cpf}"),
                  onTap: () {
                    isAlertDialogIncorrectFields(
                        context, //alert dialog com as informações
                        "${pessoa[index].func}\nNome: ${pessoa[index].nome}\nCPF: ${pessoa[index].cpf}\nEndereço: ${pessoa[index].endereco}\nMatricula: ${pessoa[index].matricula}\n",
                        Colors.grey[700]);
                  },
                );
              },
            );
          }),
    );
  }
}
