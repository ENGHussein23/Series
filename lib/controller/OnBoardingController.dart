import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController(initialPage: 0);
  var currentPage = 0.obs;

  void onPageChanged(int index) {
    currentPage = index as RxInt ;
    update();
  }

  void nextPage() {
    if (currentPage < 2) {
      currentPage.value++;
      pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }

  }

  void previousPage() {
    if (currentPage > 0) {
      currentPage.value--;
      pageController.previousPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}
