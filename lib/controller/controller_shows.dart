
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
class ShowsController extends GetxController{
  var shows_episodes;
  var shows=[].obs;
  var episodes=[].obs;
  @override
  void onInit() {
    super.onInit();
    getShows();
  }
  Future<void> getShows() async {

    var jsonString = await rootBundle.loadString('assets/json/shows.json');
    var jsonMap = json.decode(jsonString);
    shows_episodes = Map<String, dynamic>.from(jsonMap).obs;
    shows.value = shows_episodes['shows'];
    episodes.value = shows_episodes['episodes'];
  }

}