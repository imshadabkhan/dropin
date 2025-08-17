import 'package:dropin/core/constants/padding_constants.dart';
import 'package:dropin/core/utils/utils.dart';
import 'package:dropin/view/authentication/controller/auth_controller.dart';
import 'package:dropin/view/authentication/view/forgot_password_view.dart';
import 'package:dropin/view/authentication/view/registration_view.dart';
import 'package:dropin/view/profile/profile_setup_view.dart';
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

class LoginView extends StatelessWidget {
  final AuthenticationController authenticationController =
  Get.put(AuthenticationController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginView({super.key});

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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Texts.textNormal("Don't have an account?  ",
                          color: ColorConstants.whiteColor, size: 12),
                      GestureDetector(
                        onTap: () {
                           Get.to(SignUpView());
                        },
                        child: Texts.textBlock("Signup",
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
        Texts.textBold("Login",
            color: ColorConstants.whiteColor, size: 20),
        Widgets.heightSpaceH3,
        EntryField(
          label: "Email Address",
          fillColor: Colors.transparent,
          controller: emailController,
           suffixIcon: Icons.person_2_outlined,
          hint: "Type your email",

        ),
        Widgets.heightSpaceH1,
        Obx(
              () => EntryField(
                label: "Password",
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
        Widgets.heightSpaceH1,
        GestureDetector(
          onTap: () {
             Get.to(ForgotPassword());
          },
          child: Align(
            alignment: Alignment.topRight,
            child: Texts.textNormal(
              "Forgot Password?",
              decoration: TextDecoration.underline,
              color: Colors.white,
              size: 12,
            ),
          ),
        ),

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
          label: "Login",
          textColor: ColorConstants.whiteColor,
          backgroundColor: ColorConstants.primaryColor,
          radius: 10,
          onTap: () {
            Get.to(ProfileSetupView());

            // if (!GetUtils.isEmail(emailController.text)) {
            //   Widgets.showSnackBar(
            //       "Incomplete Form", "Please enter valid email");
            // } else if (passwordController.text.length < 6) {
            //   Widgets.showSnackBar("Incomplete Form",
            //       "Please enter password min length 6 characters");
            // } else {
            //   authenticationController.loginUser(
            //       emailController.text.toString(),
            //       passwordController.text.toString());
            // }
            // Get.toNamed(AppRoutes.subscriptionView);
          },
        ),

        Widgets.heightSpaceH2,

      ],
    );
  }
}
