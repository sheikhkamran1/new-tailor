import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:newtailor/view/bottomnavigation.dart';

import '../model/onboarding_info.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  var pageController = PageController();
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;

  forwardAction() {
    if (isLastPage) {
      Get.to(const BottomNavigatorScreen());
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNVwGZR2Uyo9_addLQ4o_6J_CHW_oUcbqQ-A&usqp=CAU",
        "Order Your Fashion",
        "Now you can order stitch any time right from your mobile"),
    OnboardingInfo(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPiS-LTVtPq2ogUMPNBOMW7ylASvtTCV4Zhw&usqp=CAU",
        "Order Your Fashion",
        "Now you can order stitch any time right from your mobile"),
    OnboardingInfo(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCT4ORLB0HEClX7V_NKdlTJ9c2dm9yayrUDQ&usqp=CAU",
        "Order Your Fashion",
        "Now you can order stitch any time right from your mobile"),
  ];
}
