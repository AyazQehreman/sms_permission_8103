// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'home_screen.dart';
// import '../utils/utils.dart';
//
//
//
// class LoginScreen extends StatefulWidget {
//   @override
//   createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsFlutterBinding.ensureInitialized();
//     _read();
//   }
//
//   Future<String> _read() async {
//     final prefs = await SharedPreferences.getInstance();
//     Utils.serialNumber = prefs.getString('serialNumber');
//     print('read: ${Utils.serialNumber}');
//     return Utils.serialNumber;
//   }
//
//   @override
//   Widget build(context) {
//     return WillPopScope(
//       onWillPop: () => Utils().onBackButtonPressed(context),//onBackButtonPressed,
//       child: Scaffold(
//         backgroundColor: Colors.purple[300],
//         body: SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.all(20.0),
//             margin: EdgeInsets.all(20.0),
//             child: Form(
//               key: _formKey,
//               child: SafeArea(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image(image: AssetImage("assets/images/mylogo.png")),
//                     TextFormField(
//                       validator: validateSerialNumber,
//                       onSaved: getSerialNumber,
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                       cursorColor: Colors.white,
//                       decoration: InputDecoration(
//                         errorMaxLines: 2,
//                         errorBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.red, width: 2.0),
//                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                         ),
//                         errorStyle: TextStyle(
//                           backgroundColor: Colors.white,
//                         ),
//                         fillColor: Colors.red,
//                         border: OutlineInputBorder(
//                             borderSide:
//                                 BorderSide(color: Colors.white, width: 2.0),
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(10.0))),
//                         labelText: "ŞV seriya və nömrəsi",
//                         labelStyle: TextStyle(
//                           color: Colors.white,
//                         ),
//                         hintText: "Məs: AZE123456",
//                         hintStyle: TextStyle(
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 25.0,
//                     ),
//                     RaisedButton(
//                         color: Colors.deepOrange,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(5.0))),
//                         child: Text(
//                           "Yadda saxla",
//                           style: TextStyle(
//                             color: Colors.white,
//                           ),
//                         ),
//                         onPressed: onPressed)
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   String getSerialNumber(value) {
//     Utils.serialNumber = value;
//   }
//
//   void onPressed() {
//     print(_formKey.currentState.validate());
//     if (_formKey.currentState.validate())
//     {
//       Utils().toast(
//           message: "Vəsiqə uğurla qeydə alındı",
//           backgroundColor: Colors.greenAccent);
//
//       _formKey.currentState.save();
//       save();
//       print("on pressed login screen : " + Utils.serialNumber);
//
//       Utils().navigate(context, HomeScreen());
//     }
//   }
//
//   save() async {
//     final prefs = await SharedPreferences.getInstance();
//     final key = 'serialNumber';
//     prefs.setString(key, Utils.serialNumber);
//     print('saved ${Utils.serialNumber}');
//   }
//
//   String validateSerialNumber(String value)
//   {
//     String value2 = value.toUpperCase().trim();
//
//     if (value2 != null && value2.length == 9)
//     {
//       print("OK " + value + " " + value.length.toString());
//         return null;
//     } else
//       {
//         print("Error");
//       return "Seriya nömrəsini doğru daxil etdiyinizə əmin olun!";
//       }
//   }
//
//
//
// }
