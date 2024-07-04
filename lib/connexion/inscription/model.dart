
import 'dart:convert';

class InscriptionModel{
  final String mail;
  final String nom;
  final String prenom;
  final String password;
  InscriptionModel(
      this.mail,
      this.nom,
      this.prenom,
      this.password,
      );
  InscriptionModel copyWith({
    String? mail,
    String? nom,
    String? prenom,
    String? password,
  }){
    return InscriptionModel(
        mail ?? this.mail,
        nom ?? this.nom,
        prenom ?? this.prenom,
        password ?? this.password);
  }

  Map<String, dynamic> toMap(){
    return {
      'nom': nom,
      'prenom': prenom,
      'mail': mail,
      'password': password
    };
  }

  factory InscriptionModel.fromMap(Map<String, dynamic> map){
    return InscriptionModel(
      map['nom'] ?? '',
      map['prenom'] ?? '',
      map['mail'] ?? '',
      map['password'] ?? '',
    );
  }

  String toJson()=> json.encode(toMap());
  factory InscriptionModel.fromJson(String source)=> InscriptionModel.fromMap(json.decode(source));

  @override
  String toString(){
    return 'RegisterModel(name: $nom, job: $prenom, id: $mail, createdAt: $password)';
  }

  @override
  bool operator ==(Object other){
    if (identical(this, other)) return true;

    return other is InscriptionModel &&
        other.nom == nom &&
        other.prenom == prenom &&
        other.mail == mail &&
        other.password == password;
  }

  @override
  int get hashCode{
    return nom.hashCode ^ prenom.hashCode ^ mail.hashCode ^ password.hashCode;
  }
}