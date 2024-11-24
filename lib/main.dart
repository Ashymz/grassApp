import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_design/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      title: 'My Design',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: ThemeData.light().textTheme.apply(
              fontFamily: 'Poppins',
            ),
      ),
      home: const Splashscreen(),
    );
  }
}
