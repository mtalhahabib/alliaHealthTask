import 'dart:convert';

import 'package:allia/models/login/login_model.dart';
import 'package:allia/repository/login_repository/login_repository.dart';
import 'package:allia/repository/submit_repository/submit_repository.dart';
import 'package:allia/viewModels/login_viewModel.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SubmitViewModel extends GetxController {
  RxString accessToken = ''.obs;
  var submitUrl =
      'https://api-dev.allia.health/api/client/self-report/answer'.obs;
  var answers = [].obs;
  var selectedOption = 100.obs;
  var isloading = true.obs;

  final loginController = Get.put(LoginViewModel());
  @override
  void onInit() {
    super.onInit();

    accessToken.value = loginController.loginData.value.body?.accessToken ?? '';
  }

  simulateLoading() async {
    // Simulate a delay for 2 seconds

    await submitApi();
    isloading.value = false;
  }

  final _api = SubmitRepository();

  RxBool loading = false.obs;
  Future<void> submitApi() async {
    loading.value = true;
    Map<String, dynamic> data = {
      'answers': answers.value,
    };

    print(json.encode(data).runtimeType);

    try {
      var value =
          await _api.submitApi(json.encode(data), submitUrl.value, accessToken);
      Get.snackbar("Submitted", "Your Resoponse has been submitted");
    } catch (e) {
      debugPrint(e.toString());
    }

    loading.value = false;
  }
}
