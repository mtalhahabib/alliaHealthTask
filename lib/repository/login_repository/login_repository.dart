import 'dart:ui';

import 'package:allia/data/network/network_api_services.dart';

class LoginRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> loginApi(var data, loginUrl) async {
    dynamic response = await _apiService.postApi(data, loginUrl);
    return response;
  }
}
