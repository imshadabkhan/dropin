


import 'package:dropin/core/constants/color_constants.dart';
import 'package:dropin/core/widgets/circular_index_widget.dart';
import 'package:dropin/view/starting/onboarding/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnboardingController extends GetxController {
  Rx<int> currentPage = 1.obs;

  final List<SliderObject> sliderData = [

    SliderObject(
      subTitle:"Plan the perfect surf trip with the DropIn App! Avoid unnecessary expenses, travel like a local, and make every surf adventure seamless.",

      title: "Plan the Perfect Surf Trip!" ,
      image: "assets/images/onboarding/img_1.png",
        backgroundImage: "assets/images/onboarding/onboarding_background_image_1.png"
    ),

    SliderObject(
      title:"Connect with Surfers Everywhere",
      subTitle:"Use DropIn to meet surfers, offer a Rideshare, or hire a photographer. Find travel buddies, share local insights, and make every trip more memorable!",
      image: "assets/images/onboarding/img_2.png",
       backgroundImage: "assets/images/onboarding/onboarding_image_background_image_2.png"
    ),

    SliderObject(
      title:  "Stay Surf-Ready,Anywhere",
      subTitle: "Locate surf shops, board rentals, and surf vibes anywhere. Get expert travel tips, gear recommendations, and essential logistics—all in one place.",
      image: "assets/images/onboarding/img_3.png",
    backgroundImage: "assets/images/onboarding/onboarding_background_image_3.png"
    ),


  ];

  Widget properCircleIndexWidget(int index) {
    return  index <= currentPage.value
        ? CircularIndexWidget(color: ColorConstants.circularIndexColor,)
        : CircularIndexWidget(color:Colors.white);
  }

  onPageChanged(int index) {
    currentPage.value = index + 1;
  }
}

