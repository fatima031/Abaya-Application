// import 'dart:html';
import 'dart:ui';

import 'package:abayaapp/controllers/get-device-token-controller.dart';
import 'package:abayaapp/models/userMode.dart';
import 'package:abayaapp/utils/app_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // for paswd visible

  var isPasswordVisible = true.obs;

  Future<UserCredential?> signUpMethod(
      String userName,
      String userEmail,
      String userPhone,
      String userCity,
      String userPassword,
      String userDeviceToken) async {
    final GetDeviceTokenController getDeviceTokenController =
        Get.put(GetDeviceTokenController());
    try {
      EasyLoading.show(status: "Please wait. . .");
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: userEmail, password: userPassword);

      await userCredential.user!.sendEmailVerification();

      UserModel userModel = UserModel(
          uId: userCredential.user!.uid,
          userName: userName,
          email: userEmail,
          phone: userPhone,
          userImage: "userIma",
          userDeviceToken: getDeviceTokenController.deviceToken.toString(),
          country: "",
          userAddress: "",
          street: "",
          isAdmin: false,
          isActvie: true,
          city: userCity,
          createdOn: DateTime.now());

      //add data into database
      _firestore
          .collection("user")
          .doc(userCredential.user!.uid)
          .set(userModel.toMap());
      EasyLoading.dismiss();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar("Error", "$e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color.fromARGB(169, 54, 63, 65),
          colorText: AppConstant.appTextColor);
    }
  }
}
