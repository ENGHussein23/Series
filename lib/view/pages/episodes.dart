import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Episodes extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final Map<String, dynamic> args = Get.arguments;
    String wallpaper = args["poster"];
    String show = args["show"];
    String release_date = args["release_date"];
    String script = args["script"];
    String episode_number=args["episode_number"];
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(right: 25, left: 25),
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(wallpaper),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.8),
              BlendMode.darken,
            ),
          ),
        ),

        child: Column(
          children: [
            SizedBox(
              height: 120,
            ),
            Row(
              children: [
                Image(
                  image: AssetImage(
                    wallpaper,
                  ),
                  fit: BoxFit.contain,
                  width: 150,
                  height: 200,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      show,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 21),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      episode_number,
                      style: TextStyle(
                          color: Colors.white30,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      release_date,
                      style: TextStyle(
                          color: Colors.white30,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.topLeft,
                      color: Color.fromARGB(50, 0, 200,250),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // Text("Script:",
                            //   style: TextStyle(
                            //       color: Colors.white,
                            //       fontWeight: FontWeight.w600,
                            //       fontSize: 16),),
                            SizedBox(height: 10,),
                            Text(script,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),),
                            SizedBox(height: 20,),

                          ],
                        ),
                      ),
                    )
                )
            )
          ],
        ),      ),
    );
  }

}