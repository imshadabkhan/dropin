import 'package:dropin/core/constants/padding_constants.dart';
import 'package:dropin/core/utils/utils.dart';
import 'package:dropin/view/authentication/controller/auth_controller.dart';
import 'package:dropin/view/authentication/view/registration_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';


import '../../../../core/constants/assets_constants.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/entry_field.dart';

import '../../../../core/widgets/text_widgets.dart';
import '../../../../core/widgets/widgets.dart';

class ForgotPassword extends StatelessWidget {
  final AuthenticationController authenticationController =
  Get.put(AuthenticationController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.hideKeyboard(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,

        backgroundColor: ColorConstants.whiteColor,
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                Asset.authBackgroundImage,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.7), // adjust as needed
              ),
            ),
            Padding(
              padding: PaddingConstants.screenPaddingHalf,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Widgets.heightSpaceH5,

                  Image.asset(
                    Asset.appLogo,
                    width: .40.sw,
                  ),
                  Widgets.heightSpaceH2,
                  formSection(),


                  Widgets.heightSpaceH2,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  formSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Texts.textBold("ForgotPassword",
            color: ColorConstants.whiteColor, size: 20),
        Widgets.heightSpaceH3,
        EntryField(
            label: "Enter Your Email",
            fillColor: Colors.transparent,
            controller: passwordController,
            // prefixIcon: Assets.lockIcon,
            hint: "Shadabkhan@gmail.com",


                  suffixIcon: Icons.person_2_outlined
          ),

        Widgets.heightSpaceH1,
        EntryField(
            label: "Enter Your Email Again",
            fillColor: Colors.transparent,
            controller: passwordController,
            // prefixIcon: Assets.lockIcon,
            hint: "Shadabkhan@gmail.com",


            suffixIcon: Icons.person_2_outlined
          ),




        Widgets.heightSpaceH5,

        CustomButton(
          label: "Continue",
          textColor: ColorConstants.whiteColor,
          backgroundColor: ColorConstants.primaryColor,
          radius: 10,
          onTap: () {


          },
        ),
        Widgets.heightSpaceH2,

        CustomButton(
          label: "Cancel",
          textColor: ColorConstants.whiteColor,
          borderColor: ColorConstants.whiteColor,

          radius: 10,
          onTap: () {
Get.back();

          },
        ),

        Widgets.heightSpaceH2,

      ],
    );
  }
}
