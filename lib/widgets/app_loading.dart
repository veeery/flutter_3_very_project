import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLoading extends StatelessWidget {

  bool isListLoading;

  AppLoading({
    this.isListLoading = false
});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isListLoading ? 0.1.sw : 1.sw,
      height: isListLoading ? 0.1.sh : 1.sh,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
