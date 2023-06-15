import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_login/screens/login_screen/controller/login_controller.dart';

// ignore: must_be_immutable
class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Consumer<LoginController>(builder: (context, data, child) {
                  return TextFormField(
                    controller: data.username,
                    validator: (value) => data.usernameValidation(value),
                    decoration: const InputDecoration(
                      hintText: 'username',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                }),
                const SizedBox(
                  height: 20,
                ),
                Consumer<LoginController>(builder: (context, data, child) {
                  return TextFormField(
                    controller: data.password,
                    obscureText: data.obscureText,
                    validator: (value) => data.passwordValdation(value),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          data.visibility();
                        },
                        icon: data.icon,
                      ),
                      hintText: 'password',
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                }),
                const SizedBox(
                  height: 20,
                ),
                Consumer<LoginController>(builder: (context, data, child) {
                  return ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        data.signIn(context);
                      }
                    },
                    child: data.isLoading
                        ? const CircularProgressIndicator()
                        : const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
