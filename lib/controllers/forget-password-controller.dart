// ignore_for_file: body_might_complete_normally_nullable

import 'dart:ui';

// import 'package:abayaapp/models/userMode.dart';
import 'package:abayaapp/screens/auth_Ui/sign-in-screen.dart';
import 'package:abayaapp/utils/app_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // ignore: unused_field
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> ForgetPasswordMethod(
    String userEmail,
  ) async {
    try {
      EasyLoading.show(status: "Please wait. . .");

      await _auth.sendPasswordResetEmail(email: userEmail);
      Get.snackbar("Request Sent Successfully",
          "Password Resent Link Sent To $userEmail",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color.fromARGB(169, 54, 63, 65),
          colorText: AppConstant.appTextColor);

      Get.offAll(() => SignIn_Screen());

      EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar("Error", "$e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color.fromARGB(169, 54, 63, 65),
          colorText: AppConstant.appTextColor);
    }
  }
}
