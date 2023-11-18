import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/constant/utils/dialog_util.dart';
import 'package:portfolio/constant/utils/progress_util.dart';
import 'package:portfolio/core/constants.dart';
import 'package:portfolio/core/errors/exceptions.dart';
import 'package:portfolio/core/network/network_info.dart';
import 'package:portfolio/pages/model/userInfo_model.dart';

import '../../constant/constant.dart';

class FetchUserInfoController extends GetxController {
  UserInfoModel userInfoModel = UserInfoModel();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // void handleError(err) {
  //   if (err is NoInternetException) {
  //     Get.rawSnackbar(
  //         messageText: Text(
  //       'Error : $err',
  //       style: TextStyle(color: Colors.white),
  //     ));
  //   }
  // }

  Future isNetworkConnection() async {
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
    if (!await Get.find<NetworkInfo>().isConnected()) {
      throw NoInternetException('No Internet Found!');
    }
  }


  Future<UserInfoModel?> fetchUserInfo() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ProgressDialogUtils.showProgressDialog();
    });
    var client = http.Client();
    final apiUrl = Uri.parse(userInfo_endpoint);
    final response = await client.get(
      apiUrl,
      headers: {},
    );
    final jsonBodyDecode = response.body;
    print(jsonBodyDecode);
    try {
      await isNetworkConnection();
      switch (response.statusCode) {
        case 200:
        case 201:
          print(response.statusCode);
          ProgressDialogUtils.hideProgressDialog();
          userInfoModel = userInfoModelFromJson(jsonBodyDecode);
          return userInfoModelFromJson(jsonBodyDecode);
        case 400:
        case 404:
        case 408:
          DialogUtil.updateStatus(user_error);
          break;
        default:
          DialogUtil.updateStatus(server_error);
          break;
      }
    } catch (error) {
      ProgressDialogUtils.hideProgressDialog();
      DialogUtil.updateStatus(error);
    }
  }
}
