import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_maintained/sms.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import '../utils/utils.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SharedPreferences preferences;
  SmsMessage smsMessage;
  TextEditingController controllerSerialNumber = new TextEditingController();

  String serial = "";

  @override
  void initState() {
    super.initState();
    getSerialNumber();
  }

  @override
  String setState(VoidCallback fn) {
    return Utils.serialNumber;
  }

  Future<String> getSerialNumber() async {
    WidgetsFlutterBinding.ensureInitialized();
    preferences = await SharedPreferences.getInstance();
    Utils.serialNumber = preferences.getString('serialNumber');

    print("HS getSerialNum " + Utils.serialNumber);

    return Utils.serialNumber;
  }

  void sendPermissionSMS(String message) {
    SmsSender smsSender = SmsSender();
    smsMessage = SmsMessage("8103", message);
    smsSender.sendSms(smsMessage);
  }

  void permissionForDoctor() {
    Utils().giffyDialog(
      context,
      imagePath: Image.asset("assets/images/ambulance.gif"),
      title: Text(
        "1 kodlu sms",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
        ),
      ),
      description: Text(
        "Həkim ziyarəti üçün sms icazə almaqistədiyinizdən əminsinizmi?",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18.0,
        ),
      ),
      buttonOkText: Text("Bəli"),
      buttonOkColor: Colors.green,
      buttonCancelText: Text("Xeyr"),
      buttonCancelColor: Colors.red,
      onOkButtonPressed: () {
        sendPermissionSMS("1 " + Utils.serialNumber);
        Navigator.pop(context);
        Utils().toast(
            message:
                "1 kodlu sms göndərildi. Təstiq mesajını aldıqdan sonra yaşayış yerinizi tərk edə bilərsiniz.");
      },
      onCancelButtonPressed: () => Navigator.pop(context),
      entryAnimation: EntryAnimation.RIGHT,
    );
  }

  void permissionForGrocery() {
    Utils().giffyDialog(
      context,
      imagePath: Image.asset("assets/images/shop_basket.gif"),
      title: Text(
        "2 kodlu sms icazə",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
        ),
      ),
      description: Text(
        "Şəxsi tələbatlar üçün icazə almaq istədiyinizdən əminsinizmi?",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18.0,
        ),
      ),
      buttonOkText: Text("Bəli"),
      buttonOkColor: Colors.green,
      buttonCancelText: Text("Xeyr"),
      buttonCancelColor: Colors.red,
      onOkButtonPressed: () {
        sendPermissionSMS("2 " + Utils.serialNumber);
        Navigator.pop(context);
        Utils().toast(
            message:
                "2 kodlu sms göndərildi. Təstiq mesajını aldıqdan sonra yaşayış yerinizi tərk edə bilərsiniz.");
      },
      onCancelButtonPressed: () => Navigator.pop(context),
      entryAnimation: EntryAnimation.LEFT,
    );

    print("sending sms " + smsMessage.address.toString());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Utils().onBackButtonPressed(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Image(image: AssetImage("assets/images/mylogo.png")),
              elevation: 55,
              shadowColor: Colors.white70,
              color: Colors.transparent,
            ),
            Card(
              color: Colors.green,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: FutureBuilder(
                        future: getSerialNumber(),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.active:
                              print(snapshot.connectionState.toString());
                              return Text(
                                Utils.serialNumber,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              );
                            case ConnectionState.done:
                              print(snapshot.connectionState.toString());
                              return Text(
                                Utils.serialNumber,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              );
                            case ConnectionState.waiting:
                              print(snapshot.connectionState.toString());
                              return Text(
                                "Waiting",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              );
                            case ConnectionState.none:
                              print(snapshot.connectionState.toString());
                              return Text(
                                "ŞV daxil edin",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              );
                            default:
                              return Text(
                                Utils.serialNumber,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              );
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        editSerialNumber();
                        controllerSerialNumber.text = Utils.serialNumber;
                      },
                    )
                  ],
                ),
                width: 230,
                height: 50,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: Colors.deepOrange,
                  elevation: 25,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Container(
                      // decoration: BoxDecoration(
                      //   color: Colors.red,
                      //   borderRadius: BorderRadius.circular(25.0),
                      // ),
                      width: 100,
                      height: 120,
                      child: IconButton(
                          icon: Icon(MdiIcons.ambulance,
                              color: Colors.white, size: 50.0),
                          onPressed: permissionForDoctor)),
                ),
                SizedBox(
                  width: 10,
                ),
                Card(
                  color: Colors.amberAccent,
                  elevation: 25,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    // decoration: BoxDecoration(
                    //   color: Colors.tealAccent,
                    //   borderRadius: BorderRadius.circular(25.0),
                    //),
                    width: 120,
                    height: 100,
                    child: IconButton(
                        icon: Icon(Icons.shopping_cart,
                            color: Colors.black, size: 45.0),
                        onPressed: permissionForGrocery),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _onChanged(String value) {
    setState(() => Utils.serialNumber = 'Change: ${controllerSerialNumber.text}');
  }

  void editSerialNumber() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
                margin: EdgeInsets.all(8.0),
                width: 300.0,
                height: 140.0,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: controllerSerialNumber,
                        onChanged: _onChanged,
                        autofocus: true,
                        decoration: InputDecoration(
                          labelText: "ŞV seriya nömrəsini daxil edin",
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          hintText: "Məs AA1234567",
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          animationDuration: Duration(milliseconds: 300),
                          onSurface: Colors.green,
                          onPrimary: Colors.red,
                          primary: Colors.amberAccent,
                        ),
                        onPressed: () async {
                          preferences.setString(
                              "serialNumber", controllerSerialNumber.text);
                          Utils().toast(
                              message: controllerSerialNumber.text + " nömrəli vəsiqə uğurla qeydə alındı",
                              backgroundColor: Colors.greenAccent);

                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomeScreen()));
                          //Navigator.pop(context);
                        },
                        child: Text(
                          "Qeyd et",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            backgroundColor: Colors.green,
            insetAnimationCurve: Curves.linearToEaseOut,
            insetAnimationDuration: Duration(milliseconds: 1500),
          );
        });
  }
}
