import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sample_login/screens/login_screen/model/login_model.dart';
import 'package:sample_login/screens/login_screen/model/login_token.dart';

class LoginService {
  Dio dio = Dio();
  String url = 'https://dummyjson.com/auth/login';
  Future<TokenModel?> loginUser(LoginModel model) async {
    try {
      final response = await dio.post(url,
          data: jsonEncode(
            model.toJson(),
          ));

      log(response.statusCode.toString(), name: 'login statusCode');
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        return TokenModel.fromJson(response.data);
      }
    } on DioException catch (error) {
      log(error.message.toString(), name: 'login error');
    }

    return null;
  }
}
