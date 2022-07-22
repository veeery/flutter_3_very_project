import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_3_very_project/utils/app_size.dart';
import 'package:flutter_3_very_project/utils/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFieldForm extends StatelessWidget {

  TextEditingController controller;

  String hintText;
  String labelText;
  String? errorText;
  TextStyle? hintStyle;
  TextStyle? labelStyle;
  TextStyle? errorStyle;
  Widget? suffixIcon;
  Widget? prefixIcon;

  bool isEnabled;
  bool isPassword;
  bool isExtraCurve;
  bool isMultiLine;
  bool isLastField;
  bool isPhoneNumber;
  bool isEmail;
  bool isCapitalize;

  AppTextFieldForm({
    required this.controller,
    this.hintText = "",
    this.labelText = "",
    this.errorText,
    this.hintStyle,
    this.labelStyle,
    this.errorStyle,
    this.suffixIcon,
    this.prefixIcon,
    this.isPhoneNumber = false,
    this.isEmail = false,
    this.isEnabled = true,
    this.isExtraCurve = false,
    this.isPassword = false,
    this.isLastField = false,
    this.isMultiLine = false,
    this.isCapitalize = false
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      minLines: isMultiLine ? 5 : 1,
      maxLines: isMultiLine ? 5 : 1,
      autofocus: false,
      keyboardType: isMultiLine
          ? TextInputType.multiline
          : isEmail
              ? TextInputType.emailAddress
              : isPhoneNumber
                  ? TextInputType.phone
                  : TextInputType.visiblePassword,
      style: AppTextStyle.mediumBlackText,
      textCapitalization: isCapitalize ? TextCapitalization.sentences : TextCapitalization.none,
      inputFormatters: isPhoneNumber ? [FilteringTextInputFormatter.digitsOnly] : [],
      textInputAction: isMultiLine
          ? TextInputAction.newline
          : isLastField
              ? TextInputAction.done
              : TextInputAction.next,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                isExtraCurve ? CurveSize.extraCurve : CurveSize.largeCurve),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.only(
            left: 0.04.sw,
            right: suffixIcon == null ? 0.04.sw: 0.w,
            top: 0.03.sh,
            bottom: 0.03.sh
          ),
          enabled: isEnabled,
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          fillColor: Colors.grey[300],
          labelText: labelText,
          labelStyle: labelStyle ?? AppTextStyle.mediumHintText,
          hintText: hintText,
          hintStyle: hintStyle ?? AppTextStyle.mediumHintText,
          errorText: errorText,
          errorStyle: errorStyle ?? AppTextStyle.mediumRedText),
    );
  }
}
