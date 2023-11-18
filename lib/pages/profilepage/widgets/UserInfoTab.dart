import 'package:flutter/material.dart';
import 'package:portfolio/constant/utils/progress_util.dart';
import 'package:portfolio/core/widgets/dataList.dart';

class UserInfo extends StatelessWidget {
  final String name;
  final String twitter;
  final String email;
  final String skill;
  const UserInfo({super.key, required this.name, required this.twitter, required this.email, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(child: Row(
                children: [
                  DataListWidget(icon: Icons.person_2_outlined, desc: name),
                ],
              )),
              Card(child: Row(
                children: [
                  DataListWidget(icon: Icons.email_outlined, desc: email),
                ],
              )),
              Card(child: Row(
                children: [
                  Container(
                    height:50,
                    width: 50,
                    child: Image.asset('assets/xlogo.jpg'),
                  ),
                  Text('@'+twitter)
                  //DataListWidget(icon: Icons.face_2_outlined, desc: twitter),
                ],
              )),
              Card(child: Row(
                children: [
                  DataListWidget(icon: Icons.tv, desc: "@"+twitter),
                ],
              )),
              Card(child: Row(
                children: [
                  DataListWidget(icon: Icons.bookmark_border, desc: skill),
                ],
              ))
            ],
          ),
        ));
  }
}
