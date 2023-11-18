import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/constant/utils/progress_util.dart';
import 'package:portfolio/pages/controller/userProject_controller.dart';
import 'package:portfolio/pages/model/project_model.dart';

class UserProjects extends StatefulWidget {
  const UserProjects({super.key});

  @override
  State<UserProjects> createState() => _UserProjectsState();
}

class _UserProjectsState extends State<UserProjects> {
  final controller = Get.put(FetchUserProjectController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: controller.fetchProject(),
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
                        const Text("Unable to load projects, Please try again"),
                        OutlinedButton(
                            onPressed: () => null,
                            // Navigator.push(
                            // context,
                            // MaterialPageRoute(
                            //     builder: (context) => UserInfo())),
                            child: Text('Refresh'))
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
                                "No project found",
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        )
                      : ListView.builder(
                    //reverse: true,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount: controller.projectModel == null
                              ? 0
                              : controller.projectModel.length,
                          itemBuilder: (BuildContext context, int index) {
                            int itemCount = controller.projectModel.length ?? 0;
                            int reversedIndex = itemCount - 1 - index;
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.diamond_outlined),
                                      Text(controller.projectModel[reversedIndex].name),
                                      Text(controller.projectModel[reversedIndex].description.toString()),
                                      Text(controller.projectModel[reversedIndex].createdAt.toString())
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                }
            }
          }),
    );
  }
}
