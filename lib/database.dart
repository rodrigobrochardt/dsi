import 'package:add_to_app/pessoas_list_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  CollectionReference pessoasCollection =
      FirebaseFirestore.instance.collection('pessoas'); //obter coleção alunos

  Future createNewPessoa(
      //função para adicionar informação a coleção no data base
      String func,
      String nome,
      String cpf,
      String endereco,
      String matricula) async {
    return await pessoasCollection.add({
      "função": func,
      "nome": nome,
      "cpf": cpf,
      "endereco": endereco,
      "matricula": matricula
    });
  }

  Future removePessoa(id) async {
    //função para remover no data base
    await pessoasCollection.doc(id).delete();
  }

  Future updatePessoa(
      //função para atualizar informações no database
      id,
      String nome,
      String cpf,
      String endereco,
      String matricula) async {
    await pessoasCollection.doc(id).update({
      "nome": nome,
      "cpf": cpf,
      "endereco": endereco,
      "matricula": matricula
    });
  }

  List<Pessoa> pessoaFromFirestore(QuerySnapshot snapshot) {
    //mapeia as informações do database em um objeto
    if (snapshot != null) {
      return snapshot.docs.map((e) {
        return Pessoa(
          func: e.data()["função"],
          id: e.id,
          nome: e.data()["nome"],
          cpf: e.data()["cpf"],
          endereco: e.data()["endereco"],
          matricula: e.data()["matricula"],
        );
      }).toList();
    } else {
      return null;
    }
  }

  Stream<List<Pessoa>> listPessoas(func) {
    //retorna uma lista de objeto professor
    if (func != "") {
      //verifica se esta listando por função especifica (aluno ou professor)
      return pessoasCollection
          .where("função", isEqualTo: func)
          .snapshots()
          .map(pessoaFromFirestore);
    } else {
      return pessoasCollection.snapshots().map(pessoaFromFirestore);
    }
  }
}
