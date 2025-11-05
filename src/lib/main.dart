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
            fontSize: 20,
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
      height: 260,
      width: 240,
      child: Image.asset('assets/images/profile-pic.jpg', fit: BoxFit.cover),
    );

    final titleText = Text(
      "Chugani",
      style: Theme.of(context).textTheme.titleLarge,
    );

    final contactSection = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Subtitle("CONTACT"),
        ContactInfo("684-156-768", Icons.phone),
        ContactInfo("rashi.chugani.n@gmail.com", Icons.email),
        ContactInfo("Spain, Canary Islands", Icons.location_on),
      ],
    );

    final informationSection = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Subtitle("INFORMATION"),
        InformationInfo('- Disponibilidad para viajar'),
      ]
    );

    final toolsSection = Column(
      children: [
        Subtitle("TOOLS"),
        ToolsInfo(50, "x"),
      ]
    );

    final leftColumn = Column(children: [mainImage, contactSection, informationSection, toolsSection]);

    final rightColumn = Column(children: [titleText]);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 60.0),
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
  final String lable;

  const Subtitle(this.lable, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50.0,
        bottom: 10.0,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        child: Container(
          color: Colors.black,
          width: 250,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 20.0),
            child: Text(
              lable,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      ),
    );
  }
}

class ContactInfo extends StatelessWidget {
  final String lable;
  final IconData icon;

  const ContactInfo(this.lable, this.icon, {super.key});

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
            lable,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class InformationInfo extends StatelessWidget {
  final String lable;

  const InformationInfo(this.lable, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '- ',
          style: TextStyle(fontSize: 16),
        ),
        Expanded(
          child: Text(
            lable,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}

class ToolsInfo extends StatelessWidget {
  final double value;
  final String label;

  const ToolsInfo(this.value, this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label),
        Slider(
          value: value,
          onChanged: null,
        ),
      ],
    );
  }
}