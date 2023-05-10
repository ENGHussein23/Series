import 'package:flutter/material.dart';
import 'package:getx_series/view/pages/shows.dart';
import 'package:get/get.dart';

import '../../controller/controller_shows.dart';

class Shows_Extend extends StatelessWidget{
  final ShowsController myController = Get.put(ShowsController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(

      body: Container(
        width: width,
        padding: const EdgeInsets.only(top:50 ),
        // color: Colors.black,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/wallblure.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.8),
              BlendMode.darken,
            ),
          ),
        ),
        child: Obx(
              () => PageView.builder(
                  scrollDirection: Axis.vertical,
              itemCount:myController.shows.length, //info.length,
              itemBuilder: (_,i){
                return GestureDetector(
                    child: Container(
                      height: 100,
                      padding: EdgeInsets.only(left: 20,top: 20,right: 20),
                      width: MediaQuery.of(context).size.width-40,
                      margin: EdgeInsets.only(left: 10,right: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: i.isEven?Color.fromARGB(100, 100, 100, 136):Color.fromARGB(100, 83, 109, 254)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment:  CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(image: AssetImage("${myController.shows[i]['poster']}"),
                              height: 300,),
                              Text("${myController.shows[i]['name']}",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color:   Colors.white //Color.fromARGB(100, 100, 200, 236)
                                ),),
                              Text("${myController.shows[i]['short_script']}",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Color.fromARGB(100, 150, 200, 236)
                                ),),

                            ],
                          ),
                          Text("${myController.shows[i]['script']}",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.white
                            ),),
                          SingleChildScrollView(
                            scrollDirection:Axis.horizontal ,
                            child: Row(
                              children: [
                                for(var character in myController.shows[i]['characters'].take(3))
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
                          ),

                        ],
                      ),
                    ),
                );

              }),
        ),
      ),
    );

  }

}