import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/ProfileController.dart';
class Profile extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());
  TextEditingController NameController = TextEditingController();
  var _OutlineInputBorder=OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
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
              duration: Duration(milliseconds: 500),
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
              padding: EdgeInsets.all(20),
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
                  SizedBox(height: 20,),
                  Text("my personal info:",style: TextStyle(color: Colors.white,fontSize: 20),),
                  SizedBox(height: 10,),
                  // name
                  TextFormField(
                    controller: NameController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      label: Text("my name"),
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
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
                        title: Text('New Password',style: TextStyle(color: Colors.white),),
                        content:  Container(
                          // color: Colors.blueGrey,
                          height: 140,
                          child: Column(
                              children: [
                                TextFormField(
                                  controller: NameController,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(color: Colors.white),
                                    hintStyle: TextStyle(color: Colors.white),
                                    enabledBorder:_OutlineInputBorder,
                                    focusedBorder:_OutlineInputBorder,
                                    border: _OutlineInputBorder,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                TextFormField(
                                  controller: NameController,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(color: Colors.white),
                                    hintStyle: TextStyle(color: Colors.white),
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
                            child: Text('Cancel'),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                          TextButton(
                            child: Text('Save'),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ],
                      ),
                    );
                  }, child: Text("update my password"),),
                  const Divider(height: 10, thickness: 1, endIndent: 20, indent: 20, color: Colors.white60,),
                  ElevatedButton(onPressed: (){
                    Get.dialog(
                      AlertDialog(
                        title: Text('Update profile photo'),
                        content: Text('Dialog Content'),
                        actions: [
                          TextButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                          TextButton(
                            child: Text('Save'),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ],
                      ),
                    );
                  }, child: Text("update my profile photo"),),
                  const Divider(height: 10, thickness: 2, endIndent: 20, indent: 20, color: Colors.white60,),
                  SizedBox(height: 20,),
                  ElevatedButton(onPressed: (){}, child: Text("Save"),),
                  SizedBox(height: 20,),
                  ElevatedButton(onPressed: (){}, child: Text("Log out!"),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}