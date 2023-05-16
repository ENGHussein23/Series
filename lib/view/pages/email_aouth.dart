import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Email_Aouth extends StatelessWidget{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      padding: EdgeInsets.all(50),
      child: ListView(
        children: [
          SizedBox(height: 130,),
          SizedBox(height: 20,),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your email',
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(),
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
              // Save the email value to a variable or database
            },
          ),
          SizedBox(height: 10,),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              hintText: 'Enter your password',
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(),
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
              // Save the password value to a variable or database
            },
          ),
          SizedBox(height: 50,),
          LoadingAnimationWidget.discreteCircle(
            color: Colors.indigo,
            secondRingColor: Colors.indigoAccent,
            thirdRingColor: Colors.indigoAccent,
            size: 60,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: ()async{
            try {
              UserCredential userCredential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: emailController.text,//emailController.text,
                password: passwordController.text,//passwordController.text,
              );

              print("🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽");
              print("🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽🔽");
              print('User created: ${userCredential.user!.email}');
              Get.toNamed("/main_Page");
              print("🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼");
              print("🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼🔼");
            } on FirebaseAuthException catch (e) {
              if (e.code == 'weak-password') {
                print('The password provided is too weak.');
              } else if (e.code == 'email-already-in-use') {
                print('The account already exists for that email.');
              }
            } catch (e) {
              print(e);
            }
          },
              child: Text("Sing up with this Email"),
          style: ElevatedButton.styleFrom(
            fixedSize: Size.fromWidth(200),
            elevation: 0,
            backgroundColor: Colors.indigoAccent,
            // onPrimary: Color.fromARGB(250, 0, 100, 136),
            // primary: Colors.white,
            minimumSize: Size(88, 36),
            padding: EdgeInsets.symmetric(horizontal: 16),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),

          ),
          )
        ],
      ),
    ),
  );
  }

}