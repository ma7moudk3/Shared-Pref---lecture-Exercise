import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();
  static AppRouter router = AppRouter._();
  GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  pushFunction(Widget widget) {
    navKey.currentState.push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  pushNamedFunction(String routeName) {
    navKey.currentState.pushNamed(routeName);
  }
}
