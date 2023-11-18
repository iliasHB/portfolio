import 'package:flutter/material.dart';
import 'package:portfolio/constant/utils/progress_util.dart';
import 'package:portfolio/core/constants.dart';
import 'package:portfolio/pages/widgets/UserInfoTab.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/education_model.dart';

class UserEducation extends StatelessWidget {
  const UserEducation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: EducationList.length,
          itemBuilder: (context, index) {
            return listEducation(EducationList[index], index);
          }),
    );
  }

  Widget listEducation(EducationModel educationlist, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.school_outlined,
                size: 40,
              ),
              Text(educationlist.institution),
              Text(educationlist.location),
              Text(educationlist.period),
              Row(
                children: [
                  Text(''),
                  Spacer(),
                  ElevatedButton(
                      onPressed: () async {
                        if (await canLaunchUrl(unilorin) != null) {
                          await launchUrl(index == 0 ? unilorin : kwarapoly);
                        }
                      },
                      child: Text('view certificate')),
                ],
              )

              //url_launcher
            ],
          ),
        ),
      ),
    );
  }
}
