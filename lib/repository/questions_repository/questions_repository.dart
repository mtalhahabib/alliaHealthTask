import 'dart:ui';

import 'package:allia/data/network/network_api_services.dart';
import 'package:allia/models/questions/questions_model.dart';

class QuestionsRepository {
  final _apiService = NetworkApiServices();

  Future<QuestionsModel> questionsApi(url,accessToken) async {
    try {
      dynamic response = await _apiService.getApi(url.value,accessToken);

      return QuestionsModel.fromJson(response);
    } catch (e) {
      print('errorrrrrrrrrrrrrrrrrrrrrr');
      print(e);
      throw e;
    }
  }
}
