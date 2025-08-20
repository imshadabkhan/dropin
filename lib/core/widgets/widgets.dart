import 'package:dropin/core/constants/assets_constants.dart';
import 'package:dropin/core/constants/color_constants.dart';
import 'package:dropin/core/widgets/custom_button.dart';
import 'package:dropin/core/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Widgets{

static var heightSpaceH05 = SizedBox(
  height: 0.005.sh,
);
static var heightSpaceH1 = SizedBox(
  height: 0.01.sh,
);
static var heightSpaceH2 = SizedBox(
  height: 0.02.sh,
);
static var heightSpaceH3 = SizedBox(
  height: 0.03.sh,
);
static var heightSpaceH4 = SizedBox(
  height: 0.04.sh,
);
static var heightSpaceH5 = SizedBox(
  height: 0.05.sh,
);
static var widthSpaceW1 = SizedBox(
  width: 0.01.sw,
);
static var widthSpaceW2 = SizedBox(
  width: 0.02.sw,
);
static var widthSpaceW3 = SizedBox(
  width: 0.03.sw,
);
static var widthSpaceW4 = SizedBox(
  width: 0.04.sw,
);

static void showPopup(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // User must press button
    builder: (context) {
      return Dialog(backgroundColor: ColorConstants.whiteColor,
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
                Asset.popup_Image,
                height: 120,
              ),
              Widgets.heightSpaceH1,
              Texts.textBold("Are You a Business Owner?", size: 18),

              Widgets.heightSpaceH1,
              Texts.textNormal(
                "Add your business to be seen on DropIn!",
                size: 14,
                color: Colors.black54,

              ),

              Widgets.heightSpaceH1,

              CustomButton(
                icon:Image.asset(Asset.addBusinessIcon,height: 14,width: 14,),

                label: "Add Business",
                backgroundColor: ColorConstants.primaryColor,
                textColor: ColorConstants.whiteColor,
                onTap: () {
                  Get.back(); // close popup
                },
              )
            ],
          ),
        ),
      );
    },
  );
}


}