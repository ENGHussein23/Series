import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/RegisterInfoController.dart';
import '../Widgets/my_text_from_field.dart';

class Register_Info extends StatelessWidget{

  final RegisterInfoController registerInfoController = Get.put(RegisterInfoController());
  TextEditingController nameController=TextEditingController();
  TextEditingController ageController=TextEditingController();
  CollectionReference NewCollection = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
   return Scaffold(
     body: Container(
       height: height,
       width: width,
       // color: Colors.black,
       decoration: BoxDecoration(
         image: DecorationImage(
           image: const AssetImage('assets/hi.jpg'),
           fit: BoxFit.cover,
           colorFilter: ColorFilter.mode(
             Colors.black.withOpacity(0.8),
             BlendMode.darken,
           ),
         ),
       ),
       padding: const EdgeInsets.all(10),
       child: ListView(
         children: [
           const SizedBox(height: 150),
       GetBuilder<RegisterInfoController>(
         // init: RegisterInfoController(),
         builder: (controller) {
           return RichText(
             text: TextSpan(
               text: 'Welcome ',
               style: const TextStyle(color: Colors.white, fontSize: 20.0,),
               children: <TextSpan>[
                 TextSpan(
                   text: controller.CurrentUser.email.toString(),
                   style:  const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 20.0,
                   ),
                 ),
               ],
             ),
           );
         },
       ),
           const SizedBox(height: 20,),
           MyTextFromField(nameController,"my name"),
           const SizedBox(height: 20,),
           MyTextFromField(ageController,"my age"),
           const SizedBox(height: 50,),
           //continue
           ElevatedButton(onPressed: ()async{
             registerInfoController.registerInfo( nameController, ageController);
           }, child: const Text('continue')),
         ],
       ),
     ),

   );
  }
}