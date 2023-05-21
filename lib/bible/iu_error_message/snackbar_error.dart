import 'package:flutter/material.dart';

class SnackBarError {
  call({required BuildContext context, required String massage}) {
    SnackBar snackBar = SnackBar(
      content: Text(massage.toString()),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
