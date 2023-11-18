import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/constant/constant.dart';
import 'package:portfolio/constant/utils/progress_util.dart';
import 'package:portfolio/pages/controller/userInfo_controller.dart';
import 'package:portfolio/pages/model/userInfo_model.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final controller = Get.put(FetchUserInfoController());
  //UserInfoModel userInfoModel = UserInfoModel();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.amber,
        body: Align(
          alignment: Alignment.center,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: size/2),
            child: FutureBuilder<UserInfoModel?>(
                future: controller.fetchUserInfo(),
                builder: (context, AsyncSnapshot listSnap) {
                  switch (listSnap.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                    case ConnectionState.active:
                      return Container();
                    default:
                      if (listSnap.hasError) {
                        ProgressDialogUtils.hideProgressDialog();
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.pending_actions,
                                  size: 50, color: Colors.black),
                              const Text(timeout_error),
                              OutlinedButton(
                                  onPressed: () =>
                                  Navigator.pushNamed(context, '/'),
                                  child: const Text('Refresh'))
                            ],
                          ),
                        );
                      } else {
                        return !listSnap.hasData
                            ? const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.pending_actions,
                                      size: 50,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      "No user record found",
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              )
                            : ListView(
                                children: [
                                  Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: Container(
                                            height: 200,
                                            width: 200,
                                            decoration:  BoxDecoration(
                                              shape: BoxShape.circle,
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Colors.black54,
                                                  offset: Offset(
                                                    5.0,
                                                    5.0,
                                                  ),
                                                  blurRadius: 10.0,
                                                  spreadRadius: 2.0,
                                                )
                                              ],
                                              //color: ColorConstant.black900,
                                              image: DecorationImage(
                                                image: NetworkImage(controller.userInfoModel.avatarUrl.toString()),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20,),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            controller.userInfoModel.name
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text('@'+
                                            controller.userInfoModel.twitterUsername
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            controller.userInfoModel.bio.toString(),
                                            textAlign: TextAlign.center,
                                            // style:
                                            // TextStyle(color: ColorConstant.whiteA700, fontSize: 16),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: ElevatedButton(
                                              onPressed: () =>  AuthDialog(),//Navigator.popAndPushNamed(context, '/profile'),
                                              child: const Text('Learn more')),
                                        )
                                      ])
                                ],
                              );
                      }
                  }
                }),
          ),
        ));
  }

   Future AuthDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Guest Login'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder()
                  ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder()
                  ),
                ),
              ],
            ),
            actions: [
              BackButton(
                // textColor: Colors.black,
                onPressed: () => Navigator.pop(context),
                //child: Text('CANCEL'),
              ),
              OutlinedButton(
                //textColor: Colors.black,
                onPressed: () => Navigator.popAndPushNamed(context, '/profile'),
                child: Text('Login'),
              ),
            ],
          );
        },
      );

   }
}
