import 'package:dropin/core/constants/assets_constants.dart';
import 'package:dropin/view/authentication/controller/auth_controller.dart';
import 'package:dropin/view/authentication/view/login_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../core/constants/color_constants.dart';
import '../../../core/constants/padding_constants.dart';

import '../../../core/widgets/custom_button.dart';

import '../../../core/widgets/text_widgets.dart';
import '../../../core/widgets/widgets.dart';



class VerificationView extends StatefulWidget {
  const VerificationView({super.key});

  @override
  _VerificationViewState createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  final TextEditingController otpController= TextEditingController();
  final AuthenticationController authenticationController = AuthenticationController();

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
                color: Colors.black.withOpacity(0.4), // adjust as needed
              ),
            ),

            Padding(
              padding: PaddingConstants.screenPaddingHalf,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Widgets.heightSpaceH5,
                  Widgets.heightSpaceH1,
                  Texts.textBold('Verification',size: 22,color: ColorConstants.whiteColor),
                  Widgets.heightSpaceH2,
                  Texts.textNormal(
                    "An 6 Digit Code has been sent to your email address. Enter code to verify your email address",
                    color: ColorConstants.whiteColor,
                    size: 13,
                    textAlign: TextAlign.center,
                  ),
                  Widgets.heightSpaceH3,
Row(children: [
  Texts.textNormal(
    "Enter 6 Digit Code",
    color: ColorConstants.whiteColor,
    size: 13,
    textAlign: TextAlign.start,
  ),
],),

                  Widgets.heightSpaceH1,
                  PinCodeTextField(
                    controller: otpController,
                    appContext: context,
                    length: 6,
                    autoDisposeControllers: true,
                    animationType: AnimationType.fade,
                    textStyle:  TextStyle(color: ColorConstants.whiteColor),
                    pinTheme: PinTheme(
                        fieldWidth: .12.sw,
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(10),
                        borderWidth: .5,
                        selectedBorderWidth: .8,
                        activeBorderWidth: .5,
                        activeFillColor: Colors.transparent,
                        inactiveFillColor: ColorConstants.whiteColor,
                        inactiveBorderWidth: .5,


                        selectedColor: ColorConstants.whiteColor,
                        activeColor: Colors.white,
                        selectedFillColor: ColorConstants.whiteColor,
                        inactiveColor: Colors.white),
                    cursorColor:ColorConstants.blackColor,
                    animationDuration: Duration(milliseconds: 300),


                    keyboardType: TextInputType.number,
                    onCompleted: (v) {
                      if (kDebugMode) {
                        print("Completed");
                      }
                    },
                    onChanged: (value) {},
                    beforeTextPaste: (text) {
                      if (kDebugMode) {
                        print("Allowing to paste $text");
                      }
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  ),






                  Widgets.heightSpaceH05,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Texts.textNormal("Didn’t receive? ", color: ColorConstants.greyBgColor, size: 12),

                      Texts.textNormal("Resend", color: ColorConstants.whiteColor, size: 12,decoration: TextDecoration.underline),


                    ],
                  ),
                  const Spacer(),
                  CustomButton(

                    color: ColorConstants.primaryColor,
                    borderColor:  otpController.text.length != 6
                        ? ColorConstants.blackColor
                        : ColorConstants.primaryColor,
                    label: "Verify OTP",
                    textColor: otpController.text.length != 6?ColorConstants.blackColor:ColorConstants.whiteColor,
                    backgroundColor: otpController.text.length != 6
                        ? ColorConstants.greyBgColor
                        : ColorConstants.primaryColor,
                    radius: 10,
                    onTap: (){
                      if (otpController.text.length != 6){
                      } else {
                        // authenticationController.resendForgotOtp(
                        //     authenticationController.email ?? "");
                        // Get.to(ResetPasswordView());
                      }
                    },
                  ),
Widgets.heightSpaceH1,
                  CustomButton(

                    borderColor:  ColorConstants.whiteColor,

                    label: "Back To Login",
textColor: ColorConstants.whiteColor,
                    backgroundColor: Colors.transparent,

                    radius: 10,
                    onTap: (){
                      Get.to(()=>LoginView());

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

