import 'dart:math';

import 'package:flutter/material.dart';

import 'package:ready_ecommerce/screens/home_screen.dart';
import 'package:ready_ecommerce/widgets/buttomnav.dart';
import 'package:ready_ecommerce/widgets/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SwipeScreenWrapper(),
    );
  }
}



class SwipeScreenWrapper extends StatefulWidget {
  const SwipeScreenWrapper({super.key});

  @override
  State<SwipeScreenWrapper> createState() => _SwipeScreenWrapperState();
}

class _SwipeScreenWrapperState extends State<SwipeScreenWrapper> {
  int _currentPage = 0;

  void goToSecondPage() {
    setState(() {
      _currentPage = 1;
    });
  }

  void goToMainApp() {
    setState(() {
      _currentPage = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      BottomNav(onGoToSecondPage: goToSecondPage),
      LoginScreen(onGoToSecondPage: goToSecondPage),
      // HomeScreen(onGoBack: goToMainApp),
    ];

    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: animation,
              child: child,
            ),
          );
        },
        child: KeyedSubtree( // helps AnimatedSwitcher differentiate between widgets
          key: ValueKey<int>(_currentPage),
          child: pages[_currentPage],
        ),
      ),
    );
  }
}


// class SwipeScreenWrapper extends StatefulWidget {
//   const SwipeScreenWrapper({super.key});

//   @override
//   State<SwipeScreenWrapper> createState() => _SwipeScreenWrapperState();
// }

// class _SwipeScreenWrapperState extends State<SwipeScreenWrapper> {
//   final PageController _pageController = PageController();
//   int _currentIndex = 0;

//   void goToHomeScreen() {
//     _pageController.animateToPage(
//       1,
//       duration: const Duration(milliseconds: 600),
//       curve: Curves.easeInOut,
//     );
//   }

//   void goToMainApp() {
//     _pageController.animateToPage(
//       0,
//       duration: const Duration(milliseconds: 600),
//       curve: Curves.easeInOut,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         if (_currentIndex == 1) {
//           goToMainApp();
//           return false;
//         }
//         return true;
//       },
//       child: PageView(
//         controller: _pageController,
//         onPageChanged: (index) => setState(() => _currentIndex = index),
//         physics: const NeverScrollableScrollPhysics(), // 👈 disables swipe
//         children: [
//           BottomNav(onGoToSecondPage: goToHomeScreen),
//           const HomeScreen(),
//         ],
//       ),
//     );
//   }
// }
