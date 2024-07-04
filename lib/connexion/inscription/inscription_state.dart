part of 'inscription_bloc.dart';

@immutable
abstract class InscriptionState {}

class InscriptionInitial extends InscriptionState {}

class InscriptionLoading extends InscriptionState{}

class InscriptionLoaded extends InscriptionState{
  final InscriptionModel data;
  InscriptionLoaded(this.data);
}

class InscriptionError extends InscriptionState{}
