import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailLogInController extends GetxController {
  var isLoading = false.obs;
late bool DocNull;
  late User CurrentUser;
  late var DataDoc;
  // @override
  // void onInit() {
  //   super.onInit();
  //   _getCurrentUser();
  // }
  Future<void> _getCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    CurrentUser = user!;
    String email=user.email.toString();
    DocumentReference CurrentUserReference = FirebaseFirestore.instance.collection('users').doc(email);
    await CurrentUserReference.get().then((value) {
      if(value ==null)
          DocNull=true;
      else
        DocNull=false;
    }
    );
    DataDoc = await CurrentUserReference.get();
    print(DocNull);
    // update();
  }
  void signInWithEmail(String email, String password) async {

    isLoading.value = true;
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      _getCurrentUser();
      if(DocNull){
        Get.snackbar(
          'success',
          'successfully Log in',
          duration: Duration(seconds: 3),
          backgroundColor: Colors.green,
          colorText: Colors.white,
          borderRadius: 10,
        );
        Get.toNamed("/main_Page");
      }
      else if(!DocNull)
        {
          Get.snackbar(
            'success',
            'successfully Log in, pleas complete the register info',
            duration: Duration(seconds: 3),
            backgroundColor: Colors.green,
            colorText: Colors.white,
            borderRadius: 10,
          );
          Get.toNamed("/Register_Info");
        }
      else
        {
          Get.snackbar(
            'Error in doc of this user',
            'Error',
            duration: Duration(seconds: 3),
            backgroundColor: Colors.red,
            colorText: Colors.white,
            borderRadius: 10,
          );
        }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          'user-not-found',
          'No user found for that email.',
          duration: Duration(seconds: 3),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          borderRadius: 10,
        );
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          'wrong-password',
          'Wrong password provided for that user..',
          duration: Duration(seconds: 3),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          borderRadius: 10,
        );
        print('Wrong password provided for that user.');
      }
      else {
        Get.snackbar(
          'connection error',
          '$e',
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
          colorText: Colors.white,
          borderRadius: 10,
        );
        print("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee\n "+e.toString());

      }

    }
    finally {
      isLoading.value = false;
    }
  }
}