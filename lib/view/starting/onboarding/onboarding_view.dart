import 'package:dropin/core/constants/color_constants.dart';
import 'package:dropin/core/widgets/custom_button.dart';
import 'package:dropin/core/widgets/widgets.dart';
import 'package:dropin/view/starting/onboarding/controller.dart';
import 'package:dropin/view/starting/onboarding/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/widgets/text_widgets.dart';

class BoardingView extends StatelessWidget {
  OnboardingController onboardingController = Get.put(OnboardingController());
  final PageController controller = PageController();

  BoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
                itemCount: onboardingController.sliderData.length,
                controller: controller,
                onPageChanged: onboardingController.onPageChanged,
                itemBuilder: (context, index) {
                  return OnBoardingPage(onboardingController.sliderData[index]);
                }),
            Padding(
              padding: const EdgeInsets.all(16.0).copyWith(bottom: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: onboardingController
                              .properCircleIndexWidget(index + 1),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: Widgets.heightSpaceH5.height! * 2.9,
                  ),

                  // Login Button
                  CustomButton(
                    label: "Login",
                    backgroundColor: ColorConstants.primaryColor,
                  ),

                  Widgets.heightSpaceH05,

                  // Skip
                  TextButton(
                    onPressed: () {
                      // Handle skip
                    },
                    child: Texts.textMedium("Skip",
                        color: ColorConstants.greyTextColor, size: 14),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;
  final OnboardingController controller = Get.find<OnboardingController>();

  OnBoardingPage(this._sliderObject, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Top-left background shape that reacts to page number
        Obx(() {
          return Positioned(
            top: 0,
            left: controller.currentPage.value != 2 ? -40 : 200,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(_sliderObject.backgroundImage!),
                ),
              ),
            ),
          );
        }),

        // Main content
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: Widgets.heightSpaceH5.height! * 2),

              // Main image
              Image.asset(
                _sliderObject.image!,
                height: 250,
                width: 250,
              ),

              Widgets.heightSpaceH3,

              Texts.textBold(
                _sliderObject.title ?? "",
                size: 18,
                textAlign: TextAlign.center,
              ),

              Widgets.heightSpaceH2,

              Texts.textNormal(
                _sliderObject.subTitle ?? "",
                color: ColorConstants.greyTextColor,
                size: 14,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
