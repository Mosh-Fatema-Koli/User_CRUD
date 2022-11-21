import 'package:get/get.dart';
import 'package:user_crud/api_services.dart';
import 'package:user_crud/logger/logger.dart';
import 'package:user_crud/model/model.dart';

final log = logger(UserController);

class UserController extends GetxController {
  @override
  void onInit() {
    getUserData();
    super.onInit();
  }

// api process
  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late User _userModel;

  User get userModel => _userModel;

  // dashboard process function
  Future<User> getUserData() async {
    _isLoading.value = true;
    update();

    // calling api from api service
    await ApiServices.userApi().then((value) {
      _userModel = value!;
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    update();
    return _userModel;
  }
}
