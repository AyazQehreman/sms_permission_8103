import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sms_permission_8103/src/screens/home_screen.dart';

void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_)
  {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '8103 sms icazə',
      home: HomeScreen()));
  });
}