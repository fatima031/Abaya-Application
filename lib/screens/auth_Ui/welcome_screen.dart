// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:abayaapp/controllers/google_sign_in_Controller.dart';
import 'package:abayaapp/screens/auth_Ui/sign-in-screen.dart';
import 'package:abayaapp/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final GoogleSignInController _googleSignInController =
      Get.put(GoogleSignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppConstant.appSeconderyColor,
        title: Text(
          "Welcome to my app",
          style: TextStyle(color: AppConstant.appTextColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/images/spalsh.png",height: 200, width: 600,),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Text(
                  "Happy Shopping",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: Get.height / 12,
              ),
              Material(
                child: Container(
                  width: Get.width / 1.2,
                  height: Get.height / 12,
                  decoration: BoxDecoration(
                    color: AppConstant.appSeconderyColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: TextButton.icon(
                    icon: Image.asset(
                      'assets/images/final-google-logo.png',
                      width: Get.width / 12,
                      height: Get.height / 12,
                    ),
                    label: Text(
                      "Sign in with google",
                      style: TextStyle(color: AppConstant.appTextColor),
                    ),
                    onPressed: () {
                      _googleSignInController.signInWithGoogle();
                    },
                  ),
                ),
              ),
              SizedBox(
                height: Get.height / 50,
              ),
              Material(
                child: Container(
                  width: Get.width / 1.2,
                  height: Get.height / 12,
                  decoration: BoxDecoration(
                    color: AppConstant.appSeconderyColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: TextButton.icon(
                    icon: Icon(
                      Icons.email,
                      color: AppConstant.appTextColor,
                    ),
                    label: Text(
                      "Sign in with email",
                      style: TextStyle(color: AppConstant.appTextColor),
                    ),
                    onPressed: () {
                      Get.to(() => SignIn_Screen());
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
