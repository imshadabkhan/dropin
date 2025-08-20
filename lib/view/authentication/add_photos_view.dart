import 'package:dropin/core/constants/padding_constants.dart';
import 'package:dropin/core/widgets/widgets.dart';
import 'package:dropin/view/post_signup_intro/post_signup_intro_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../core/constants/color_constants.dart';
import '../../core/constants/assets_constants.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/text_widgets.dart';

class AddPhotosView extends StatelessWidget {
  final TextEditingController bioController = TextEditingController();

  AddPhotosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              Asset.backgroundImage2, // Your background image path
              fit: BoxFit.cover,
            ),
          ),
    
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.4), // adjust as needed
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              child: SingleChildScrollView(
                padding: PaddingConstants.screenPaddingHalf.copyWith(
                  bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Widgets.heightSpaceH3,
                    Texts.textBold("Add Photos",
                  size: 18,
                        color: Colors.white,
                        ),

                 Widgets.heightSpaceH3,

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Texts.textMedium("Upload Images",
                          color: Colors.white, size: 14.sp),
                    ),
                    Widgets.heightSpaceH05,
                    DottedBorder(
                      color: Colors.white54,
                      strokeWidth: 1,
                      dashPattern: [6, 4], // [dash length, space length]
                      borderType: BorderType.RRect,
                      radius: Radius.circular(10),
                      child: Container(
                        width: double.infinity,
                        height: 160.h,
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 24.r,
                                child: Image.asset(
                                  Asset.addImgIcon,
                                  color: ColorConstants.primaryColor,
                                  colorBlendMode: BlendMode.srcIn,
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Texts.textNormal("Upload Photos",
                                  color: Colors.white, size: 14.sp)
                            ],
                          ),
                        ),
                      ),
                    ),

                    Widgets.heightSpaceH3,


                    Align(
                      alignment: Alignment.centerLeft,
                      child: Texts.textMedium("Tell people who you are (BIO)",
                          color: Colors.white, size: 14.sp),
                    ),
                    Widgets.heightSpaceH05,
                    Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white54, width: 1),
                      ),
                      child: TextField(
                        controller: bioController,
                        maxLength: 160,
                        maxLines: 5,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Write here...",
                          hintStyle:
                          TextStyle(color: Colors.white54, fontSize: 13.sp),
                          border: InputBorder.none,
                          counterStyle: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),

                    Widgets.heightSpaceH5,
                    Widgets.heightSpaceH2,
                    // 🔸 Finish Button
                    CustomButton(
                      label: "Finish",
                      radius: 10,
                      backgroundColor: ColorConstants.primaryColor,
                      textColor: Colors.white,
                      onTap: () {
                        Get.to(PostSingupView());
                        // Handle finish
                      },
                    ),
                    Widgets.heightSpaceH2,

                    // 🔸 Back Button
                    CustomButton(
                      label: "Back",
                      radius: 10,
                      backgroundColor: Colors.transparent,
                      borderColor: Colors.white,
                      textColor: Colors.white,
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
            ),

          )],
      ),
    );
  }
}
