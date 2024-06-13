import 'package:abayaapp/firebase_options.dart';
// import 'package:abayaapp/screens/auth_Ui/sign-in-screen.dart';
import 'package:abayaapp/screens/auth_Ui/signup_screen.dart';
import 'package:abayaapp/screens/auth_Ui/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

// import 'screens/auth_Ui/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp (const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tahir Qadri Abaya App',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(),
        useMaterial3: true,
      ),
      home:  Splash_Screen(),
      builder: EasyLoading.init(),
    );
  }
}
