import 'package:dropin/view/profile/profile_setup_view.dart';
import 'package:dropin/view/authentication/view/email_verification_view.dart';
import 'package:dropin/view/authentication/view/forgot_password_view.dart';
import 'package:dropin/view/authentication/view/login_view.dart';
import 'package:dropin/view/authentication/view/registration_view.dart';
import 'package:dropin/view/starting/onboarding/onboarding_view.dart';
import 'package:dropin/view/starting/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'view/authentication/view/change_password_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home:  SplashScreen(), // Custom splash screen
        );
      },
    );
  }
}
