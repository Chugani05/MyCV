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
      height: 310,
      width: 300,
      child: Image.asset('assets/images/profile-pic.jpg', fit: BoxFit.cover),
    );

    final titleText = Text(
      "Chugani",
      style: Theme.of(context).textTheme.titleLarge,
    );

    final contactSection = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Subtitle(300, "CONTACT"),
        ContactInfo("684-156-768", Icons.phone),
        ContactInfo("rashi.chugani.n@gmail.com", Icons.email),
        ContactInfo("Spain, Canary Islands", Icons.location_on),
      ],
    );

    final informationSection = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Subtitle(300, "INFORMATION"),
        InformationInfo('- Disponibilidad para viajar'),
      ]
    );

    final skillsSection = Column(
      children: [
        Subtitle(300, "SKILLS"),
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
        Subtitle(300, "LANGUAGE SKILLS"),
        LanguagesInfo("Spanish", "Native"),
        LanguagesInfo("English", "Advanced"),
        LanguagesInfo("Shindi", "Intermediate"),
        LanguagesInfo("Hindi", "Intermediate"),
      ]
    );

    final experienceSection = Column(
      children: [
        Subtitle(400, "WORK EXPERIENCE"),
      ]
    );

    final educationSection = Column(
      children: [
        Subtitle(400, "EDUCATION AND TRAINING"),
      ]
    );

    final leftColumn = Column(children: [mainImage, contactSection, informationSection, skillsSection, languageSection]);

    final rightColumn = Column(children: [titleText, experienceSection, educationSection]);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 60.0, bottom: 60.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
        bottom: 10.0,
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
  final String label;

  const InformationInfo(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '- ',
          style: TextStyle(fontSize: 16),
        ),
        // Expanded(
        //   child: Text(
        //     label,
        //     style: TextStyle(fontSize: 16),
        //   ),
        // ),
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
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label1,
              style: TextStyle(fontSize: 15),
            ),
            VerticalDivider(
              color: Colors.black,
              thickness: 4,
              width: 20,
            ),
            Text(
              label2,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      )
    );
  }
}