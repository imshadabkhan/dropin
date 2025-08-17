import 'package:dropin/core/constants/assets_constants.dart';
import 'package:dropin/core/widgets/custom_drop_down.dart';
import 'package:dropin/core/widgets/entry_field.dart';
import 'package:dropin/view/authentication/add_photos_view.dart';
import 'package:dropin/view/authentication/controller/auth_controller.dart';
import 'package:dropin/view/profile/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/color_constants.dart';
import '../../../core/constants/padding_constants.dart';

import '../../../core/widgets/custom_button.dart';

import '../../../core/widgets/text_widgets.dart';
import '../../../core/widgets/widgets.dart';

class ProfileSetupView extends StatefulWidget {
  const ProfileSetupView({super.key});

  @override
  _ProfileSetupViewState createState() => _ProfileSetupViewState();
}

class _ProfileSetupViewState extends State<ProfileSetupView> {
  final TextEditingController otpController = TextEditingController();
  final AuthenticationController authenticationController =
      AuthenticationController();
  final profileController=Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: ColorConstants.whiteColor,
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                Asset.backgroundImage2,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.2), // adjust as needed
              ),
            ),
            Padding(
              padding: PaddingConstants.screenPaddingHalf,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Widgets.heightSpaceH5,
                  Texts.textBold('Profile Setup',
                      size: 22, color: ColorConstants.whiteColor),
                  Widgets.heightSpaceH2,
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(

                        radius: 60,
                        child: Image(image: AssetImage(Asset.profileImage)),
                      ),
                      CircleAvatar(
                        backgroundColor: ColorConstants.primaryColor,
                        radius: 16,
                        child: Image(
                          image: AssetImage(
                            Asset.addImgIcon,
                          ),
                          height: 15,
                          width: 15,
                        ),
                      ),
                    ],
                  ),
                  Widgets.heightSpaceH2,
                  Obx(() => CustomDropdown(
                    labelColor: ColorConstants.whiteColor,
                        iconColor: ColorConstants.blackColor,
                        color: Colors.transparent,
                        onTap: () {
                          profileController.pickCountry(context);
                        },
                        value: profileController.selectedCountry.value == ""
                            ? null
                            : profileController.selectedCountry.value,
                        hint: "--Select--",
                        label: "Country",
                      )),
                  Widgets.heightSpaceH1,
                  EntryField(
                    fillColor: Colors.transparent,
                    label: "Date of Birth",
                    hint: 'dd//mm//yyyy',
                    suffixIcon: Icons.calendar_month_outlined,
                  ),
                  Widgets.heightSpaceH1,
                  Obx(() => CustomDropdown(
                    labelColor: ColorConstants.whiteColor,
                    iconColor: ColorConstants.blackColor,
                    color: Colors.transparent,
                    onTap: () {
                      // profileController.pickCountry(context);
                    },
                    value: profileController.selectedCountry.value == ""
                        ? null
                        : profileController.selectedCountry.value,
                    hint: "New/Beginner/Intermediate/Expert",
                    label: "Skill Level",
                  )),
                  const Spacer(),
                  CustomButton(
                    color: ColorConstants.primaryColor,
                    borderColor: otpController.text.length != 6
                        ? ColorConstants.blackColor
                        : ColorConstants.primaryColor,
                    label: "Continue",
                    textColor: ColorConstants.whiteColor,
                    backgroundColor: ColorConstants.primaryColor,
                    radius: 10,
                    onTap: () {
                      Get.to(()=>AddPhotosView());
                      if (otpController.text.length != 6) {
                      } else {
                        // authenticationController.resendForgotOtp(
                        //     authenticationController.email ?? "");
                        // Get.to(ResetPasswordView());
                      }
                    },
                  ),
                  Widgets.heightSpaceH2,
                  CustomButton(
                    borderColor: ColorConstants.whiteColor,
                    label: "Back",
                    textColor: ColorConstants.whiteColor,
                    backgroundColor: Colors.transparent,
                    radius: 10,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Widgets.heightSpaceH1,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
