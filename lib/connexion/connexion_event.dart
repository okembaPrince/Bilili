
import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';



@immutable
abstract class UserEvent extends Equatable {
   UserEventent();
}

class LoadUserEvent extends UserEvent{
  @override
  UserEventent() {
    // TODO: implement UserEventent
    throw UnimplementedError();
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];

}

