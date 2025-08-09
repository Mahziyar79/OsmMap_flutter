import 'package:flutter/material.dart';
import 'package:snapp_map/constants/Dimens.dart';
import 'package:snapp_map/screen/map_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snapp Map',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            fixedSize: WidgetStatePropertyAll(Size(double.infinity, 58)),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimens.medium),
              ),
            ),
            elevation: WidgetStatePropertyAll(0),
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if(states.contains(WidgetState.pressed)){
                 return Color.fromARGB(255, 150, 238, 96);
              }
              return Color.fromARGB(255, 2, 207, 36);
            }),
          ),
        ),
      ),
      home: MapScreen(),
    );
  }
}
