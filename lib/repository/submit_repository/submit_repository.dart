import 'package:allia/data/network/network_api_services.dart';

class SubmitRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> submitApi(var data, submitUrl, accessToken) async {
    dynamic response =
        await _apiService.submitApi(data, submitUrl, accessToken);
    
    return response;
  }
}
