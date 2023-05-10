import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Shows extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final Map<String, dynamic> args = Get.arguments;
    String wallpaper = args["poster"];
    String name = args["name"];
    String short_script = args["short_script"];
    String script = args["script"];
    var characters = args["characters"];
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
                      name,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 21),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      short_script,
                      style: TextStyle(
                          color: Colors.white30,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
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
                           Text("Script:",
                             style: TextStyle(
                                 color: Colors.white,
                                 fontWeight: FontWeight.w600,
                                 fontSize: 16),),
                           SizedBox(height: 10,),
                           Text(script,
                             style: TextStyle(
                                 color: Colors.white,
                                 fontWeight: FontWeight.w400,
                                 fontSize: 16),),
                           SizedBox(height: 20,),
                           Text("Top Characters in the show:",
                             style: TextStyle(
                                 color: Colors.white,
                                 fontWeight: FontWeight.w600,
                                 fontSize: 16),),
                           SizedBox(height: 10,),
                           SingleChildScrollView(
                             scrollDirection:Axis.horizontal ,
                             child: Row(
                               children: [
                                 for(var character in characters.take(3))
                                   Container(
                                     padding: EdgeInsets.all(5),
                                     child: Column(
                                       children: [
                                         Container(
                                           width: 80,
                                           height: 110,
                                           padding: EdgeInsets.all(5),
                                           decoration: BoxDecoration(
                                               borderRadius: BorderRadius.circular(20),
                                               image: DecorationImage(
                                                 image:  AssetImage(
                                                   character['image']! as String,
                                                 ),
                                                 fit: BoxFit.cover,
                                               )
                                           ),
                                         ),
                                         SizedBox(height: 4,),
                                         Text(character['name']! as String, style: TextStyle(
                                             color: Colors.white,
                                             fontWeight: FontWeight.w600,
                                             fontSize: 16),),
                                       ],
                                     ),
                                   ),
                               ],
                             ),
                           )
                         ],
                       ),
                      ),
                    )
                )
            )
          ],
        ),
      ),
    );
  }
}
