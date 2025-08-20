import 'package:dropin/core/constants/assets_constants.dart';
import 'package:dropin/core/constants/color_constants.dart';
import 'package:dropin/core/constants/padding_constants.dart';
import 'package:dropin/core/widgets/custom_button.dart';
import 'package:dropin/core/widgets/custom_drop_down.dart';
import 'package:dropin/core/widgets/entry_field.dart';
import 'package:dropin/core/widgets/text_widgets.dart';
import 'package:dropin/core/widgets/widgets.dart';
import 'package:dropin/view/authentication/add_photos_view.dart';
import 'package:dropin/view/authentication/controller/auth_controller.dart';
import 'package:dropin/view/profile/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



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
      child:Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
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
                color: Colors.black.withOpacity(0.4),
              ),
            ),

            Positioned.fill(
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: PaddingConstants.screenPaddingHalf.copyWith(
                    bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Widgets.heightSpaceH3,
                      Texts.textBold('Profile Setup',
                          size: 22, color: ColorConstants.whiteColor),
                      Widgets.heightSpaceH2,

                      /// Profile Image with Edit Icon
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

                      Widgets.heightSpaceH2,

                      /// Country Dropdown
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

                      /// DOB Field
                      EntryField(
                        fillColor: Colors.transparent,
                        label: "Date of Birth",
                        hint: 'dd/mm/yyyy',
                        suffixIcon: Icons.calendar_month_outlined,
                      ),

                      Widgets.heightSpaceH1,

                      /// Skill Level Dropdown
                     CustomDropdown(
                        labelColor: ColorConstants.whiteColor,
                        iconColor: ColorConstants.blackColor,
                        color: Colors.transparent,
                        onTap: () {},
                        value: "Intermediate",
                        hint: "New/Beginner/Intermediate/Expert",
                        label: "Skill Level",
                      ),

                      Widgets.heightSpaceH3,

                      /// Continue Button
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
                          Get.to(() => AddPhotosView());
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
      ),

    );
  }
}
