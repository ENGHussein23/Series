import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getx_series/view/pages/episodes.dart';
import 'package:getx_series/view/pages/shows.dart';
import 'package:getx_series/view/pages/shows_extend.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import '../../controller/main_controller.dart';
import 'episodes_extend.dart';

class main_page extends StatelessWidget{
  var btn_style=ElevatedButton.styleFrom(
      // fixedSize: Size.fromHeight(80),
      elevation: 0,
      // backgroundColor: Colors.redAccent,
      onPrimary: const Color.fromARGB(250, 0, 100, 136),
      primary: Colors.transparent,
      // minimumSize: Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),

  );

  // final SeriesController SeriesCont=Get.put(SeriesController());
  final MainController myController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    // String _user_name=_user!.email.toString()=="null"?"Anonymous User":_user!.email.toString();
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    int _currentIndex=0;
   return Scaffold(
     body: Container(
       padding: const EdgeInsets.only(top:50 ),
       // color: Colors.black,
       decoration: BoxDecoration(
         image: DecorationImage(
           image: const AssetImage('assets/hi.jpg'),
           fit: BoxFit.cover,
           colorFilter: ColorFilter.mode(
             Colors.black.withOpacity(0.8),
             BlendMode.darken,
           ),
         ),
       ),
       child: Column(
         children: [
           GestureDetector(
             child: Container(
               width: width,
               height: 100,
               margin: const EdgeInsets.only(left: 25,right: 25),
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),
                   color: Colors.white60
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   const SizedBox(width: 5,),
                   Row(
                     children: [ const CircleAvatar(
                         radius: 40,
                         backgroundImage: AssetImage(
                           "assets/me.jpg",
                         )
                     ),
                       const SizedBox(width: 10,),
                       Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           // Anonymous User
                           GetBuilder<MainController>(

                               builder: (controller){
                             return Text(
                               controller.CurrentUser.email.toString()=="null"?"Anonymous User":controller.CurrentUser.email.toString(),
                               style: const TextStyle(
                                   color: Colors.black54,
                                   fontWeight: FontWeight.w600,
                                   fontSize: 18
                               ),);
                           }),
                           const SizedBox(height: 4,),
                           const Text("Top Watcher",style: TextStyle(
                               color: Colors.black38,
                               fontSize: 15
                           ),),
                         ],
                       ),],
                   ),

                   ElevatedButton(onPressed: (){}, child: const Icon(Icons.notifications),
                     style: btn_style,
                   ),
                   const SizedBox(width: 5,),
                 ],
               ),
             ),
             onTap: (){Get.toNamed("/Profile");},
           ),
           const SizedBox(height: 20,),
           Container(
             padding: const EdgeInsets.only(left: 25,right: 25),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 const Text('Popular Shows',
                 style: TextStyle(
                    fontSize: 19,
                   fontWeight: FontWeight.w500,
                   color: Color.fromARGB(250, 0, 100, 136),
                 ),),
                 ElevatedButton(onPressed: (){
                   Get.to(Shows_Extend());
                 },
                   style: btn_style, child: const Icon(Icons.arrow_forward_ios_outlined),
                 ),
               ],
             ),
           ),
           const SizedBox(height: 15,),
           Container(
             height: 150,
             child: Obx(
               () => PageView.builder(
                   itemCount:myController.shows.length,
                   itemBuilder: (_,i){
                     return GestureDetector(
                         child: Container(
                           padding: const EdgeInsets.only(left: 20,top: 20,right: 20),
                           height: 220,
                           width: MediaQuery.of(context).size.width-40,
                           margin: const EdgeInsets.only(left: 10,right: 3),
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(30),
                               color: i.isEven?const Color.fromARGB(100, 83, 109, 254):const Color.fromARGB(100, 0, 100, 136)
                           ),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             crossAxisAlignment:  CrossAxisAlignment.start,
                             children: [
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text("${myController.shows[i]['name']}",
                                     style: const TextStyle(
                                         fontSize: 24,
                                         fontWeight: FontWeight.bold,
                                         color:   Colors.white //Color.fromARGB(100, 100, 200, 236)
                                     ),),
                                   Text("${myController.shows[i]['short_script']}",
                                     style: const TextStyle(
                                         fontSize: 16,
                                         fontWeight: FontWeight.normal,
                                         color: Color.fromARGB(100, 150, 200, 236)
                                     ),),
                                 ],
                               ),
                               Column(
                                 children: [
                                   Row(
                                     children: [
                                       for(int j=0;j<3;j++)
                                         Container(
                                           width: 50,
                                           height: 50,
                                           padding: const EdgeInsets.all(5),
                                           decoration: BoxDecoration(
                                               borderRadius: BorderRadius.circular(20),
                                               image: DecorationImage(
                                                 image:  AssetImage(
                                                   "${myController.shows[i]['characters'][j]['image']}",
                                                 ),
                                                 fit: BoxFit.cover,
                                               )
                                           ),
                                         )
                                     ],
                                   ),
                                   const SizedBox(height: 10,)
                                 ],
                               ),
                             ],
                           ),
                         ),
                         onTap: (){
                           final myMap =myController.shows[i]['characters'];
                           print(myMap);
                           Get.to(Shows(),arguments: {
                             "poster":"${myController.shows[i]['poster']}",
                             "name":"${myController.shows[i]['name']}",
                             "short_script":"${myController.shows[i]['short_script']}",
                             "script":"${myController.shows[i]['script']}",
                             "characters":myMap,
                           });
                         }
                     );
                   }),
             )
           ),
           const SizedBox(height: 20,),
           Container(
             padding: const EdgeInsets.only(left: 25,right: 25),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 const Text('Best Episodes',
                   style: TextStyle(
                       fontSize: 19,
                       fontWeight: FontWeight.w500,
                       color: Color.fromARGB(250, 0, 100, 136),
                   ),),
                 ElevatedButton(onPressed: (){
                   Get.to(Episodes_Extend());},
                   child: const Icon(Icons.arrow_forward_ios_outlined),
                   style: btn_style,),
               ],
             ),
           ),
           const SizedBox(height: 10,),
           Expanded(child:
           Obx(() => ListView.builder(
               itemCount: myController.episodes.length,
               itemBuilder: (_,i){
                 return GestureDetector(
                   child: Container(
                     width: width,
                     height: 100,
                     margin: const EdgeInsets.only(left: 25,right: 25,bottom: 10),
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                         color: const Color.fromARGB(100, 0, 100, 136),
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         const SizedBox(width: 0,),
                         Row(
                           children: [ Container(
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(50),
                             ),
                             child: Image(image:  AssetImage(
                               "${myController.episodes.value[i]["poster"]}",
                             ),
                               fit: BoxFit.contain,
                               height: 80,
                               width: 80,
                             ),
                           ),
                             const SizedBox(width: 10,),
                             Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("${myController.episodes.value[i]["show"]}",
                                   style: const TextStyle(
                                       color: Colors.white,
                                       fontWeight: FontWeight.w600,
                                       fontSize: 18
                                   ),),
                                 const SizedBox(height: 4,),
                                 Text("${myController.episodes.value[i]["episode_number"]}",style: const TextStyle(
                                     color: Colors.white30,
                                     fontSize: 18
                                 ),),
                               ],
                             ),],
                         ),

                         Column(
                           crossAxisAlignment: CrossAxisAlignment.end,
                           children: [
                             const SizedBox(height: 25,),
                             Text("${myController.episodes.value[i]["release_date"]}",
                               style: const TextStyle(
                                   color: Colors.white30,
                                   fontSize: 13
                               ),),
                           ],
                         ),
                         const SizedBox(width: 5,),
                       ],
                     ),
                   ),
                   onTap: (){
                     Get.to(Episodes(),arguments: {
                      "show":myController.episodes[i]['show'],
                       "episode_number":myController.episodes[i]['episode_number'],
                       "release_date":myController.episodes[i]['release_date'],
                       "poster":myController.episodes[i]['poster'],
                       "script":myController.episodes[i]['script'],
                     });
                   },
                 );
               }),)
           )
         ],
       ),
     ),
   );
  }
}

/*
 User? _user;
  @override
  void initState(){
    myController.getShows();
    // SeriesCont.getSeries();
    _getCurrentUser();

    super.initState();
  }
  Future<void> _getCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      _user = user;
    });
  }
 */