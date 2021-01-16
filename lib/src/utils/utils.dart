import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class Utils {
  static String serialNumber = "";

  void toast({String message, Color backgroundColor, Color textColor}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: backgroundColor ?? Colors.red,
        textColor: textColor ?? Colors.white,
        fontSize: 16.0);
  }

  void navigate(context, Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  Future<bool> onBackButtonPressed(context) {
    giffyDialog(
      context,
      title: Text("Çıxış"),
      description: Text('Tətbiqi yekunlaşdırmaq istədiyinizdən əminsinizmi?'),
      buttonOkText: Text("Bəli"),
      buttonCancelText: Text("Xeyr"),
      onOkButtonPressed: () {
        exit(0);
      },
      onCancelButtonPressed: () => Navigator.pop(context),
      imagePath: Image.asset("assets/images/goodluck.gif"),
    );
  }

  void giffyDialog(
    context, {
    @required Image imagePath,
    Text title,
    Text description,
    Text buttonOkText,
    Color buttonOkColor,
    Text buttonCancelText,
    Color buttonCancelColor,
    Function onOkButtonPressed,
    Function onCancelButtonPressed,
    double buttonRadius,
    double cornerRadius,
    EntryAnimation entryAnimation,
  }) {
    showDialog(
        context: context,
        builder: (_) => AssetGiffyDialog(
              image: imagePath,
              title: title,
              description: description,
              buttonOkText: buttonOkText,
              buttonOkColor: buttonOkColor,
              buttonCancelText: buttonCancelText,
              buttonCancelColor: buttonCancelColor,
              onOkButtonPressed: onOkButtonPressed,
              onCancelButtonPressed: onCancelButtonPressed,
              entryAnimation: entryAnimation ?? EntryAnimation.BOTTOM_RIGHT,
            ));
  }
}
