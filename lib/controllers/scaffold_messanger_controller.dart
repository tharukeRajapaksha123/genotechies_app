import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaffoldMessageController {
  Future<void> showSnackBar(String title, BuildContext context) async {
    SnackBar snackBar = SnackBar(content: Text(title));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
