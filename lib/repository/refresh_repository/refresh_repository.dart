import 'package:allia/data/network/network_api_services.dart';

class RefreshRepository {

  final _apiService  = NetworkApiServices() ;


  Future<dynamic> loginApi(var data,refreshUrl) async{
    dynamic response = await _apiService.postApi(data, refreshUrl);
    return response ;
  }



}