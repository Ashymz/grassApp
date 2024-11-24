import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:test_design/presentation/onboarding.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  void proceed() async {
    await Future.delayed(const Duration(seconds: 4));
    Get.to(const OnboardingScreen(), transition: Transition.circularReveal);
  }

  @override
  void initState() {
    super.initState();
    proceed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Center(
        child: LottieBuilder.asset('images/animation/lottie.json'),
      ),
    );
  }
}
