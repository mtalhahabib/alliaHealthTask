
abstract class BaseApiServices {

  Future<dynamic> getApi(String url, String accessToken) ;


  Future<dynamic> postApi(dynamic data, String url,) ;
  
  Future<dynamic> submitApi(dynamic data, String url,accessToken) ;
}