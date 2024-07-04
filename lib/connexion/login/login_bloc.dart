import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'model.dart';
import'repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _repository;
  late LoginModel data;

  LoginBloc(this._repository) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is SendData){
        emit(LoginLoading());
        await Future.delayed(const Duration(seconds: 3), () async {
          data = await _repository.fetchDetails(event.mail,event.password);
          emit(LoginLoaded(data));
        });
      }

    });
  }
}
