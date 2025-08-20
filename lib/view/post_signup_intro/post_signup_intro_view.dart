import 'package:dropin/core/widgets/custom_button.dart';
import 'package:dropin/view/post_signup_intro/controller.dart';
import 'package:dropin/view/post_signup_intro/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../core/constants/assets_constants.dart';
import '../../core/constants/color_constants.dart';
import '../../core/widgets/text_widgets.dart';
import '../../core/widgets/widgets.dart';

class PostSingupView extends StatelessWidget {
   PostSingupView({super.key});
   final List<String> imageUrls = [
     Asset.gridView1,
     Asset.gridView2,
     Asset.gridView3,
     Asset.gridView4 ,
     Asset.gridView2,

        ];
   final PageController pageController = PageController();
  PostSigupController controller=Get.put(PostSigupController());
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {

      Widgets.showPopup(context);
    });
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        scrolledUnderElevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
mainAxisAlignment: MainAxisAlignment.start,
         
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  CircleAvatar(
                    radius: 45.r,
                    backgroundColor: ColorConstants.primaryColor,
                    child: CircleAvatar(
                      radius: 48.r,
                      backgroundImage: AssetImage(Asset.profileImage2),
                    ),
                  ),

                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(color: ColorConstants.lightPinkColor),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                          Image.asset(Asset.countryFlag,height: 50,width: 50,),
                           Container(height: 20,width: 2,color: Colors.pink),
                            Texts.textBold('New',size: 14),
                            Container(height: 20,width: 2,color: Colors.pink,),
                            Texts.textBold('Age 27yrs',size: 14),


                        ],),
                      ),
                    ),
                  )



                ],
              ),
            ),

            Widgets.heightSpaceH1,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Texts.textBold('Gold Smith',size: 16),
              Flexible(child:  Widgets.widthSpaceW1, ),

              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: CustomButton(
                    onTap: (){
                      Get.to(EditProfile());
                    },
                    textColor: ColorConstants.blackColor,
                    height: 40,

                    label: 'Edit Profile',backgroundColor: Color(0xFFE5E7EB),),
                ),
              ),


              ],),
            ),
            Widgets.heightSpaceH1,


      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ReadMoreText(
        'Travel surfer from Hawaii. Currently in Costa Rica with my van. I enjoy sunsets and barbeques, early morning surfs and good vibes! Read more...',
        trimLines: 3,
        colorClickableText: ColorConstants.greyTextColor,
        trimMode: TrimMode.Line,
        trimCollapsedText: 'Read more',
        trimExpandedText: 'Read less',
        style: TextStyle(
          fontSize: 12,
          fontFamily: "MontserratRegular",
          color: Colors.black,

        ),
        textAlign: TextAlign.start,
        moreStyle: TextStyle(
          fontSize: 14,
          fontFamily: "MontserratMedium",
          color: ColorConstants.blackColor,
        ),
        lessStyle: TextStyle(
          fontSize: 14,
          fontFamily: "MontserratMedium",
          color: ColorConstants.blackColor,

        ),
            ),
      ),

            Divider(color: ColorConstants.dividerColor,),
Widgets.heightSpaceH05,
    Padding(padding: EdgeInsets.symmetric(horizontal: 16),child:Texts.textBold("Your Current Dropins:", size: 16)),




            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: 110,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: 3,
                  onPageChanged: controller.onPageChanged,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 0.1,
                      child: Container(
                        padding: EdgeInsets.only(left: 6),
                        height: 80,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  Asset.dropinImage,
                                  width: 70.w,
                                  height: 70.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 12),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Texts.textBold("Looking to make friends", size: 13),
                                  SizedBox(height: 4),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: ColorConstants.greyBgColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                                      child: Texts.textNormal("2 Days Ago", size: 11, color: Colors.black45),
                                    ),
                                  ),
                                  Widgets.heightSpaceH05,
                                  Container(
                                    decoration: BoxDecoration(
                                      color: ColorConstants.greyBgColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 4),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(Asset.locationIcon, height: 12, width: 12),
                                          SizedBox(width: 4),
                                          Texts.textNormal("Puntarenas, Costa Rica", size: 11),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            SizedBox(height: 8),

            // Indicator dots
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                      (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: controller.properCircleIndexWidget(index + 1),
                  ),
                ),
              );
            }),
            Widgets.heightSpaceH1,
            Divider(color: ColorConstants.dividerColor,),

            Widgets.heightSpaceH1,

Padding(padding: EdgeInsets.symmetric(horizontal: 16),child:Texts.textBold("Your Images:", size: 16),),

            Widgets.heightSpaceH1,

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: MasonryGridView.count(


                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                shrinkWrap: true,
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      imageUrls[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            Widgets.heightSpaceH5,


          ],
        ),
      ),
    );
  }
}


