import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/constant/constant.dart';
import 'package:portfolio/constant/utils/dialog_util.dart';
import 'package:portfolio/constant/utils/progress_util.dart';
import 'package:portfolio/core/constants.dart';
import 'package:portfolio/core/errors/exceptions.dart';
import 'package:portfolio/pages/model/project_model.dart';

import '../../core/network/network_info.dart';


class FetchUserProjectController extends GetxController {
  List<ProjectModel> projectModel = <ProjectModel>[];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void handleError(err) {
    if (err is NoInternetException) {
      Get.rawSnackbar(
          messageText: Text(
            'Error : $err',
            style: TextStyle(color: Colors.white),
          ));
    }
  }
  //
  Future isNetworkConnection() async {
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
    if (!await Get.find<NetworkInfo>().isConnected()) {
      throw NoInternetException('No Internet Found!');
    }
  }

  Future<List<ProjectModel>?> fetchProject() async {
    //WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ProgressDialogUtils.showProgressDialog();
    //});
    var client = http.Client();
    final apiUrl = Uri.parse(projects_endpoint);
    final response = await client.get(apiUrl, headers: {}, );
    final jsonBodyDecode = response.body;
    try {
      ProgressDialogUtils.hideProgressDialog();
      await isNetworkConnection();
      switch (response.statusCode) {
        case 200:
        case 201:
          print(response.statusCode);
          print(jsonBodyDecode);

          projectModel = projectModelFromJson(jsonBodyDecode);
            return projectModelFromJson(jsonBodyDecode);
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