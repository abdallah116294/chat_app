import 'package:flutter/material.dart';
import '../screens/chat_screen.dart';
import '../screens/login_screen.dart';
import '../screens/sign _up_screen.dart';
class Routes {
  static const String initialRoute = '/';
  static const String signUp = 'SignUpScreen';
  static const String chatScreen = 'ChatScreen';
  // static const String userScreen = 'UserScreen';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) {
          return LoginScreen();
        });
      case Routes.signUp:
        return MaterialPageRoute(builder: (context) {
          return SignUpScreen();
        });
      case Routes.chatScreen:
        return MaterialPageRoute(builder: (context) {
          return ChatScreen();
        });
     
    }
  }
}
