import 'package:add_to_app/professor_info_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'alunos_info_page.dart';

class Database {
  CollectionReference professoresCollection = FirebaseFirestore.instance
      .collection('professores'); //obter coleção professores

  CollectionReference alunosCollection =
      FirebaseFirestore.instance.collection('alunos'); //obter coleção alunos

  Future createNewProfessor(
      String nome, String cpf, String endereco, String matricula) async {
    return await professoresCollection.add({
      "nome": nome,
      "cpf": cpf,
      "endereco": endereco,
      "matricula": matricula
    });
  }

  Future removeProfessor(id) async {
    await professoresCollection.doc(id).delete();
  }

  Future updateProfessor(
      id, String nome, String cpf, String endereco, String matricula) async {
    await professoresCollection.doc(id).update({
      "nome": nome,
      "cpf": cpf,
      "endereco": endereco,
      "matricula": matricula
    });
  }

  List<Professor> profFromFirestore(QuerySnapshot snapshot) {
    if (snapshot != null) {
      return snapshot.docs.map((e) {
        return Professor(
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

  Stream<List<Professor>> listProfessores() {
    return professoresCollection.snapshots().map((profFromFirestore));
  }

  Future createNewAluno(
      String nome, String cpf, String endereco, String matricula) async {
    return await alunosCollection.add({
      "nome": nome,
      "cpf": cpf,
      "endereco": endereco,
      "matricula": matricula
    });
  }

  Future removeAluno(id) async {
    await alunosCollection.doc(id).delete();
  }

  Future updateAluno(
      id, String nome, String cpf, String endereco, String matricula) async {
    await alunosCollection.doc(id).update({
      "nome": nome,
      "cpf": cpf,
      "endereco": endereco,
      "matricula": matricula
    });
  }

  List<Aluno> alunoFromFirestore(QuerySnapshot snapshot) {
    if (snapshot != null) {
      return snapshot.docs.map((e) {
        return Aluno(
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

  Stream<List<Aluno>> listAlunos() {
    return alunosCollection.snapshots().map((alunoFromFirestore));
  }
}
