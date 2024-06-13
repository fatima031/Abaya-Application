import 'package:abayaapp/screens/auth_Ui/welcome_screen.dart';
import 'package:abayaapp/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Custom_Drawer extends StatefulWidget {
  const Custom_Drawer({super.key});

  @override
  State<Custom_Drawer> createState() => _Custom_DrawerState();
}

class _Custom_DrawerState extends State<Custom_Drawer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: Get.height / 25),
        child:  Drawer(
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )),
            child: Wrap(runSpacing: 10, children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  title: Text(
                    "Title",
                    style: TextStyle(color: AppConstant.appMainColor),
                  ),
                  subtitle: Text(
                    "subtitle",
                    style: TextStyle(color: AppConstant.appMainColor),
                  ),
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundColor: AppConstant.appMainColor,
                    child: Text(
                      "data",
                      style: TextStyle(color: AppConstant.appTextColor),
                    ),
                  ),
                ),
              ),
              Divider(
                indent: 10.0,
                endIndent: 10.0,
                thickness: 1.5,
                color: Colors.grey,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: ListTile(
                    titleAlignment: ListTileTitleAlignment.center,
                    title: Text(
                      "Home",
                      style: TextStyle(color: AppConstant.appMainColor, fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(Icons.home, color: AppConstant.appMainColor,),
                    trailing: Icon(Icons.arrow_forward, color: AppConstant.appMainColor),),
              ),
               
               Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: ListTile(
                    titleAlignment: ListTileTitleAlignment.center,
                    title: Text(
                      "Products",
                      style: TextStyle(color: AppConstant.appMainColor, fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(Icons.home, color: AppConstant.appMainColor,),
                    trailing: Icon(Icons.arrow_forward, color: AppConstant.appMainColor),),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: ListTile(
                    titleAlignment: ListTileTitleAlignment.center,
                    title: Text(
                      "Order",
                      style: TextStyle(color: AppConstant.appMainColor, fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(Icons.shopping_bag, color: AppConstant.appMainColor,),
                    trailing: Icon(Icons.arrow_forward, color: AppConstant.appMainColor),),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: ListTile(
                    titleAlignment: ListTileTitleAlignment.center,
                    title: Text(
                      "Contacts",
                      style: TextStyle(color: AppConstant.appMainColor, fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(Icons.help_center, color: AppConstant.appMainColor,),
                    trailing: Icon(Icons.arrow_forward, color: AppConstant.appMainColor),),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: ListTile(
                  onTap: () async {
                    GoogleSignIn googleSignIn = GoogleSignIn();
            FirebaseAuth _auth = FirebaseAuth.instance;
            await _auth.signOut();
            await googleSignIn.signOut();
            Get.offAll(() => WelcomeScreen());
                  },
                    titleAlignment: ListTileTitleAlignment.center,
                    title: Text(
                      "Logout",
                      style: TextStyle(color: AppConstant.appMainColor, fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(Icons.logout, color: AppConstant.appMainColor,),
                    trailing: Icon(Icons.arrow_forward, color: AppConstant.appMainColor,),),
              ),
            ])));
  }
}
