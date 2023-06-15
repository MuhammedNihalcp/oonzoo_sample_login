import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sample_login/screens/home/view/home_view.dart';
import 'package:sample_login/screens/login_screen/view/login_view.dart';

class SplashController extends ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? onboardValue;
  String? signinCheck;

  void splahTimer(context) {
    Timer(const Duration(seconds: 3), () async {
      onboardValue = await storage.read(key: 'onboard');
      signinCheck = await storage.read(key: 'token');
      if (signinCheck != null) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) {
              return const ScreenHome();
            },
          ),
          (route) => false,
        );
      } else {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) {
              return ScreenLogin();
            },
          ),
          (route) => false,
        );
      }
    });
  }
}
