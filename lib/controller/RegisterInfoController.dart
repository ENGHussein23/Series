import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterInfoController extends GetxController {
late User CurrentUser;


  @override
  void onInit() {
    super.onInit();
    _getCurrentUser();
  }

  Future<void> _getCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;

      CurrentUser = user!;
      update();
  }
  Future<void> registerInfo(TextEditingController nameController,TextEditingController ageController)async {
    CollectionReference NewCollection =
    FirebaseFirestore.instance.collection('users');
    try {
    if(nameController.text.isNotEmpty&&ageController.text.isNotEmpty)
      {
        final DocumentReference newDocumentReference =
        NewCollection.doc(CurrentUser.email.toString());
        await newDocumentReference.set(
          {
            'email': CurrentUser.email.toString(),
            'name': nameController.text.toString(),
            'age': ageController.text.toString(),
          },
          SetOptions(merge: true),
        );
        Get.snackbar(
          'Info successfully registered',
          'Welcome ${nameController.text.toString()} to our application, you are now logged in with an account ${CurrentUser.email}',
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.green,
          colorText: Colors.white,
          borderRadius: 10,
        );
        Get.toNamed('/main_Page');
      }
    else{
      Get.snackbar(
        'Info empty fields',
        'Please fill in all fields',
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        borderRadius: 10,
      );
    }
    }catch (e) {
      Get.snackbar(
        'An error occurred',
        'An error occurred: $e',
        duration: Duration(seconds: 5),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        borderRadius: 10,
      );
      print('An error occurred: $e');
      // Handle the error here
    }
  }

}