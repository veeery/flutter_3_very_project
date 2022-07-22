
import 'package:flutter_3_very_project/routes/auth/login/login.dart';
import 'package:flutter_3_very_project/routes/dasboard/dashboard.dart';
import 'package:flutter_3_very_project/routes/dasboard/home/home.dart';
import 'package:flutter_3_very_project/routes/dasboard/profile/profile.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final String login = '/login';

  static final String home = '/home';
  static final String profile = '/profile';
  static final String dashboard = '/dashboard';
}

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.login, page: () => Login()),

    GetPage(name: AppRoutes.home, page: () => Home()),
    GetPage(name: AppRoutes.profile, page: () => Profile()),
    GetPage(name: AppRoutes.dashboard, page: () => DashBoard()),
  ];
}