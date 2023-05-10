import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/controller_shows.dart';
class Episodes_Extend extends StatelessWidget{
  final ShowsController myController = Get.put(ShowsController());
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        padding: const EdgeInsets.only(top:50 ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/bay.jpg'),
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
                    margin: EdgeInsets.only(left: 10,right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: i.isEven?Color.fromARGB(100, 100, 100, 136):Color.fromARGB(100, 83, 109, 254)
                    ),
                    child: Column(
                      crossAxisAlignment:  CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(image: AssetImage("${myController.episodes[i]['poster']}"),
                              height: 300,),
                            const SizedBox(height: 20,),
                            Text("${myController.episodes[i]['show']}",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color:   Colors.white //Color.fromARGB(100, 100, 200, 236)
                              ),),
                            Text("${myController.episodes[i]['episode_number']}",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color:   Colors.white //Color.fromARGB(100, 100, 200, 236)
                              ),),
                            Text("${myController.episodes[i]['release_date']}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color:   Colors.white //Color.fromARGB(100, 100, 200, 236)
                              ),),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Text("${myController.episodes[i]['script']}",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.white
                          ),),
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