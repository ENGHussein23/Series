import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailAuthController extends GetxController {
  var isLoading = false.obs;

  void signUpWithEmail(String email, String password) async {
    isLoading.value = true;
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,//emailController.text,
        password: password,//passwordController.text,
      );
      Get.snackbar(
        'Account successfully created',
        'Welcome to our application, you are now logged in with an account ${userCredential.user!.email} ',
        duration: Duration(seconds: 5),
        backgroundColor: Colors.green,
        colorText: Colors.white,
        borderRadius: 10,
      );
      Get.toNamed("/Register_Info");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          'weak-password',
          'The password provided is too weak.',
          duration: Duration(seconds: 3),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          borderRadius: 10,
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          'email-already-in-use',
          'The account already exists for that email.',
          duration: Duration(seconds: 3),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          borderRadius: 10,
        );
      }
    } catch (e) {
      Get.snackbar(
        'connection error',
        '$e',
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        borderRadius: 10,
      );
      print("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee\n "+e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}