import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/pages/widgets/UserEduTab.dart';
import 'package:portfolio/pages/widgets/UserExpTab.dart';
import 'package:portfolio/pages/widgets/UserInfoTab.dart';
import 'package:portfolio/pages/widgets/UserProTab.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        //backgroundColor: ColorConstant.black900,
        appBar: AppBar(
          title: const Center(
              child: Text(
                'Habeeb Soliu',
                style: TextStyle(color: Colors.white),
              )),
          elevation: 0,
          backgroundColor: Colors.transparent,
          //automaticallyImplyLeading: true,
          leading: IconButton(
            onPressed: () => Navigator.pushNamed(context, "/"),
            icon: const Icon(
              Icons.person_add,
              color: Colors.white,
            ),
          ),
          //Icon(Icons.person_add, color: Colors.black,),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Icon(
                Icons.menu,
                color: Colors.white,
              ),
            )
          ],
        ),
        // backgroundColor: Colors.white,
        body:
        ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      //color: ColorConstant.black900,
                      image: const DecorationImage(
                        image: NetworkImage(
                            "https://source.unsplash.com/random?sig=1"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '@createbyhabeeb',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Software developer | Flutter | Java | MySQL | Docker | Node | HTML 5 | CSS (BOOSTRAP)',
                    textAlign: TextAlign.center,
                    // style:
                    // TextStyle(color: ColorConstant.whiteA700, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Expanded(
                //       child: Container(
                //         alignment: Alignment.centerRight,
                //         //color: Colors.red,
                //         child: Column(
                //           children: const [
                //             Text(
                //               '37',
                //               style: TextStyle(
                //                   color: Colors.white,
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: 24),
                //             ),
                //             SizedBox(
                //               height: 5,
                //             ),
                //             Text(
                //               'Following',
                //               style:
                //               TextStyle(color: Colors.grey, fontSize: 15),
                //             )
                //           ],
                //         ),
                //       ),
                //     ),
                //     Expanded(
                //       child: Container(
                //         //color: Colors.blue,
                //         child: Column(
                //           children: const [
                //             Text(
                //               '8',
                //               style: TextStyle(
                //                   color: Colors.white,
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: 24),
                //             ),
                //             SizedBox(
                //               height: 5,
                //             ),
                //             Text(
                //               'Followers',
                //               style:
                //               TextStyle(color: Colors.grey, fontSize: 15),
                //             )
                //           ],
                //         ),
                //       ),
                //     ),
                //     Expanded(
                //       child: Container(
                //         alignment: Alignment.centerLeft,
                //         //color: Colors.green,
                //         child: Column(
                //           children: const [
                //             Text(
                //               '45',
                //               style: TextStyle(
                //                   color: Colors.white,
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: 24),
                //             ),
                //             SizedBox(
                //               height: 5,
                //             ),
                //             Text(
                //               ' Likes ',
                //               style:
                //               TextStyle(color: Colors.grey, fontSize: 15),
                //             )
                //           ],
                //         ),
                //       ),
                //     )
                //   ],
                // ),
                const SizedBox(
                  height: 10,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Container(
                //       padding: const EdgeInsets.symmetric(
                //           horizontal: 40.0, vertical: 15.0),
                //       decoration: BoxDecoration(
                //           border: Border.all(color: Colors.grey.shade300),
                //           borderRadius: BorderRadius.circular(5)),
                //       child: const Text(
                //         'Edit profile',
                //         style: TextStyle(color: Colors.white, fontSize: 20),
                //       ),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.symmetric(horizontal: 2.0),
                //       child: Container(
                //         padding: const EdgeInsets.all(15.0),
                //         decoration: BoxDecoration(
                //             border: Border.all(color: Colors.grey.shade300),
                //             borderRadius: BorderRadius.circular(5)),
                //         child: Icon(Icons.camera_alt,
                //           // color: ColorConstant.whiteA700
                //         ),
                //       ),
                //     ),
                //     Container(
                //       padding: const EdgeInsets.all(15.0),
                //       decoration: BoxDecoration(
                //           border: Border.all(color: Colors.grey.shade300),
                //           borderRadius: BorderRadius.circular(5)),
                //       child: Icon(Icons.bookmark_border,
                //         // color: ColorConstant.whiteA700
                //       ),
                //     ),
                //     const SizedBox(
                //       height: 15,
                //     ),
                //   ],
                // ),

                StickyHeader(
                    header: Container(
                      //color: ColorConstant.black900,
                      child: TabBar(
                          // indicatorColor: ColorConstant.green200,
                          // labelColor: ColorConstant.green200,
                          isScrollable: false,
                          unselectedLabelColor: Colors.grey[700],
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          indicatorPadding: EdgeInsets.all(10),
                          tabs: const [
                            Tab(
                              icon: Icon(Icons.grid_on),
                              child: Text(
                                'Info',
                              ),
                            ),
                            Tab(
                              icon: Icon(
                                Icons.video_camera_back,
                              ),
                              child: Text(
                                'Education',
                              ),
                            ),
                            Tab(
                                icon: Icon(
                                  Icons.favorite,
                                ),
                                child: Text(
                                  'Experience',
                                )),
                            Tab(
                                icon: Icon(
                                  Icons.lock_outline_rounded,
                                ),
                                child: Text(
                                  'Projects',
                                )),
                          ]),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 1000,
                          child: TabBarView(
                            children: [
                              UserInfo(),
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
        ),
      ),
      //),
    );
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