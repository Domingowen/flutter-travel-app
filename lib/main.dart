import 'package:flutter/material.dart';
import './src/screen/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'travel_app',
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: appTheme,
    );
  }
}

Color firstColor = Color(0xFFF47D15);
Color secondColor = Color(0xFFef7772C);
ThemeData appTheme =
    ThemeData(primaryColor: Color(0xFFF3791A), fontFamily: 'Oxygen');
List<String> locations = ['KL', 'JB'];
const TextStyle dropDownLabelStyle =
    TextStyle(color: Colors.black, fontSize: 16.0);
