import 'package:flutter/material.dart';
import 'package:sms_permission_8103/src/screens/home_screen.dart';



class MainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '8103 sms icazə',
      home: HomeScreen(),//Utils.serialNumber == null ? LoginScreen() : HomeScreen(),//firstScreenSelector(),
    );
  }


  }
