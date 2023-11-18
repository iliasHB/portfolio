class ExperienceModel {
  final String company;
  final String location;
  final String role;
  final String period;

  ExperienceModel(
      {required this.company,
      required this.location,
      required this.role,
      required this.period});
}

List ExperienceList = [
  ExperienceModel(
      company: 'Memmcol Plc',
      location: 'Lagos-Ibadan Exp way',
      role: 'Software Developer',
      period: 'Till date'),
  ExperienceModel(
      company: 'Swift Network',
      location: 'Adeola Odeku, Saka Tinubu Street',
      role: 'Base Station Management',
      period: 'NOVEMBER  2014 - OCTOBER 2015'),
  ExperienceModel(
      company: 'Taylor Communicatio',
      location: 'Broad Street, Lagos Island',
      role: 'Network Engineer',
      period: 'MARCH  2018 - SEPTEMBER 2018'),
];

