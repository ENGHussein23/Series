import 'package:flutter/material.dart';
import 'package:getx_series/view/pages/EmailAuthScreen.dart';
import 'package:getx_series/view/pages/Sign_in.dart';
import 'package:getx_series/view/pages/emailLogIn.dart';
import 'package:getx_series/view/pages/main_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_series/view/pages/MyHomePage.dart';
import 'package:getx_series/view/pages/Sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:getx_series/view/pages/email_aouth.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page:()=>MyHomePage()),
        GetPage(name: "/main_Page", page:()=>main_page()),
        GetPage(name: "/Sign_up", page:()=> Sign_up()),
        GetPage(name: "/Sign_in", page:()=> Sign_in()),
        GetPage(name: "/Email_Aouth", page:()=> Email_Aouth()),
        GetPage(name: "/EmailAuthScreen", page:()=> EmailAuthScreen()),
        GetPage(name: "/EmailLogIn", page:()=> EmailLogIn()),


      ],
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}




