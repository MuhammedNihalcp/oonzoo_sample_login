import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sample_login/screens/home/view/home_view.dart';
import 'package:sample_login/screens/login_screen/model/login_model.dart';
import 'package:sample_login/screens/login_screen/service/login_service.dart';

class LoginController extends ChangeNotifier {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  FlutterSecureStorage storage = const FlutterSecureStorage();

  bool isLoading = false;

  void signIn(BuildContext context) {
    isLoading = true;
    notifyListeners();
    LoginModel loginModel = LoginModel(
      username: username.text.trim(),
      password: password.text.trim(),
    );
    LoginService().loginUser(loginModel).then((value) {
      if (value != null) {
        storage.write(key: 'token', value: value.token);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (ctx) => const ScreenHome()),
            (route) => false);

        disponseTextfield();
      } else {
        return null;
      }
    });
    isLoading = false;
    notifyListeners();
  }

  void disponseTextfield() {
    username.clear();
    password.clear();
  }

  bool obscureText = true;
  Icon icon = const Icon(
    Icons.visibility_off,
    color: Colors.black,
  );

  void visibility() {
    if (obscureText == false) {
      icon = const Icon(
        Icons.visibility_off,
        color: Colors.black,
      );
      obscureText = true;
      notifyListeners();
    } else {
      icon = const Icon(
        Icons.visibility,
        color: Colors.black,
      );
      obscureText = false;
      notifyListeners();
    }
  }

  String? passwordValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 7) {
      return 'Password must have atleast 7 character';
    } else if (value.length > 7) {
      return 'Password exceeds 7 character';
    }
    return null;
  }

  String? usernameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the username';
    } else if (value.length < 2) {
      return 'Too short username';
    } else {
      return null;
    }
  }
}
