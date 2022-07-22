import 'package:flutter/material.dart';
import 'package:flutter_3_very_project/utils/app_colors.dart';
import 'package:flutter_3_very_project/utils/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppButton extends StatelessWidget {

  String? buttonName;
  TextStyle? textStyle;
  Function() onTap;

  AppButton({
    required this.onTap,
    this.buttonName,
    this.textStyle
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        FocusManager.instance.primaryFocus?.unfocus();
        onTap();
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.r)),
      splashColor: AppColor.shadowColor,
      elevation: 20.r,
      color: AppColor.ascentColor,
      minWidth: 0.4.sw,
      height: 0.08.sh,
      child: Text(buttonName ?? "This Button No Title",
          style: textStyle ?? AppTextStyle.buttonLargeBlackText),
    );
  }

  Future<void> execute() async{
    if (Get.isDialogOpen!) Get.back();
  }

}


