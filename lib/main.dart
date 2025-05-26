import 'package:flutter/material.dart';
import 'package:shopiverse/core/router.dart';
import 'package:shopiverse/core/theme/theme_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopiverse',
      theme: appTheme(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.onBoardingRoute,
    );
  }
}
