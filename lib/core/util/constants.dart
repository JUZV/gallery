import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Constants {
  static void showErrorDialog({
    required BuildContext context,
    required String msg,
  }) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(
              msg,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    textStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold)),
                child: const Text('OK'),
              ),
            ],
          );
        });
  }

  static void showToast({
    required String msg,
    Color? color,
    ToastGravity? gravity,
  }) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: color ?? Colors.amber,
      gravity: gravity ?? ToastGravity.BOTTOM,
    );
  }

  static void printFullText(String txt) {
    final pattern = RegExp('.{1,800}');
    pattern.allMatches(txt).forEach((match) => print(match.group(0)));
  }
}
