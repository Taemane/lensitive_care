import 'package:flutter/material.dart';
import 'package:lensitive_care/constants/colors.dart';
import 'package:lensitive_care/presentation/landing_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lensitive Care',
      theme: ThemeData(
        colorScheme: ThemeData.light().colorScheme.copyWith(
              primary: primaryColor,
              secondary: deepColor,
              tertiary: lightColor,
              // error: errorColor,
            ),
        fontFamily: 'Archivo',
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            fontSize: 14,
            fontFamily: 'Archivo',
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
          bodyText2: TextStyle(
            fontSize: 14,
            fontFamily: 'Archivo',
            color: Colors.black54,
          ),
          headline2: TextStyle(
            fontSize: 16,
            fontFamily: 'Archivo',
            fontWeight: FontWeight.bold,
          ),
          headline1: TextStyle(
            fontSize: 30,
            fontFamily: 'Archivo',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: const LandingScreen(),
    );
  }
}
