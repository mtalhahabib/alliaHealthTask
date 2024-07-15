import 'package:allia/data/response/status.dart';
import 'package:allia/models/login/login_model.dart';
import 'package:allia/models/questions/questions_model.dart';
import 'package:allia/repository/questions_repository/questions_repository.dart';
import 'package:allia/viewModels/login_viewModel.dart';
import 'package:get/get.dart';

class QuestionsViewmodel extends GetxController {
  var accessToken = ''.obs;
  var questionsUrl = 'https://api-dev.allia.health/api/client/self-report/question'.obs;
  
var index=0.obs;
  final loginController = Get.put(LoginViewModel());
  @override
  void onInit() {
    super.onInit();
    setUrl();
  }

  setUrl() async {
    await loginController.loginApi();
     accessToken.value= loginController.loginData.value.body?.accessToken ?? '';
   
    questionsApi();
  }

  final _api = QuestionsRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final questions = QuestionsModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setQuestions(QuestionsModel _value) => questions.value = _value;
  void setError(String _value) => error.value = _value;

  void questionsApi() {
    //  setRxRequestStatus(Status.LOADING);
    print(questionsUrl);
    print(accessToken.value);
    _api.questionsApi(questionsUrl,accessToken.value).then((value) {
      setRxRequestStatus(Status.COMPLETED);

      print(value);
      setQuestions(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
