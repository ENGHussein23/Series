import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/OnBoardingController.dart';
import './MyHomePage.dart';
import './Sign_in.dart';
import './Sign_up.dart';


class OnboardingScreen extends StatelessWidget {
  final OnboardingController controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: controller.pageController,
            onPageChanged: controller.onPageChanged,
            children: [
              MyHomePage(),
              Sign_in(),
              Sign_up(),
            ],
          ),
          Positioned(
            bottom: 32,
            left: 0,
            right: 0,
            child: Obx(() => DotsIndicator(
              dotsCount: 3,
              position: controller.currentPage.value,
              decorator: const DotsDecorator(
                color: Colors.white,
                activeColor: Colors.blueGrey,
              ),),
            )),
          Obx(() =>Visibility(
            visible:!(controller.currentPage.value==0),
            child:Positioned(
              bottom: 16,
              left: 16,
              child: ElevatedButton(
                child:
                Image(
                  image: AssetImage('assets/previous.png'),
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
                onPressed: controller.previousPage,
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  onPrimary: Colors.transparent, // Change this to the desired text color
                ),
              ),
            ), ), ),
          Obx(() =>   Visibility(
            visible:!(controller.currentPage.value==2),
            child:Positioned(
              bottom: 16,
              right: 16,
              child: ElevatedButton(
                child: Image(
                  image: AssetImage('assets/next.png'),
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
                onPressed: controller.nextPage,
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  onPrimary: Colors.transparent, // Change this to the desired text color
                ),
              ),
            ), ),),



        ],
      ),
    );
  }
}