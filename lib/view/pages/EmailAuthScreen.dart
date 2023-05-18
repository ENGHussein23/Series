import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../controller/EmailAuthController.dart';

class EmailAuthScreen extends StatelessWidget {
  var _OutlineInputBorder=OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(8),
  );
  final EmailAuthController controller = Get.put(EmailAuthController());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController verifyPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
          ),
        ),
        padding: EdgeInsets.all(50),
        child: Obx(() => ListView(
          children: [
            SizedBox(
              height: 130,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              style: TextStyle(color: Colors.white),
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration:  InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white),
                hintText: 'Enter your email',
                hintStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.email, color: Colors.white),
                enabledBorder: _OutlineInputBorder,
                focusedBorder: _OutlineInputBorder,
                border:_OutlineInputBorder,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              onSaved: (value) {
                // Save email input
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white),
                hintText: 'Enter your password',
                hintStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.lock, color: Colors.white),
                enabledBorder:_OutlineInputBorder,
                focusedBorder:_OutlineInputBorder,
                border: _OutlineInputBorder,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
              onSaved: (value) {
                // Save password input
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: verifyPasswordController,
              obscureText: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Verify Password',
                labelStyle: TextStyle(color: Colors.white),
                hintText: 'Enter your password again',
                hintStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.lock, color: Colors.white),
                enabledBorder: _OutlineInputBorder,
                focusedBorder: _OutlineInputBorder,
                border: _OutlineInputBorder,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password again';
                }
                if (value != passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
              onSaved: (value) {
                // Save verified password input
              },
            ),
            SizedBox(
              height: 50,
            ),
            if (controller.isLoading.value)
             Center(
               child:  LoadingAnimationWidget.discreteCircle(
                 color: Colors.indigoAccent,
                 secondRingColor: Colors.green,
                 thirdRingColor: Colors.amber,
                 size: 100,
               ),
             ),
            if (!controller.isLoading.value)
              ElevatedButton(
                onPressed: () {
                  if (emailController.text.isEmpty ||
                      passwordController.text.isEmpty ||
                      verifyPasswordController.text.isEmpty) {
                    Get.snackbar(
                      'Missing Fields',
                      'Please fill in all required fields',
                      duration: Duration(seconds: 3),
                      backgroundColor: Colors.redAccent,
                      colorText: Colors.white,
                      borderRadius: 10,
                    );
                    return;
                  }
                  else if (passwordController.text !=
                      verifyPasswordController.text) {
                    Get.snackbar(
                      'Passwords do not match',
                      'Please make sure your passwords match',
                      duration: Duration(seconds: 3),
                      backgroundColor: Colors.redAccent,
                      colorText: Colors.white,
                      borderRadius: 10,
                    );
                    return;
                  }
                  else{
                    controller.signUpWithEmail(
                      emailController.text,
                      passwordController.text,
                    );
                  }


                },
                child: Text("Sign up with this Email"),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromWidth(200),
                  elevation: 0,
                  backgroundColor: Colors.indigoAccent,
                  minimumSize: Size(88, 36),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
          ],
        )),
      ),
    );
  }
}