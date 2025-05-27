import 'package:get/get.dart';
import 'package:homefood/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appbaseUrl;
  late SharedPreferences sharedPreferences;
  late Map<String, String> _mainheaders;

  ApiClient({required this.appbaseUrl, required this.sharedPreferences}) {
    baseUrl = appbaseUrl;
    timeout = const Duration(seconds: 30);
    // token = AppConstants.TOKEN;
    // token = sharedPreferences.getString(AppConstants.TOKEN)!;
    token = sharedPreferences.getString(AppConstants.TOKEN) ?? '';
    _mainheaders = {
      'content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  void updateHeader(String token) {
    _mainheaders = {
      'content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> getData(String uri, {Map<String, String>? headers}) async {
    try {
      Response response = await get(uri, headers: headers ?? _mainheaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body) async {
    print(body.toString());
    try {
      Response response = await post(uri, body, headers: _mainheaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
