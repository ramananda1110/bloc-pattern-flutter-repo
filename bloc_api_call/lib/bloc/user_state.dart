import 'package:bloc_api_call/model/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {}

class UserInit extends UserState {
  @override
  List<Object> get props => [];
}


class UserLoading extends UserState {
  @override
  List<Object?> get props => [];
}

class UserDataLoaded extends UserState {
  List<UserModel> userList;

  UserDataLoaded({required this.userList});

  @override
  List<Object?> get props => [userList];
}

class UserError extends UserState {
  String message;

  UserError({required this.message});

  @override
  List<Object?> get props => [message];
}