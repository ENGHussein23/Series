import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

import '../../controller/ProfileController.dart';
class Profile extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());
  TextEditingController NameController = TextEditingController();
  final _OutlineInputBorder=OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(8),
  );
  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic> arguments = Get.parameters;
    var userName=arguments['username'];
    return Scaffold(
      body: CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            flexibleSpace: Obx(() => AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              // height:  controller.isExpanded.value ?0:100,
              color: controller.isExpanded.value ? Colors.transparent : Colors.black,
              child: FlexibleSpaceBar(
                 centerTitle: true,
                title: Text(userName.toString()),
                background: Image.asset(
                  'assets/batsign.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            )),
            floating: true,
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(20),
              height: Get.height - kToolbarHeight - controller.flexibleSpaceMaxHeight.value,
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
              child: ListView(
                shrinkWrap: true,
                children: [
                  const SizedBox(height: 20,),
                  const Text("my personal info:",style: TextStyle(color: Colors.white,fontSize: 20),),
                  const SizedBox(height: 10,),
                  // name
                  TextFormField(
                    controller: NameController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      label: const Text("my name"),
                      labelStyle: const TextStyle(color: Colors.white),
                      hintStyle: const TextStyle(color: Colors.white),
                      enabledBorder:_OutlineInputBorder,
                      focusedBorder:_OutlineInputBorder,
                      border: _OutlineInputBorder,
                    ),
                  ),
                  // my age

                  ElevatedButton(
                    child: Obx(() => Text(Get.find<ProfileController>().selectedDate.value)),
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime(1997,09,20),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) {
                        Get.find<ProfileController>().selectedDate.value = picked.toString();
                      }
                    },
                  ),
                  const Divider(height: 10, thickness: 1, endIndent: 20, indent: 20, color: Colors.white60,),
                  ElevatedButton(onPressed: (){
                    Get.dialog(
                      AlertDialog(
                        backgroundColor: Colors.black87,
                        title: const Text('New Password',style: TextStyle(color: Colors.white),),
                        content:  Container(
                          // color: Colors.blueGrey,
                          height: 140,
                          child: Column(
                              children: [
                                TextFormField(
                                  controller: NameController,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    labelStyle: const TextStyle(color: Colors.white),
                                    hintStyle: const TextStyle(color: Colors.white),
                                    enabledBorder:_OutlineInputBorder,
                                    focusedBorder:_OutlineInputBorder,
                                    border: _OutlineInputBorder,
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                TextFormField(
                                  controller: NameController,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    labelStyle: const TextStyle(color: Colors.white),
                                    hintStyle: const TextStyle(color: Colors.white),
                                    enabledBorder:_OutlineInputBorder,
                                    focusedBorder:_OutlineInputBorder,
                                    border: _OutlineInputBorder,
                                  ),
                                ),
                              ],
                          ),

                        ),
                        actions: [
                          TextButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                          TextButton(
                            child: const Text('Save'),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ],
                      ),
                    );
                  }, child: const Text("update my password"),),
                  const Divider(height: 10, thickness: 1, endIndent: 20, indent: 20, color: Colors.white60,),
                  ElevatedButton(onPressed: (){
                    Get.dialog(
                      AlertDialog(
                        title: const Text('Update profile photo'),
                        content: const Text('Dialog Content'),
                        actions: [
                          TextButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                          TextButton(
                            child: const Text('Save'),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ],
                      ),
                    );
                  }, child: const Text("update my profile photo"),),
                  const Divider(height: 10, thickness: 2, endIndent: 20, indent: 20, color: Colors.white60,),
                  const SizedBox(height: 20,),
                  ElevatedButton(onPressed: (){}, child: const Text("Save"),),
                  const SizedBox(height: 20,),

                  // logout button
                  ElevatedButton(
                    onPressed: (){

                    AwesomeDialog(
                        context: context,
                        dialogType: DialogType.question,
                        dialogBackgroundColor: Colors.black87,
                        animType: AnimType.bottomSlide,
                        title: 'Log out?',
                        titleTextStyle: const TextStyle(color: Colors.white),
                        desc: 'Do you want to log out?',
                        descTextStyle: const TextStyle(color: Colors.white),
                        btnCancelOnPress: () {},
                    btnOkOnPress: () async{
                    await FirebaseAuth.instance.signOut();
                    Get.snackbar(
                      'logout successfully', '',
                      duration: const Duration(seconds: 2),
                      backgroundColor: const Color.fromARGB(100, 0, 200, 200),
                      colorText: Colors.white,
                      borderRadius: 10,);
                    Get.offAllNamed('/');
                    }
                    ,
                    btnOkText: 'yes logout',
                    ).show();},
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,children: const [
                      Icon(Icons.logout),
                      Text("Log out"),
                    ],),),
                  const SizedBox(height: 500,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}