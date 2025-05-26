import 'package:flutter/material.dart';
import 'package:shopiverse/persentation/screens/home.dart';
import 'package:shopiverse/persentation/screens/list.dart';
import 'package:shopiverse/persentation/screens/login.dart';
import 'package:shopiverse/persentation/screens/onboarding.dart';

class Routes {
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String onBoardingRoute = '/onBoarding';
  static const String listRoute = '/list';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingPage());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case Routes.listRoute:
        return MaterialPageRoute(builder: (_) => ListPage());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text("404")),
        body: Center(child: Text("Page Not Found")),
      ),
    );
  }
}
