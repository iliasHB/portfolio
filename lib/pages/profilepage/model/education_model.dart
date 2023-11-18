class EducationModel {
  final String institution;
  final String location;
  final String dept;
  final String period;
  final String url;

  EducationModel(
      {required this.institution,
      required this.location,
      required this.dept,
      required this.period, required this.url});
}

List EducationList = [
  EducationModel(
      institution: 'University of Ilorin,',
      location: 'Kwara State, Ilorin',
      dept: 'Telecommunication Science',
      period: 'NOVEMBER 2016 - SEPTEMBER 2021',
    url: ''
  ),
  EducationModel(
      institution: 'Kwara State Polytechnic',
      location: 'Kwara State, Ilorin',
      dept: 'Computer Science',
      period: 'NOVEMBER 2012 - SEPTEMBER 2015',
    url: ''
  ),
];
