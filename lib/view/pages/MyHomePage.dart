import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MyHomePage extends StatelessWidget {
  // const MyHomePage({super.key, required this.title});
  //
  //
  // final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
           Image(
            image: AssetImage('assets/itache.jpg'),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            margin: EdgeInsets.all(20),
            alignment: Alignment.bottomLeft,
            child: ListView(
              children:  <Widget>[
                SizedBox(
                  height: 500,
                ),

                Text(
                  'Pick Your Favorite Show',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
                Text(
                  'Series, Movies, Anime',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white60
                  ),
                ),
                SizedBox(height:20 ,),
                FloatingActionButton.extended(
                  // shape: OutlineInputBorder(borderRadius: BorderRadius.circular(50),),
                  backgroundColor: Colors.white12,
                  shape: const Border.symmetric(horizontal: BorderSide(color: Colors.white)),
                  onPressed:(){
                    // Get.toNamed("/main_Page");
                    Get.toNamed("/Sign_up");
                  },
                  // tooltip: 'Increment',
                  label:   const Text('Sign up',style: TextStyle(
                      fontSize: 18
                  )),
                  // child: const Icon(Icons.add),
                ),
                GestureDetector(
                  onTap: () {
                    // Action to perform when the text is tapped
                    Get.toNamed("/Sign_in");
                    print('Text tapped!');
                  },
                  child: const Text(
                    'already have account?',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
      // floatingActionButton: FloatingActionButton.extended(
      //   // shape: OutlineInputBorder(borderRadius: BorderRadius.circular(50),),
      //   backgroundColor: Colors.white12,
      //   shape: const Border.symmetric(horizontal: BorderSide(color: Colors.white)),
      //   onPressed:(){
      //     // Get.toNamed("/main_Page");
      //     Get.toNamed("/Sign_in");
      //   },
      //   // tooltip: 'Increment',
      //   label:   const Text('Sign in',style: TextStyle(
      //     fontSize: 18
      //   )),
      //   // child: const Icon(Icons.add),
      // ),
    );
  }
}