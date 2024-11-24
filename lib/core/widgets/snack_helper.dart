import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_alert.dart';

class SnackHelper {
  static void showCustomAlert(String message, AlertType type) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: CustomAlert(
        message: message,
        type: type,
      ),
    );

    ScaffoldMessenger.of(Get.context!)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
