import 'package:flutter/material.dart';
import 'package:flutter_3_very_project/routes/dasboard/dashboard_controller.dart';
import 'package:flutter_3_very_project/routes/dasboard/home/home.dart';
import 'package:flutter_3_very_project/widgets/app_bottom_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'profile/profile.dart';

class DashBoard extends StatelessWidget {
  DashBoardController controller = Get.put(DashBoardController());
  int index=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Obx(() {
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 1.sh,
              width: 1.sw,
              child: AppDisplayPage(index: controller.indexDasboard.value),
            ),
            Positioned(
              bottom: 0,
                width: 1.sw,
                child: AppBottomBar(
                  index: controller.indexDasboard.value,
                  onTap: (int i) {
                    controller.setSelectedIndexPage(index: i);
                  },
                )
            )
          ],
        );
      }),
    );
  }
}

Widget AppDisplayPage({int index=0}) {
  switch (index) {
    case 0:
      return Home();
    case 1:
      return Profile();
    default:
      return Home();
  }
}