import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

class AppDio {
  static String baseUrl = "https://reqres.in/";
  // static String baseUrl = "http://siperkasa.itcs.co.id/";

  final dio = createDio();

  final accessToken = Dio(BaseOptions(baseUrl: "$baseUrl/api/"));

  // AppDio._internal();
  // static final singleton = AppDio._internal();
  // factory AppDio() => singleton;

  static Options headers = Options(
      headers: {
        Headers.contentTypeHeader: "application/x-www-form-urlencoded",
        Headers.acceptHeader: "application/json",
      }
  );

  static Options headersToken() {
    return Options(
        headers: {
          //"Authorization": "Bearer ${UserController.to.user.token}",
          Headers.contentTypeHeader: "application/x-www-form-urlencoded",
          Headers.acceptHeader: "application/json",
        }
    );
  }

  static Future<bool> executeApiWithTryCatch(Function function) async {
    try {
      await function();
      return true;
    } on DioError catch (e) {
      print(e.toString());
      return false;
    }
  }


  static Dio createDio() {

    var dio = Dio(BaseOptions(
        baseUrl: "$baseUrl/api/",
        receiveTimeout: 5000,
        connectTimeout: 5000,
        responseType: ResponseType.json,
        // sendTimeout: 3000,
        receiveDataWhenStatusError: true
    ));


    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          // options.cancelToken;
          print('dicanel');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          if (response.statusCode == 200) {
            print('123');
          }
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          if (Get.isDialogOpen!) Get.back();
          String? message;

          switch (e.type) {
            case DioErrorType.connectTimeout:
              message = "ConnectionTime Out";
              break;
            case DioErrorType.other:
              message = "No Internet";
              break;
            case DioErrorType.response:
              switch (e.response?.statusCode) {
                case 400:
                  message = "Invalid Request";
                  break;
                case 401:
                  message = "Access denied";
                  break;
                case 404:
                  message = "The requested information could not be found";
                  break;
                case 409:
                  message = "Conflict occurred";
                  break;
                case 500:
                  message = "Unknown error occurred, please try again later.";
                  break;
              }
              break;
            default:
              message = e.message.toString();
              break;
          }
          debugPrint(message.toString());
          if (Get.isDialogOpen!) Get.back();
          Get.snackbar("Error", message.toString(),
              colorText: Colors.black,
              backgroundColor: Colors.blue,
              shouldIconPulse: false,
              dismissDirection: DismissDirection.horizontal,
              margin: EdgeInsets.all(30),
              snackPosition: SnackPosition.BOTTOM
          );
          return handler.next(e);
        },
    ));

    return dio;
  }
}
