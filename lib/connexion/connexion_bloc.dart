

import 'package:bilili/connexion/repositories.dart';
import 'package:bloc/bloc.dart';



import 'connexion_event.dart';
import 'connexion_state.dart';




class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc(this._userRepository) : super(UserLoadingState()) {
    on<UserEvent>((event, emit) async {
      emit(UserLoadingState());

      try{
       final users= await _userRepository.getUsers() ;
       emit(UserLoadedState(users));

      } catch (e){
        emit(UserErrorState(e.toString()));
      }

    });
  }
}
