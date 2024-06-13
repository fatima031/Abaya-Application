import 'package:abayaapp/controllers/forget-password-controller.dart';
import 'package:abayaapp/screens/auth_Ui/signup_screen.dart';
import 'package:abayaapp/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  final ForgetPasswordController forgetPasswordController =
      Get.put(ForgetPasswordController());
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppConstant.appSeconderyColor,
            title: const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "Forget Password",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          body: Container(
            child: Column(
              children: [
                isKeyboardVisible
                    ? const Text("Welcome To My App")
                    : Column(
                        children: [
                          Center(
                              child: Image.asset(
                            "assets/images/spalsh.png",
                            height: 200,
                            width: 400,
                          ))
                        ],
                      ),
                SizedBox(
                  height: Get.height / 20,
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: emailController,
                        cursorColor: AppConstant.appSeconderyColor,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            hintText: "Email",
                            contentPadding:
                                const EdgeInsets.only(top: 2, left: 8),
                            prefixIcon: Icon(Icons.email),
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
                          String email = emailController.text.trim();

                          if (email.isEmpty) {
                            Get.snackbar("Error", "Please Enter All Details",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor:
                                    Color.fromARGB(169, 54, 63, 65),
                                colorText: AppConstant.appTextColor);
                          } else {
                            String email = emailController.text;
                            forgetPasswordController.ForgetPasswordMethod(
                                email);
                          }
                        },
                        child: const Text(
                          "Forget",
                          style: TextStyle(
                              color: AppConstant.appTextColor,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                SizedBox(
                  height: Get.height / 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
