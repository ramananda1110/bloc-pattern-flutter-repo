import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {

}

class GetAllUsersList extends UserEvent {

  @override
  List<Object> get props => [];
  
 }