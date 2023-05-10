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
          const Image(
            image: AssetImage('assets/itache.jpg'),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            margin: EdgeInsets.all(20),
            alignment: Alignment.bottomLeft,
            child: ListView(
              children: const <Widget>[
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
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton.extended(
        // shape: OutlineInputBorder(borderRadius: BorderRadius.circular(50),),
        backgroundColor: Colors.white12,
        shape: const Border.symmetric(horizontal: BorderSide(color: Colors.white)),
        onPressed:(){
          Get.toNamed("/main_Page");
        },
        // tooltip: 'Increment',
        label:   const Text('Get Start',style: TextStyle(
          fontSize: 18
        )),
        // child: const Icon(Icons.add),
      ),
    );
  }
}