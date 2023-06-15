import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_login/screens/login_screen/controller/login_controller.dart';
import 'package:sample_login/screens/splash_screen/controller/splash_controller.dart';

import 'package:sample_login/screens/splash_screen/view/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginController()),
        ChangeNotifierProvider(create: (context) => SplashController())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ScreenSplash(),
      ),
    );
  }
}
