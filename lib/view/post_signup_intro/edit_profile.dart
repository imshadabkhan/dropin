import 'package:dropin/controller/date_and_time_controller.dart';
import 'package:dropin/core/constants/assets_constants.dart';
import 'package:dropin/core/constants/color_constants.dart';
import 'package:dropin/core/constants/padding_constants.dart';
import 'package:dropin/core/widgets/custom_button.dart';
import 'package:dropin/core/widgets/custom_drop_down.dart';
import 'package:dropin/core/widgets/entry_field.dart';
import 'package:dropin/core/widgets/text_widgets.dart';
import 'package:dropin/core/widgets/widgets.dart';
import 'package:dropin/view/profile/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  ProfileController profileController = Get.put(ProfileController());
  TextEditingController dobController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ColorConstants.blueBackgroundGradient1,
                    ColorConstants.blueBackgroundGradient2,
                  ]),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              titleSpacing: 0,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Texts.textBold("Edit Profile", size: 16),
              scrolledUnderElevation: 0,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: PaddingConstants.screenPaddingHorizontal,
                child: Column(
                  children: [
                    Widgets.heightSpaceH1,
                    Center(
                      child: Texts.textBold('Cover Photos', size: 16),
                    ),
                    Widgets.heightSpaceH1,
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        height: 160,
                        width: double.infinity, // Optional
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              Asset.containerImage,
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Center(
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: ColorConstants.primaryColor,
                            child: Image.asset(
                              Asset.addImgIcon,
                              height: 15,
                              width: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Widgets.heightSpaceH1,
                    Divider(
                      color: ColorConstants.whiteColor,
                    ),
                    Widgets.heightSpaceH1,
                    Texts.textBold('Profile Picture', size: 16),
                    Widgets.heightSpaceH1,
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          child: Image.asset(Asset.profileImage),
                        ),
                        CircleAvatar(
                          backgroundColor: ColorConstants.primaryColor,
                          radius: 16,
                          child: Image.asset(
                            Asset.addImgIcon,
                            height: 15,
                            width: 15,
                          ),
                        ),
                      ],
                    ),
                    Widgets.heightSpaceH1,
                    Divider(
                      color: ColorConstants.whiteColor,
                    ),
                    Widgets.heightSpaceH1,
                    Texts.textBold('Personal Details', size: 16),
                    Widgets.heightSpaceH1,
                    EntryField(
                      fillColor: ColorConstants.fillColor,
                      label: "Full Name", controller: nameController,
                      // prefixIcon: Assets.lockIcon,
                      hint: "Shadab khan",

                      suffixIcon: Icons.person_2_outlined,
                    ),
                    Obx(() => CustomDropdown(
                          labelColor: ColorConstants.whiteColor,
                          iconColor: ColorConstants.whiteColor,
                          color: ColorConstants.fillColor,
                          onTap: () {
                            profileController.pickCountry(context);
                          },
                          value: profileController.selectedCountry.value == ""
                              ? null
                              : profileController.selectedCountry.value,
                          hint: "--Select--",
                          label: "Country of Origin",
                        )),
                    Widgets.heightSpaceH1,
                    EntryField(
                      readOnly: true,
                      fillColor: ColorConstants.fillColor,
                      label: "Date of Birth",
                      hint: 'dd/mm/yyyy',
                      textColor: ColorConstants.whiteColor,
                      controller: dobController,
                      suffixIcon: Icons.calendar_month_outlined,
                      onTap: () => pickDateAndSetController(
                          context: context, controller: dobController),
                    ),
                    Widgets.heightSpaceH1,
                    CustomDropdown(
                      labelColor: ColorConstants.whiteColor,
                      iconColor: ColorConstants.whiteColor,
                      color: ColorConstants.fillColor,
                      onTap: () {},
                      value: "Intermediate",
                      hint: "New/Beginner/Intermediate/Expert",
                      label: "Skill Level",
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Texts.textNormal(
                          "Your Bio: Tell people who you are",
                          color: Colors.white,
                          size: 14),
                    ),
                    Widgets.heightSpaceH05,
                    EntryBigField(
                      fillColor: ColorConstants.fillColor,
                      maxLines: 20,
                    ),
                    Widgets.heightSpaceH3,
                    CustomButton(

                      color: ColorConstants.primaryColor,
                      // borderColor: otpController.text.length != 6
                      //     ? ColorConstants.blackColor
                      //     : ColorConstants.primaryColor,
                      label: "Update",
                      textColor: ColorConstants.whiteColor,
                      backgroundColor: ColorConstants.primaryColor,

                      radius: 10,
                      onTap: () {
                        Get.back();
                        showPopup(context);

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
                    Widgets.heightSpaceH2,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showPopup(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // User can't dismiss by tapping outside
    builder: (context) {
      /// Auto-close popup after 5 seconds
      Future.delayed(const Duration(seconds: 3), () {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
      });

      return Dialog(
        backgroundColor: ColorConstants.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// SVG image
              SvgPicture.asset(
                Asset.perfectImage,
                height: 120,
              ),
              Widgets.heightSpaceH1,
              Texts.textBold("Edited!", size: 18),

              Widgets.heightSpaceH1,
              Texts.textNormal(
                "You’ve edited your profile.",
                size: 14,
                color: Colors.black54,
              ),

              Widgets.heightSpaceH1,
            ],
          ),
        ),
      );
    },
  );
}

