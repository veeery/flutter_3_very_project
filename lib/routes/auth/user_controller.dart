
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3_very_project/app_dio.dart';
import 'package:flutter_3_very_project/models/user.dart';
import 'package:flutter_3_very_project/routes/app_routes.dart';
import 'package:flutter_3_very_project/widgets/app_loading.dart';

import 'package:get/get.dart' hide Response;
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {

  static UserController get me => Get.find();

  dynamic user;

  Future<void> login({required String email,required String password}) async {

    Get.dialog(AppLoading());
    // try {
    //   Response response = await AppDio().dio.post(
    //       "auth/login",
    //       options: AppDio.headers,
    //       data: {
    //         "username": email,
    //         "password": password
    //       }
    //   );
    //
    //   if (Get.isDialogOpen!) Get.back();
    //
    // } catch (e) {
    //   if (Get.isDialogOpen!) Get.back();
    //   print(e.toString());
    //   Get.snackbar("Error", e.toString(), backgroundColor: Colors.white);
    // }

    bool apiResult = await AppDio.executeApiWithTryCatch(() async {
      Response response = await AppDio.createDio().post(
          "auth/login",
          options: AppDio.headers,
        // cancelToken: ,
        data: {
            "username": email,
            "password": password
        }
      );

      // print(response.data['data']);
    });


    update();
  }


  Future<void> getStoredUser() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();

      String? userJson = preferences.getString("user-v-project");

      if (userJson != null) {
        // user = Users.fromJson(jsonDecode(userJson));
        user = user.token;

        Get.toNamed(AppRoutes.home);

      }

      // Response response = await AppDio().dio.post(
      //   // "api/login"
      //   "auth/refresh",
      //   options: AppDio.headersToken()
      // );


    } catch (e) {

    }
  }

}