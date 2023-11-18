import 'package:flutter/material.dart';
import 'package:portfolio/pages/model/experience_model.dart';


class UserExperience extends StatelessWidget {
  const UserExperience({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: ExperienceList.length,
          itemBuilder: (context, index) {
            return listEducation(ExperienceList[index], index);
          }),
    );
  }

  Widget listEducation(ExperienceModel experiencelist, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.business_outlined,
                size: 40,
              ),
              Text(experiencelist.company),
              Text(experiencelist.location),
              Text(experiencelist.role),
              Text(experiencelist.period),


              //url_launcher
            ],
          ),
        ),
      ),
    );
  }
}
