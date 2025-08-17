import 'package:flutter/cupertino.dart';

extension ContextExtensions on BuildContext {
  void hideKeyboard() {
    FocusScope.of(this).unfocus();
  }}