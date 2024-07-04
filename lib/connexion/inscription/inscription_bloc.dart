import 'dart:async';

import 'package:bilili/connexion/inscription/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';



import 'model.dart';

part 'inscription_event.dart';
part 'inscription_state.dart';

class InscriptionBloc extends Bloc<InscriptionEvent, InscriptionState> {
  final InscriptionRepository _repository;
  late InscriptionModel data;

  InscriptionBloc(this._repository) : super(InscriptionInitial()) {
    on<InscriptionEvent>((event, emit) async {

      if (event is SendData){
        emit(InscriptionLoading());
        await Future.delayed(const Duration(seconds: 2), () async {
          data = await _repository.fetchDetails(event.nom, event.prenom,event.mail,event.password);
          emit(InscriptionLoaded(data));
        });
      }


    });
  }
}
