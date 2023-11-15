

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/backend/apiClient/api_client.dart';

import '../../core/constants.dart';



class SignInController extends GetxController with StateMixin<dynamic> {
  // TextEditingController meterNoController = TextEditingController();
  // TextEditingController pwdController = TextEditingController();
  //
  // SignInRespModel signInRespModel = SignInRespModel();
  // SignInErrorRespModel signInErrorRespModel = SignInErrorRespModel();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  setUp_signIn_API_params(Map body,
      {VoidCallback? successCall, VoidCallback? signinErrCall, VoidCallback? errCall}) async {
    Get.put(ApiClient());
    return Get.find<ApiClient>().handleGetRequest(
      endPoint: userInfo,
      headers: {},
      onSuccess: (resp) {
        // if (resp.toString().contains("responsecode: 00")) {
          handleSignInSuccess(resp);
          if (successCall != null) {
            successCall();
          }
        // }
      },
      onError: (err) {
        handleError(err);
        if (errCall != null) {
          errCall();
        }
      },
      //requestData: body,
    );
  }

  void handleSignInSuccess(response) {
    //signInRespModel = SignInRespModel.fromJson(response);
  }

  void handleError(var err) {
    // if (err is NoInternetException) {
    //   DialogUtil.snackBar(err.toString());
    // }
  }

  void handleSignInError(resp) {
    //signInErrorRespModel = SignInErrorRespModel.fromJson(resp);
  }
}