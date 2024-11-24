import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_design/navbar.dart';
import 'package:test_design/presentation/dashboard/home.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;
  late PageController _pageController;

  final List<String> _titles = [
    'Easily manage your plant 🍀',
    'Get reminders for watering',
    'Track your plant’s growth',
  ];

  final List<String> _images = [
    'images/illustration1.png',
    'images/illustration2.jpg',
    'images/illustration3.png',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentIndex < _titles.length - 1) {
        _currentIndex++;
        _pageController.animateToPage(_currentIndex,
            duration: Duration(milliseconds: 300), curve: Curves.easeIn);
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemCount: _titles.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        _titles[index],
                        style: TextStyle(
                          fontSize: 35,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(_images[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_titles.length, (i) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        width: 8.0,
                        height: 8.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == i
                              ? Colors.green
                              : const Color.fromARGB(255, 172, 225, 159),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: SizedBox(
                      width: double.infinity,
                      child: CupertinoButton(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        onPressed: () {
                          if (_currentIndex < _titles.length - 1) {
                            _pageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          } else {
                            Get.to(const Navbar());
                          }
                        },
                        child: Text(
                          _currentIndex < _titles.length - 1
                              ? "Next"
                              : "Let's go",
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.green,
                        padding: EdgeInsets.symmetric(vertical: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to show completion animation or action
  void _showCompletionAnimation() {
    // Implement your animation or action here
    // For example, you can show a dialog or navigate to another screen
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Congratulations!"),
          content: Text("You've completed the onboarding."),
          actions: [
            CupertinoButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
}
