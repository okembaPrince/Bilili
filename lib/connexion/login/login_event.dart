part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class SendData extends LoginEvent{
  final String mail;
  final String password;
  SendData(this.mail,this.password);
}