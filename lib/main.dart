import 'package:flutter/material.dart';
import 'package:tech_news_app/pages/home.dart';
import 'package:tech_news_app/utils/colors.dart';

void main() {
  runApp(const Myapp());
}
class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,primaryColor: appcolors.primary_color
      ),
      home: HomeScreen(),
    );
  }
}