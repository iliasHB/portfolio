import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/constant/utils/progress_util.dart';
import 'package:portfolio/core/errors/exceptions.dart';
import 'package:portfolio/core/network/network_info.dart';

import '../../core/constants.dart';


class ApiClient extends GetConnect {
  var baseUrl = serverUrl;

  @override
  void onInit() {
    httpClient.timeout = const Duration(seconds: 10);
  }

  Future isNetworkConnection() async {
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
    if (!await Get.find<NetworkInfo>().isConnected()) {
      throw NoInternetException('No Internet Found!');
    }
  }

  Future handleGetRequest(
      {Function(dynamic data)? onSuccess,
        Function(dynamic error)? onError,
        Map<String, String> headers = const {},
        Map requestData = const {},
        String endPoint = ''}) async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ProgressDialogUtils.showProgressDialog();
    });
    await httpClient
        .post(endPoint, headers: headers, body: requestData)
        .then((response) async {
      try {
        ProgressDialogUtils.hideProgressDialog();
        await isNetworkConnection();
        print(endPoint);
        print("status code: ${response.statusCode}");
        print(response.body);
        switch (response.statusCode) {
          case 200:
          case 201:
            if (response.body
                .toString()
                .contains('does not exist or blocked in our database')) {
              DialogUtil.updateStatus('Meter does not exist or blocked');
            }
            else if (response.body
                .toString()
                .contains("Password changed successfully!")) {
              //statusCode 10 for change password
              SuccessDialog(
                  "Password changed successfully!.");
            }
            else {
              onSuccess!(response.body);
              print(response.body);
            }
            break;
          case 400:
            ProgressDialogUtils.hideProgressDialog();
            onError!(response.body);
            break;
          case 500:
          case 501:
          case 502:
          case 503:
          case 504:
            ProgressDialogUtils.hideProgressDialog();

            break;
          default: onError!(response.body);
          ProgressDialogUtils.hideProgressDialog();
          // onError!(response.hasError
          //     ? response.body
          // //     :
          //   DialogUtil.updateStatus(
          //       'No response. Request time out, please try again'); //<- You will get this error only when there is no statusCode
          break;
        }
      } catch (error) {
        ProgressDialogUtils.hideProgressDialog();
        if (error.toString().contains("Server Unavailable") ||
            error.toString().contains("Internal Server Error")) {
          DialogUtil.updateStatus("Server Unavailable or Internal Server Error");
        } else if (error.toString().contains("SERVICE_UNAVAILABLE")) {
          DialogUtil.updateStatus('Service Unavailable');
        } else if (error.toString().contains("Gateway Timeout")) {
          DialogUtil.updateStatus(
              'Gateway timeout, due to delay in response from the server, Pls try again');
        } else if (error.toString().contains("ENOTFOUND")) {
          DialogUtil.updateStatus('Gateway Unreachable, Try again');
        } else if (error.toString().contains("EAI_AGAIN")) {
          DialogUtil.updateStatus('Poor Network. try again');
        }
      }
    });
  }


}