import 'package:flutter/material.dart';
import 'package:flutter_3_very_project/routes/auth/login/login_controller.dart';
import 'package:flutter_3_very_project/utils/app_icons.dart';
import 'package:flutter_3_very_project/utils/app_text_style.dart';
import 'package:flutter_3_very_project/widgets/app_button.dart';
import 'package:flutter_3_very_project/widgets/app_textfield_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    bool isKeyboardAppears = MediaQuery.of(context).viewInsets.bottom > 0.0;
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            width: 1.sw,
            height: 1.sh,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 0.1.sw),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: isKeyboardAppears ? MainAxisAlignment.start : MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                          width: isKeyboardAppears ? 0.1.sw : 0.5.sw,
                          height: isKeyboardAppears ? 0.1.sh : 0.3.sh,
                          duration: Duration(milliseconds: 550),
                          child: Image.asset(AppIcons.appLogo)
                      ),
                      Center(
                        child: AnimatedContainer(
                            width: isKeyboardAppears ? 0.7.sw : 0.0.sw,
                            height: isKeyboardAppears ? 0.1.sh : 0.0.sh,
                            duration: Duration(milliseconds: 550),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'V Project',
                                maxLines: 1,
                                style: AppTextStyle.headerLogoAppNameText,
                              ),
                            )),
                      ),
                    ],
                  ),
                  GetBuilder<LoginController>(builder: (_) {
                    return Column(
                      children: [
                        AppTextFieldForm(
                          controller: controller.emailText,
                          labelStyle: AppTextStyle.mediumBlackText,
                          labelText: "Email",
                          hintText: "Masukkan Email",
                        ),
                        SizedBox(height: 0.04.sh),
                        AppTextFieldForm(
                          controller: controller.passwordText,
                          labelStyle: AppTextStyle.mediumBlackText,
                          isPassword: controller.showPassword,
                          labelText: "Password",
                          hintText: "Masukkan Password",
                          suffixIcon: GestureDetector(
                            onTap: () => controller.togglePassword(),
                            child: controller.showPassword
                                ? Icon(Icons.visibility_off,
                                    color: Colors.black54)
                                : Icon(Icons.visibility,
                                    color: Colors.black54),
                          ),
                          isLastField: true,
                        ),
                        SizedBox(height: 0.04.sh),
                        AppButton(
                            buttonName: "Login",
                            onTap: () {
                              controller.login(
                                email: controller.emailText.text,
                                password: controller.passwordText.text
                              );
                            }),
                      ],
                    );
                  }),
                  SizedBox(height: 0.12.sh),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Dont Have Account? ', style: AppTextStyle.mediumBlackText),
                      GestureDetector(
                        onTap: () {},
                        child: Text("SignUp", style: AppTextStyle.mediumBlueText),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
