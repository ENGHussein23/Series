import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getx_series/view/pages/EmailAuthScreen.dart';
import 'package:getx_series/view/pages/OnboardingPage.dart';
import 'package:getx_series/view/pages/Sign_in.dart';
import 'package:getx_series/view/pages/emailLogIn.dart';
import 'package:getx_series/view/pages/main_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_series/view/pages/MyHomePage.dart';
import 'package:getx_series/view/pages/Sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:getx_series/view/pages/email_aouth.dart';
import 'package:getx_series/view/pages/profile.dart';
import 'package:getx_series/view/pages/register_info.dart';

late bool isLogin;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var user =FirebaseAuth.instance.currentUser;
  if(user==null) isLogin=false;
  else isLogin=true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter GetX Demo',
      theme: ThemeData(
backgroundColor: Colors.black87,
        primarySwatch: Colors.indigo,
      ),
      initialRoute: isLogin?"/main_Page":"/",
      getPages: [
        GetPage(name: "/", page:()=>OnboardingScreen()),
        GetPage(name: "/main_Page", page:()=>main_page()),
        GetPage(name: "/Sign_up", page:()=> Sign_up()),
        GetPage(name: "/Sign_in", page:()=> Sign_in()),
        GetPage(name: "/Email_Aouth", page:()=> Email_Aouth()),
        GetPage(name: "/EmailAuthScreen", page:()=> EmailAuthScreen()),
        GetPage(name: "/EmailLogIn", page:()=> EmailLogIn()),
        GetPage(name: "/Profile", page:()=> Profile()),
        GetPage(name: "/OnboardingScreen", page:()=> OnboardingScreen()),
        GetPage(name: "/Register_Info", page:()=> Register_Info()),
      ],
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}




