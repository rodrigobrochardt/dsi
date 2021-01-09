import 'package:add_to_app/professor_info_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  CollectionReference professoresCollection =
      FirebaseFirestore.instance.collection('professores');

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
}
