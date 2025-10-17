// import 'package:excelerate_app/features/splash/presentation/screens/splash_screen.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const ExcelerateApp());
// }

// class ExcelerateApp extends StatelessWidget {
//   const ExcelerateApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
//   }
// }
import 'package:excelerate_app/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExcelerateApp());
}

class ExcelerateApp extends StatelessWidget {
  const ExcelerateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Excelerate',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
