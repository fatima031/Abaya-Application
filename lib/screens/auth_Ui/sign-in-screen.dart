import 'package:abayaapp/controllers/get-user-data-controller.dart';
import 'package:abayaapp/controllers/sign-in-controller.dart';
import 'package:abayaapp/screens/admin_panel/admin-main-screen.dart';
import 'package:abayaapp/screens/auth_Ui/forget-password-screen.dart';
import 'package:abayaapp/screens/auth_Ui/signup_screen.dart';
import 'package:abayaapp/screens/user_panel/main_screen.dart';
import 'package:abayaapp/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignIn_Screen extends StatefulWidget {
  const SignIn_Screen({super.key});

  @override
  State<SignIn_Screen> createState() => _SignIn_ScreenState();
}

class _SignIn_ScreenState extends State<SignIn_Screen> {
  final SignInController signInController = Get.put(SignInController());
  final GetUserDataController getUserDataController =
      Get.put(GetUserDataController());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                "Please Sign In For Creating Account",
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
                            // width: Get.width / 1.2,
                            // height: Get.height / 12,
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
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: Get.width,
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Obx(
                          () => TextFormField(
                            controller: passwordController,
                            obscureText:
                                signInController.isPasswordVisible.value,
                            cursorColor: AppConstant.appSeconderyColor,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: "Password",
                                contentPadding:
                                    const EdgeInsets.only(top: 2, left: 8),
                                prefixIcon: const Icon(Icons.password_rounded),
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      signInController.isPasswordVisible
                                          .toggle();
                                    },
                                    child:
                                        signInController.isPasswordVisible.value
                                            ? Icon(Icons.visibility_off)
                                            : Icon(Icons.visibility)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ))),
                Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => ForgetScreen());
                    },
                    child: const Text(
                      "Forget Password",
                      style: TextStyle(
                          color: AppConstant.appTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
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
                          String password = passwordController.text.trim();

                          if (email.isEmpty || password.isEmpty) {
                            Get.snackbar("Error", "Please Enter All Details",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor:
                                    Color.fromARGB(169, 54, 63, 65),
                                colorText: AppConstant.appTextColor);
                          } else {
                            UserCredential? userCredential =
                                await signInController.signInMethod(
                                    email, password);

                            var userData = await getUserDataController
                                .getUserData(userCredential!.user!.uid);

                            if (userCredential != null) {
                              if (userCredential.user!.emailVerified) {
                                if (userData[0]["isAdmin"] == true) {
                                  Get.offAll(() => AdminMainScreen());
                                  Get.snackbar("Success Admin Login",
                                      "Login Successfully!",
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor:
                                          Color.fromARGB(169, 54, 63, 65),
                                      colorText: AppConstant.appTextColor);
                                } else {
                                  Get.offAll(() => MainScreen());
                                  Get.snackbar("Success User Login",
                                      "Login Successfully!",
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor:
                                          Color.fromARGB(169, 54, 63, 65),
                                      colorText: AppConstant.appTextColor);
                                }
                              } else {
                                Get.snackbar("Error",
                                    "Please Verify Your Email Before Login",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor:
                                        Color.fromARGB(169, 54, 63, 65),
                                    colorText: AppConstant.appTextColor);
                              }
                            } else {
                              Get.snackbar("Error", "Please Try Again",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor:
                                      Color.fromARGB(169, 54, 63, 65),
                                  colorText: AppConstant.appTextColor);
                            }
                          }
                        },
                        child: const Text(
                          "Sign In",
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
                    const Text(
                      "Dont have account? ",
                      style: TextStyle(
                          color: AppConstant.appTextColor,
                          fontWeight: FontWeight.w400),
                    ),
                    GestureDetector(
                      onTap: () => Get.offAll(() => SignUp()),
                      child: const Text(
                        " Sign up",
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
        );
      },
    );
  }
}
