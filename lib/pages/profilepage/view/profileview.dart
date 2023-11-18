import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/constant/constant.dart';
import 'package:portfolio/constant/utils/progress_util.dart';
import 'package:portfolio/core/constants.dart';
import 'package:portfolio/pages/controller/userInfo_controller.dart';
import 'package:portfolio/pages/model/userInfo_model.dart';
import 'package:portfolio/pages/widgets/UserEduTab.dart';
import 'package:portfolio/pages/widgets/UserExpTab.dart';
import 'package:portfolio/pages/widgets/UserInfoTab.dart';
import 'package:portfolio/pages/widgets/UserProTab.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final controller = Get.put(FetchUserInfoController());
  //UserInfoModel userInfoModel = UserInfoModel();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            backgroundColor: Colors.amber,
            appBar: AppBar(
              title: const Center(
                  child: Text(
                'Curriculum Vitae',
                style: TextStyle(color: Colors.white),
              )),
              elevation: 0,
              backgroundColor: Colors.transparent,
              //automaticallyImplyLeading: true,
              // leading: IconButton(
              //   onPressed: () => Navigator.pushNamed(context, "/"),
              //   icon: const Icon(
              //     Icons.person_add,
              //     color: Colors.white,
              //   ),
              // ),
              //Icon(Icons.person_add, color: Colors.black,),
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 12.0),
                  child: Icon(
                    Icons.share,
                    //color: Colors.white,
                  ),
                )
              ],
            ),
            // backgroundColor: Colors.white,
            body: FutureBuilder<UserInfoModel?>(
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
                                      Navigator.pushNamed(context, '/profile'),
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
                                      "No record found",
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              )
                            : ListView(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            //color: ColorConstant.black900,
                                            image: DecorationImage(
                                              image: NetworkImage(controller.userInfoModel.avatarUrl.toString()),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            controller.userInfoModel.name
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          controller.userInfoModel.bio
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          // style:
                                          // TextStyle(color: ColorConstant.whiteA700, fontSize: 16),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      StickyHeader(
                                          header: Container(
                                            //color: ColorConstant.black900,
                                            child: TabBar(
                                                // indicatorColor: ColorConstant.green200,
                                                // labelColor: ColorConstant.green200,
                                                isScrollable: false,
                                                unselectedLabelColor:
                                                    Colors.grey[700],
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 0),
                                                indicatorPadding:
                                                    EdgeInsets.all(0),
                                                tabs: const [
                                                  Tab(
                                                    icon: Icon(Icons.person_2_outlined),
                                                    child: Text(
                                                      'Info',
                                                    ),
                                                  ),
                                                  Tab(
                                                    icon: Icon(
                                                      Icons.menu_book_outlined,
                                                    ),
                                                    child: Text(
                                                      'Education',
                                                    ),
                                                  ),
                                                  Tab(
                                                      icon: Icon(
                                                        Icons.business_outlined,
                                                      ),
                                                      child: Text(
                                                        'Experience',
                                                      )),
                                                  Tab(
                                                      icon: Icon(
                                                        Icons
                                                            .diamond_outlined,
                                                      ),
                                                      child: Text(
                                                        'Projects',
                                                      )),
                                                ]),
                                          ),
                                          content: Column(

                                            children: [
                                              Container(
                                                height: 1000,
                                                child: TabBarView(
                                                  children: [
                                                    UserInfo(
                                                      name: controller
                                                          .userInfoModel.name == null ? '' :controller.userInfoModel.name.toString(),
                                                      twitter: controller
                                                          .userInfoModel
                                                          .twitterUsername == null ? '' : controller
                                                          .userInfoModel
                                                          .twitterUsername
                                                          .toString(),
                                                      email: 'abeeb.ilias@gmail.com',
                                                      skill: 'Flutter | Node.js | Express.js | Firebase |\nMicroservice | React (Beginner) | MongoDb |',
                                                    ),
                                                    UserEducation(),
                                                    UserExperience(),
                                                    UserProjects(),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                ],
                              );
                      }
                  }
                })));
  }
}

///--------------------------------
//
// class InfoTab extends StatelessWidget {
//   const InfoTab({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //backgroundColor: ColorConstant.black900,
//       body: UserInfo(
//         username: '@createdbyhabeeb',
//         avatar: "https://source.unsplash.com/random?sig=2" ?? '',
//         content:
//         'This is the post that i love most from you, Please post more of this kind...',
//         datetime: '09:23am',
//         numberOfLikes: 20,
//         numberOfDislikes: 0,
//         numberOfComments: 12,
//         numberOfShares: 5,
//         numberOfClones: 0,
//         numberOfViews: 509,
//         name: 'Habeeb S.A',
//         media: 'https://source.unsplash.com/random?sig=1',
//         icon: Icon(CupertinoIcons.ellipses_bubble),
//       ),
// //isComment: false, ),
// //       floatingActionButton: FloatingButton(),
// //       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }
// }
//
// class UserEducation extends StatelessWidget {
//   const UserEducation({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //backgroundColor: ColorConstant.black900,
//       body: Education(
//         username: '@createdbyhabeeb',
//         avatar: "https://source.unsplash.com/random?sig=2" ?? '',
//         content:
//         'This is the post that i love most from you, Please post more of this kind...',
//         datetime: '09:23am',
//         numberOfLikes: 20,
//         numberOfDislikes: 0,
//         numberOfComments: 12,
//         numberOfShares: 5,
//         numberOfClones: 0,
//         numberOfViews: 509,
//         name: 'Habeeb S.A',
//         media: 'https://source.unsplash.com/random?sig=1',
//         icon: Icon(CupertinoIcons.ellipses_bubble),
//       ),
// //isComment: false, ),
// //       floatingActionButton: FloatingButton(),
// //       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }
// }
