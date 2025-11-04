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

    final contactSection = Row(children: [Subtitle("CONTACT"), ContactInfo("684-156-768", Icons.phone), ContactInfo("rashi.chugani.n@gmail.com", Icons.email), ContactInfo("Spain, Canary Islands", Icons.map)]);

    final leftColumn = Column(children: [mainImage, contactSection]);

    final rightColumn = Column(children: [titleText]);

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 25,
        children: [leftColumn, rightColumn],
      ),
    );
  }
}

class Subtitle extends StatelessWidget {
  final String title;

  const Subtitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: 100,
      child: Text(title, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}

class ContactInfo extends StatelessWidget {
  final String title;
  final IconData icon;

  const ContactInfo(this.title, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: ,
          child: Icon(icon, color: Colors.white, size: 40),
        )
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
