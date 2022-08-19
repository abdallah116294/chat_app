import 'package:flutter/material.dart';
import 'screens/sign _up_screen.dart';
import 'shared/app_routes.dart';
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   const MaterialApp(
      debugShowCheckedModeBanner:false,
       onGenerateRoute:  AppRoutes.onGenerateRoute,
       
      // home: SignUpScreen(),

    );
  }
}
