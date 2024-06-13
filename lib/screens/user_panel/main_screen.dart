
import 'package:abayaapp/utils/app_constant.dart';
import 'package:abayaapp/widgets/banner-widget.dart';
import 'package:abayaapp/widgets/custom-drawer-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppConstant.appSeconderyColor,
            statusBarIconBrightness: Brightness.light),
        backgroundColor: AppConstant.appMainColor,
        title: Text(
          AppConstant.appMainName,
          style: TextStyle(color: AppConstant.appTextColor),
        ),
        centerTitle: true,
      ),
      drawer: Custom_Drawer(),
      body:
       Image.asset("assets/images/main Image.jpg",
      height: 500,
      ),
      // SingleChildScrollView(
      //   physics: BouncingScrollPhysics(),
      //   child: Container(
      //     child: Column(
      //       children: [
      //         SizedBox(height: Get.height / 90.0,),
      //         Text("data"),
      //         // BannerWidget(),
      //       ],
      //     ),
      //   ),
      // )

    );
  }
}
