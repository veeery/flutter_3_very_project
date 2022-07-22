import 'package:flutter/cupertino.dart';
import 'package:flutter_3_very_project/routes/auth/user_controller.dart';
import 'package:get/get.dart' hide Response;

class LoginController extends GetxController {

  TextEditingController emailText = TextEditingController(text: "");
  TextEditingController passwordText = TextEditingController(text: "");

  bool showPassword = true;

  @override
  void onInit() {

    super.onInit();
  }

  void togglePassword() {
    showPassword =! showPassword;
    update();
  }

  Future<void> login({required String email, required String password}) async {
    await UserController.me.login(
        email: email,
        password: password);
  }

}