import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Sign_in extends StatelessWidget{
  var btn_style=ElevatedButton.styleFrom(
    fixedSize: Size.fromWidth(200),
    elevation: 0,
    backgroundColor: Colors.white,
    // onPrimary: Color.fromARGB(250, 0, 100, 136),
    // primary: Colors.white,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),

  );
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
        body:  Center(
          child: Container(
            height: height,
            width: width,
            // color: Colors.black87,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/helloo.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.darken,
                ),
              ),
            ),
            child:Column(
              children: [
                SizedBox(height: 200,),
                Text("Sing-in",
                style: TextStyle(
                  color:Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic
                ),),
                SizedBox(height: 50,),
                ElevatedButton(
                    style:btn_style,
                    onPressed: ()async{
                      signInWithGoogle();
                    },
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image(image: AssetImage(
                            "assets/google-logo.png"
                        ),
                          fit: BoxFit.cover,
                          height: 20,
                          width: 20,),
                        Text("by Google",style: TextStyle(color: Colors.black38),)
                      ],
                    ) ),
                SizedBox(height: 50,),
                ElevatedButton(
                    style:btn_style,
                    onPressed: ()async {
                      Get.toNamed("/EmailLogIn");
                    },
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.email,color: Colors.black38),
                        Text("by Email",style: TextStyle(color: Colors.black38),)
                      ],
                    ) ),
              ],
            ) ,
          ),
        )
    )

    ;
  }

}