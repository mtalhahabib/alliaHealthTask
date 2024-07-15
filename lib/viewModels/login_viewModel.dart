import 'package:allia/data/response/status.dart';
import 'package:allia/models/login/login_model.dart';
import 'package:allia/repository/login_repository/login_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  
  final _api = LoginRepository();
  final loginUrl = 'https://api-dev.allia.health/api/client/auth/login';
  final loginData = LoginModel().obs;
  RxBool loading = false.obs;

  final rxRequestStatus = Status.LOADING.obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setLoginData(LoginModel _value) => loginData.value = _value;
  void setError(String _value) => error.value = _value;

  Future<void> loginApi() async {
    loading.value = true;
    Map data = {'email': "dev@alliauk.com", 'password': "12345678"};

    try {
      var value = await _api.loginApi(data, loginUrl);
    loading.value = false;

    if (value['error'] == 'user not found') {
      Get.snackbar('Login', value['error']);
    } else {
      setRxRequestStatus(Status.COMPLETED);

      try {
       setLoginData(LoginModel.fromJson(value));
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    } catch (e) {
      loading.value = false;
      setError(e.toString());
      setRxRequestStatus(Status.ERROR);
    } 
  }
}
