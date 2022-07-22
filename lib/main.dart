import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_3_very_project/routes/app_routes.dart';
import 'package:flutter_3_very_project/routes/auth/user_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:get/get.dart';

void main() {
  systemUIOverlay();
  Get.put(UserController());
  runApp( MyApp());
}

void systemUIOverlay() {
  WidgetsFlutterBinding.ensureInitialized();

  initialization(null);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black,
    systemNavigationBarColor: Colors.black,
  ));
}

Future initialization(BuildContext? context) async {

  //load data here
  await UserController.me.getStoredUser();

  await Future.delayed(Duration(seconds: 3));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: Size(1080, 2220),
        builder: (_) => GetMaterialApp(
          builder: (BuildContext context, Widget? widget) {
            // ScreenUtil.setContext(context);
            return OrientationBuilder(
                builder: (context, orientation) {

                  if (orientation == Orientation.portrait) {
                  } else if (orientation == Orientation.landscape) {
                  }

                  (context as Element).reassemble();
                  return MediaQuery(
                      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                      child: widget!);
                }
            );
          },
          theme: ThemeData(
              fontFamily: "ProximaNova"
          ),
          defaultTransition: Transition.cupertino,
          initialRoute: AppRoutes.login,
          getPages: AppPages.pages,
          title: "V Project API",
        ));
  }
}