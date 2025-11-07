import 'package:flutter/material.dart';

void main() => runApp(const MyCVApp());

class MyCVApp extends StatelessWidget {
  const MyCVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currículum Vitae',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.black,
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: Colors.black,
            fontSize: 132,
            fontFamily: "Fontuna",
          ),
          titleMedium: TextStyle(
            color: Colors.white,
            fontSize: 17,
            letterSpacing: 1,
          ),
        ),
      ),
      home: Scaffold(body: CvScreen()),
    );
  }
}

class CvScreen extends StatelessWidget {
  const CvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mainImage = Container(
      decoration: BoxDecoration(
        border: Border.all(width: 5),
        borderRadius: BorderRadius.circular(4),
      ),
      height: 350,
      width: 340,
      child: Image.asset('assets/images/profile-pic.jpg', fit: BoxFit.cover),
    );

    final titleText = Column(
      children: [
        SizedBox(
          height: 320,
          child: Stack(
            children: [
              Positioned(top: 135, child: SizedBox(width: 450, child: Image.asset('assets/images/surname.png'))),
              SizedBox(width: 450, child: Image.asset('assets/images/name.png')),
            ],
          ),
        ),
        Container(
          width: 450,
          margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
          padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
          decoration: BoxDecoration(border: BoxBorder.fromLTRB(top: BorderSide(width: 5))),
          child: Text(
            'WEB DEVELOPER',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    );

    final contactSection = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Subtitle(340, "CONTACT"),
        ContactInfo("684-156-768", Icons.phone),
        ContactInfo("rashi.chugani.n@gmail.com", Icons.email),
        ContactInfo("Spain, Canary Islands", Icons.location_on),
      ],
    );

    final informationSection = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Subtitle(340, "INFORMATION"),
        InformationInfo(labels: ['Willingness to travel', 'Flexibility to relocate if necessary', 'Experience in teamwork.']),
      ], 
    );

    final skillsSection = Column(
      children: [
        Subtitle(340, "SKILLS"),
        SkillsInfo(0.9, "Git"),
        SkillsInfo(0.8, "Visual Studio Code"),
        SkillsInfo(0.8, "Bootstrap"),
        SkillsInfo(0.7, "React, Vue.js"),
        SkillsInfo(0.8, "Python"),
        SkillsInfo(0.5, "Java"),
      ]
    );

    final languageSection = Column(
      children: [
        Subtitle(340, "LANGUAGE SKILLS"),
        LanguagesInfo("Spanish", "Native"),
        LanguagesInfo("English", "Advanced"),
        LanguagesInfo("Shindi", "Intermediate"),
        LanguagesInfo("Hindi", "Intermediate"),
      ]
    );

    final experienceSection = SizedBox(
      width: 440,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Subtitle(440, "WORK EXPERIENCE"),
          ExperienceInfo("JOHN WESTON GROUP (2025)", "Web Application Developer", "Designed and developed responsive and visually appealing web pages using Webflow, Framer, CSS, and Bootstrap. Implemented interactive features and dynamic functionality through TypeScript and API integration to enhance user experience and performance.", isWorkExperience: true,)
        ]
      ),
    );

    final educationSection = SizedBox(
      width: 440,
      child: Column(
        spacing: 15,
        children: [
          Subtitle(440, "EDUCATION AND TRAINING"),
          ExperienceInfo("WEB APPLICATION DEVELOPMENT (2023-2025)", "Puerto de la Cruz Secondary Education Institute - Telesforo Bravo", "Web Programmer", isWorkExperience: false,),
          ExperienceInfo("MULTI-PLATFORM APPLICATION DEVELOPMENT (2025-2026)", "Puerto de la Cruz Secondary Education Institute - Telesforo Bravo", "Software Programmer", isWorkExperience: false,),
        ]
      ),
    );

    final leftColumn = Column(children: [SizedBox(height: 30,), mainImage, contactSection, informationSection, skillsSection, languageSection]);

    final rightColumn = Column(children: [titleText, experienceSection, educationSection]);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 60.0, bottom: 60.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 25,
            children: [leftColumn, rightColumn],
          ),
        ),
      ),
    );
  }
}

class Subtitle extends StatelessWidget {
  final double width;
  final String label;

  const Subtitle(this.width, this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 40.0,
        bottom: 15.0,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        child: Container(
          color: Colors.black,
          width: width,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            child: Text(
              label,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      ),
    );
  }
}

class ContactInfo extends StatelessWidget {
  final String label;
  final IconData icon;

  const ContactInfo(this.label, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.grey[400],
              padding: EdgeInsets.all(2),
              child : Container(
                decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(
                  width: 8,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(icon, color: Colors.white, size: 20),
            ),
          ),
          SizedBox(width: 16),
          Text(
            label,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class InformationInfo extends StatelessWidget {
  final List<String> labels;

  const InformationInfo({super.key, required this.labels});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...labels.map((label) => Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text('• $label', style: TextStyle(fontSize: 16)),
            )),
      ],
    );
  }
}

class SkillsInfo extends StatelessWidget {
  final double value;
  final String label;

  const SkillsInfo(this.value, this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            width: 240,
            child: LinearProgressIndicator(
              value: value,
              color: Colors.grey,
              backgroundColor: Colors.black,
              borderRadius: BorderRadius.circular(50),
              minHeight: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class LanguagesInfo extends StatelessWidget {
  final String label1;
  final String label2;

  const LanguagesInfo(this.label1, this.label2, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 245,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 100,
            margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
            decoration: BoxDecoration(border: BoxBorder.fromLTRB(right: BorderSide(width: 4))),
            child: Text(
              label1,
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            width: 100,
            child: Text(
              label2,
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}

class ExperienceInfo extends StatelessWidget {
  final bool isWorkExperience;
  final String label1;
  final String label2;
  final String label3;

  const ExperienceInfo(this.label1, this.label2, this.label3, {super.key, required this.isWorkExperience});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(label1, style: TextStyle(fontSize: 19, fontWeight: isWorkExperience ? FontWeight.w900 : FontWeight.w800)),
        Text(label2, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, fontStyle: FontStyle.italic)),
        Text(label3, style: TextStyle(fontSize: 17, fontStyle: isWorkExperience ? FontStyle.normal : FontStyle.italic)),
      ],
    );
  }
}