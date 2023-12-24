import 'package:bloc_api_call/bloc/user_event.dart';
import 'package:bloc_api_call/bloc/user_state.dart';
import 'package:bloc_api_call/model/user_model.dart';
import 'package:bloc_api_call/service/api_service.dart';
import 'package:bloc/bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {

  List<UserModel> userList = [];

  UserBloc() : super(UserInit()) {

    ApiService _apiService = ApiService();

    on<GetAllUsersList>((event, state) async {

      try{

        emit(UserLoading());

        userList = await _apiService.getData();

        emit(UserDataLoaded(userList: userList));


      } catch(e) {
        emit(UserError(message: e.toString()));
      }
    });
  }
}
