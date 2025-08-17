import 'package:dropin/core/constants/padding_constants.dart';
import 'package:dropin/core/utils/utils.dart';
import 'package:dropin/view/authentication/controller/auth_controller.dart';
import 'package:dropin/view/authentication/view/email_verification_view.dart';
import 'package:dropin/view/authentication/view/login_view.dart';
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

class SignUpView extends StatelessWidget {
  final AuthenticationController authenticationController =
  Get.put(AuthenticationController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUpView({super.key});

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


                  Widgets.heightSpaceH2,
                  formSection(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Texts.textNormal("Already have an account?  ",
                          color: ColorConstants.whiteColor, size: 12),
                      GestureDetector(
                        onTap: () {
                          Get.to(LoginView());
                        },
                        child: Texts.textBlock("Log in",
                            color: ColorConstants.whiteColor,
                            size: 13,
                            decoration: TextDecoration.underline,

                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
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
        Texts.textBold("Create Account",
            color: ColorConstants.whiteColor, size: 20),
        Widgets.heightSpaceH5,
        Obx(
              () => EntryField(
            label: "Full Name",
            fillColor: Colors.transparent,
            controller: passwordController,
            // prefixIcon: Assets.lockIcon,
            hint: "Shadab khan",
            obscureText: authenticationController.obscured.value,

            suffixIcon: Icons.person_2_outlined,

          ),
        ),
        Widgets.heightSpaceH05,
        EntryField(
          label: "Email Address",
          fillColor: Colors.transparent,
          controller: emailController,
          suffixIcon: Icons.person_2_outlined,
          hint: "Shadabkhan@gmail.com",

        ),
        Widgets.heightSpaceH05,
        Obx(
              () => EntryField(
            label: "Password",
            fillColor: Colors.transparent,
            controller: passwordController,
            // prefixIcon: Assets.lockIcon,
            hint: "********",
            obscureText: authenticationController.obscured.value,

                suffixIcon: authenticationController.obscured.value == false
                    ? CupertinoIcons.eye_slash
                    : Icons.remove_red_eye_outlined,
                onTrailingTap: () {
                  authenticationController.toggleObscured();
                },

          ),
        ),
        Widgets.heightSpaceH05,
        Obx(
              () => EntryField(
            label: "Confirm Password",
            fillColor: Colors.transparent,
            controller: passwordController,
            // prefixIcon: Assets.lockIcon,
            hint: "Type your password",
            obscureText: authenticationController.obscured.value,

            suffixIcon: authenticationController.obscured.value == false
                ? CupertinoIcons.eye_slash
                : Icons.remove_red_eye_outlined,
            onTrailingTap: () {
              authenticationController.toggleObscured();
            },
          ),
        ),
        Widgets.heightSpaceH05,



        Row(
          children: [
            const Expanded(
                child: Divider(
                  color: Colors.white,
                  thickness: .5,
                )),
            Padding(
              padding: PaddingConstants.contentPadding,
              child: Container(
                child: Texts.textNormal("OR", color: ColorConstants.whiteColor, size: 12),
              ),
            ),
            const Expanded(
                child: Divider(
                  color: Colors.white,
                  thickness: .5,
                )),
          ],
        ),
        Widgets.heightSpaceH3,


        Row(children: [
          Expanded(
            child: CustomButton(
              iconGap: 8,
              icon: Image.asset(
                Asset.googleIcon,
                height: 16,
                width: 16,
              ),
              label: "Login with Google",

              textColor: ColorConstants.whiteColor,
              backgroundColor: Colors.transparent,
              radius: 10,
              borderColor: ColorConstants.greyBgColor,
              onTap: () {},
            ),
          ),
          Widgets.widthSpaceW2,
          Expanded(
            child: CustomButton(
              icon: Image.asset(
                Asset.appleIcon,
                height: 16,
                width: 16,
              ),
              iconGap: 8,
              label: "Login with Apple",
              textColor: ColorConstants.whiteColor,
              backgroundColor: Colors.transparent,
              radius: 10,
              borderColor: ColorConstants.greyBgColor,
              onTap: () {},
            ),
          ),
        ],),
        Widgets.heightSpaceH3,
        CustomButton(
          label: "Register",
          textColor: ColorConstants.whiteColor,
          backgroundColor: ColorConstants.primaryColor,
          radius: 10,
          onTap: () {
            Get.to(()=>VerificationView());


          },
        ),

        Widgets.heightSpaceH2,

      ],
    );
  }
}
