import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showtoaster({required Color color,required String msg}){
  Fluttertoast.showToast(
      msg:msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 20);
}