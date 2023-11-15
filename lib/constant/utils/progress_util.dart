import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressDialogUtils {
  static bool isProgressVisible = false;

  ///common method for showing progress dialog
  static void showProgressDialog({isCancellable = false}) async {
    if (!isProgressVisible) {
      Get.defaultDialog(
        title: 'Momaspay',
        radius: 5,
        content: Padding(
          padding:EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.teal.shade900,
                  ),
                ),
              ),
              SizedBox(width:20),
              Text('Processing...')
            ],
          ),
        ),
        barrierDismissible: isCancellable,
      );
      isProgressVisible = true;
    }
  }

  ///common method for hiding progress dialog
  static void hideProgressDialog() {
    if (isProgressVisible) {
      Get.back();
      print('------hide------');
    }
    isProgressVisible = false;
  }
//}
}