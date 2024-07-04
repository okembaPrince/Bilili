part of 'inscription_bloc.dart';

@immutable
abstract class InscriptionEvent {}

class SendData extends InscriptionEvent{
  final String nom;
  final String prenom;
  final String mail;
  final String password;
  SendData(this.nom, this.prenom,this.mail,this.password);
}
