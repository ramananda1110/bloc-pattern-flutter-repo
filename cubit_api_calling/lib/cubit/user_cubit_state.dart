import 'package:cubit_api_calling/model/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserCubitState extends Equatable {
  const UserCubitState();
}

class UserCubitInit extends UserCubitState {
  @override
  List<Object?> get props => [];
}

class UserCubitLoading extends UserCubitState {
  @override
  List<Object?> get props => [];
}

class UserCubitDataLoaded extends UserCubitState {
  List<UserModel> userList;

  UserCubitDataLoaded({required this.userList});

  @override
  List<Object?> get props => [userList];
}

class UserCubitError extends UserCubitState {
  String message;

  UserCubitError({required this.message});

  @override
  List<Object?> get props => [message];
}
