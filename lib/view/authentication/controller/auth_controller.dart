import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  // late UserController userController;
  RxBool isCheck = false.obs;
  RxBool is18Check = false.obs;
  RxBool obscured = false.obs;
  String? email;
  String? userID;
  RxBool checkboxValue=false.obs;

  void toggleCheckBox(){
    checkboxValue.value=!checkboxValue.value;

  }
  void toggleObscured() {
    obscured.value = !obscured.value;
  }

  RxBool isHostSelected = false.obs;
  toggleButton() {
    isHostSelected.value = !isHostSelected.value;
  }


  void loginUser(String emailString, String password) async {
    // try {
    //   // Widgets.showLoader("Loading.. ");
    //
    //   var response = await ApiService.postData(
    //       Endpoints.login, {"email": emailString, "password": password});
    //   // Widgets.hideLoader();
    //
    //   if (response.status == true) {
    //     UserModel userModel = UserModel.fromJson(response.data['user']);
    //     email = null;
    //     userID = null;
    //     email = userModel.email;
    //     userID = userModel.id.toString();
    //     update();
    //     if (userModel.isVerified == 1 && userModel.isActive == 1) {
    //       userController.saveUser(userModel, response.data['token']);
    //       userController.fetchUser();
    //
    //       if (userModel.role == 1) {
    //         Get.offAll(() => TravellerNavScreen());
    //       } else {
    //         Get.offAll(() => HostNavScreen());
    //       }
    //
    //       // _userController.updateTokenDetails();
    //     } else if (userModel.isVerified == 0) {
    //        Get.to(() => EmailVerificationView());
    //       Widgets.showSnackBar("Error", response.message ?? "");
    //     }
    //   } else {
    //     Widgets.showSnackBar("Error", response.message ?? "");
    //   }
    // } catch (e) {
    //   log(e.toString());
    //   Widgets.showSnackBar("Error", e.toString());
    // } finally {
    //   Widgets.hideLoader();
    // }
  }

  void signupUser({var data}) async {
    // try {
    //   // Widgets.showLoader("Creating account..");
    //
    //   var response = await ApiService.postData(Endpoints.signup, data);
    //
    //   Widgets.hideLoader();
    //
    //   if (response.status == true) {
    //     userID = response.data['user_id'];
    //     // log("USERID:${userID.toString()}");
    //     update();
    //     Get.back();
    //
    //     Get.off(() => EmailVerificationView());
    //   } else {
    //     Widgets.showSnackBar("Error", response.message ?? "");
    //   }
    // } catch (e) {
    //   Widgets.showSnackBar("Error", e.toString());
    // } finally {
    //   Widgets.hideLoader();
    // }
  }

  requestForgotPassword(String emailString) async {
    // try {
    //   Widgets.showLoader("Loading.. ");
    //
    //   var payload = {"email": emailString};
    //
    //   var response =
    //       await ApiService.postData(Endpoints.requestForgotPassword, payload);
    //
    //   Widgets.hideLoader();
    //
    //   if (response.status == true) {
    //     email = emailString;
    //     update();
    //     Widgets.showSnackBar("Success", response.message ?? "");
    //     Get.to(() => VerificationView());
    //   } else {
    //     Widgets.showSnackBar("Error", "Invalid Email");
    //   }
    // } catch (e) {
    //   Widgets.hideLoader();
    //   Widgets.showSnackBar("Error", "Something went Wrong");
    // }
  }

  resendForgotOtp(String emailString) async {
    // try {
    //   Widgets.showLoader("Loading.. ");
    //
    //   var payload = {"email": emailString};
    //
    //   var response =
    //       await ApiService.postData(Endpoints.requestForgotPassword, payload);
    //
    //   Widgets.hideLoader();
    //
    //   if (response.status == true) {
    //     email = emailString;
    //     update();
    //     Widgets.showSnackBar("Success", response.message ?? "");
    //     Get.toNamed(AppRoutes.resetPassword);
    //   } else {
    //     Widgets.showSnackBar("Error", "Invalid Email");
    //   }
    // } catch (e) {
    //   Widgets.hideLoader();
    //   Widgets.showSnackBar("Error", "Something went Wrong");
    // }
  }

  resendMailOtp(String email) async {
    // try {
    //   Widgets.showLoader("Loading.. ");
    //
    //   var payload = {"email": email};
    //
    //   var response = await ApiService.postData(Endpoints.sendMailOtp, payload);
    //
    //   Widgets.hideLoader();
    //   update();
    //   if (response.status == true) {
    //     Widgets.showSnackBar("Success", response.message ?? "");
    //   } else {
    //     Widgets.showSnackBar(
    //         "Error", response.message ?? "Something went wrong");
    //   }
    // } catch (e) {
    //   Widgets.hideLoader();
    //   Widgets.showSnackBar("Error", "Something went Wrong");
    // } finally {
    //   Widgets.hideLoader();
    // }
  }

  verifyOTP(String userId, String otpCode) async {
    // Widgets.showLoader("Verifying OTP");
    // try {
    //   var payload = {"user_id": userId, "otp": otpCode};
    //   var response = await ApiService.postData(Endpoints.verifyOTP, payload);
    //   // Widgets.hideLoader();
    //   if (response.status == true) {
    //     UserModel userModel = UserModel.fromJson(response.data['user']);
    //     userController.saveUser(userModel, response.data['access_token']);
    //     userController.fetchUser();
    //
    //     if (userModel.role == 1) {
    //       Get.offAll(() => TravellerNavScreen());
    //     } else {
    //       Get.offAll(() => HostNavScreen());
    //     }
    //   } else {
    //     Widgets.showSnackBar("Error", response.message ?? "Invalid Code");
    //   }
    // } catch (e) {
    //   Widgets.hideLoader();
    //   Widgets.showSnackBar("Error", e.toString());
    // }
  }

  verifyForgotOTP(String otpCode) async {
    // Widgets.showLoader("Verifying OTP");
    //
    // try {
    //   var payload = {"email": email, "otp": otpCode};
    //   var response =
    //       await ApiService.postData(Endpoints.verifyResetOTP, payload);
    //
    //   Widgets.hideLoader();
    //   if (response.status == true) {
    //     userID = null;
    //     email = email;
    //     userID = response.data['user']['id'];
    //     update();
    //     // Get.off(() => ResetPasswordView());
    //   } else {
    //     Widgets.showSnackBar("Error", response.message ?? "Invalid Code");
    //   }
    // } catch (e) {
    //   Widgets.hideLoader();
    //   Widgets.showSnackBar("Error", e.toString());
    // }
  }

  resetForgotPassword(
      String password,
      ) async {
    //   Widgets.showLoader("Loading..");
    //
    //   try {
    //     var payload = {
    //       "email": email,
    //       "password": password,
    //       "user_id": userID,
    //       "password_confirmation": password
    //     };
    //     var response =
    //         await ApiService.postData(Endpoints.resetPassword, payload);
    //
    //     Widgets.hideLoader();
    //     if (response.status == true) {
    //       email = null;
    //       userID = null;
    //       Widgets.showSnackBar("Success", response.message.toString());
    //       Get.offAll(() => LoginView());
    //     } else {
    //       Widgets.showSnackBar("Error", response.message.toString());
    //     }
    //   } catch (e) {
    //     Widgets.hideLoader();
    //     Widgets.showSnackBar("Error", e.toString());
    //   }
    // }
  }}
