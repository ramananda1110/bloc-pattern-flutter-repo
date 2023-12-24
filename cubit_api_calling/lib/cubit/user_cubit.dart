import 'package:bloc/bloc.dart';
import 'package:cubit_api_calling/cubit/user_cubit_state.dart';
import 'package:cubit_api_calling/model/user_model.dart';
import 'package:cubit_api_calling/service/api_service.dart';

class UserCubit extends Cubit<UserCubitState> {
  List<UserModel> userList = [];

  ApiService apiService;

  UserCubit({required this.apiService}) : super(UserCubitInit());

  void getAllUserList() async {
    try {
      emit(UserCubitLoading());
      userList = await apiService.getData();

      emit(UserCubitDataLoaded(userList: userList));
    } catch (e) {
      emit(UserCubitError(message: e.toString()));
    }
  }
}
