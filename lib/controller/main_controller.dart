
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
class MainController extends GetxController{
  var shows_episodes;
  var shows=[].obs;
  var episodes=[].obs;
  late User CurrentUser;
  @override
  void onInit() {
    super.onInit();
    getShows();
    _getCurrentUser();
  }
  Future<void> _getCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;

    CurrentUser = user!;
    update();
  }
  Future<void> getShows() async {

    var jsonString = await rootBundle.loadString('assets/json/shows.json');
    var jsonMap = json.decode(jsonString);
    shows_episodes = Map<String, dynamic>.from(jsonMap).obs;
    shows.value = shows_episodes['shows'];
    episodes.value = shows_episodes['episodes'];
  }

}