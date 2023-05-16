import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailLogInController extends GetxController {
  var isLoading = false.obs;

  void signInWithEmail(String email, String password) async {
    isLoading.value = true;
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      Get.snackbar(
        'success',
        'successfully Log in',
        duration: Duration(seconds: 3),
        backgroundColor: Colors.green,
        colorText: Colors.white,
        borderRadius: 10,
      );
      Get.toNamed("/main_Page");
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
    }
    finally {
      isLoading.value = false;
    }
  }
}