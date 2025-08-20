import 'package:dropin/core/constants/color_constants.dart';
import 'package:dropin/core/widgets/circular_index_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostSigupController extends GetxController {
  var currentPage = 1.obs;  // RxInt for reactive page tracking

  Widget properCircleIndexWidget(int index) {
    return index <= currentPage.value
        ? CircularIndexWidget(color: ColorConstants.primaryColor)
        : CircularIndexWidget(color: Colors.white);
  }

  void onPageChanged(int index) {
    currentPage.value = index + 1;  // update currentPage when page changes
  }
}


