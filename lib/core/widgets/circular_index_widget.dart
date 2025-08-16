import 'package:dropin/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

class CircularIndexWidget extends StatelessWidget {
  CircularIndexWidget({
    super.key,
    required this.color,
  });
  var color;

  @override
  Widget build(BuildContext context) {
    return Container(width: 10,height: 10,decoration: BoxDecoration(color: color,borderRadius: BorderRadius.circular(30),border: Border.all(color: ColorConstants.circularIndexColor)),);
  }
}
