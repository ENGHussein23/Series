import 'package:flutter/material.dart';
import 'package:getx_series/view/pages/main_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_series/view/pages/MyHomePage.dart';

void main() {
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
        GetPage(name: "/main_Page", page:()=>main_page())
      ],
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}




