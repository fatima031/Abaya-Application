// import 'dart:ffi';

import 'package:abayaapp/controllers/sigin-up-controller.dart';
import 'package:abayaapp/screens/auth_Ui/sign-in-screen.dart';
import 'package:abayaapp/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  final SignUpController signUpController = Get.put(SignUpController());
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();
  TextEditingController userCityController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppConstant.appSeconderyColor,
            centerTitle: true,
            title: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                "Sign Up",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height / 20,
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Welcome To My App",
                        style: TextStyle(
                            color: AppConstant.appTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )),
                  SizedBox(
                    height: Get.height / 20,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: Get.width,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: userNameController,
                          cursorColor: AppConstant.appSeconderyColor,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              hintText: "User Name",
                              contentPadding: EdgeInsets.only(top: 2, left: 8),
                              prefixIcon: Icon(Icons.person_4_rounded),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      )),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: Get.width,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: userEmailController,
                          cursorColor: AppConstant.appSeconderyColor,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: "Email",
                              contentPadding: EdgeInsets.only(top: 2, left: 8),
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      )),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: Get.width,
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Obx(
                            () => TextFormField(
                              controller: userPasswordController,
                              obscureText:
                                  signUpController.isPasswordVisible.value,
                              cursorColor: AppConstant.appSeconderyColor,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  contentPadding:
                                      EdgeInsets.only(top: 2, left: 8),
                                  prefixIcon: Icon(Icons.password_rounded),
                                  suffixIcon: GestureDetector(
                                      onTap: () {
                                        signUpController.isPasswordVisible
                                            .toggle();
                                      },
                                      child: signUpController
                                              .isPasswordVisible.value
                                          ? Icon(Icons.visibility_off)
                                          : Icon(Icons.visibility)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ))),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: Get.width,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: userPhoneController,
                          cursorColor: AppConstant.appSeconderyColor,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "Phone",
                              contentPadding: EdgeInsets.only(top: 2, left: 8),
                              prefixIcon: Icon(Icons.phone),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      )),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: Get.width,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: userCityController,
                          cursorColor: AppConstant.appSeconderyColor,
                          keyboardType: TextInputType.streetAddress,
                          decoration: InputDecoration(
                              hintText: "City",
                              contentPadding: EdgeInsets.only(top: 2, left: 8),
                              prefixIcon: Icon(Icons.location_pin),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      )),
                  SizedBox(
                    height: Get.height / 20,
                  ),
                  Material(
                    child: Container(
                      width: Get.width / 2,
                      height: Get.height / 18,
                      decoration: BoxDecoration(
                          color: AppConstant.appSeconderyColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                          onPressed: () async {
                            String name = userNameController.text.trim();
                            String email = userEmailController.text.trim();
                            String phone = userPhoneController.text.trim();
                            String city = userCityController.text.trim();
                            String password =
                                userPasswordController.text.trim();
                            String userDeviceToken = "";

                            if (name.isEmpty ||
                                email.isEmpty ||
                                phone.isEmpty ||
                                city.isEmpty ||
                                password.isEmpty) {
                              Get.snackbar(
                                  "Error", "Please Fill All The Details",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor:
                                      Color.fromARGB(169, 54, 63, 65),
                                  colorText: AppConstant.appTextColor);
                            } else {
                              UserCredential? userCredential =
                                  await signUpController.signUpMethod(
                                      name,
                                      email,
                                      phone,
                                      city,
                                      password,
                                      userDeviceToken);

                              if (userCredential != null) {
                                Get.snackbar("Verification Email Sent!",
                                    "Please Check Your Email",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor:
                                        Color.fromARGB(169, 54, 63, 65),
                                    colorText: AppConstant.appTextColor);

                                FirebaseAuth.instance.signOut();
                                Get.offAll(() => SignIn_Screen());
                              }
                            }
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: AppConstant.appTextColor,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: Get.height / 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                            color: AppConstant.appTextColor,
                            fontWeight: FontWeight.w400),
                      ),
                      GestureDetector(
                        onTap: () => Get.offAll(() => SignIn_Screen()),
                        child: Text(
                          " Sign In",
                          style: TextStyle(
                              color: AppConstant.appTextColor,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
