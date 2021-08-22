import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kTextField= InputDecoration(

  fillColor: Colors.grey,
  // focusColor: Colors.grey,
  filled: true,
  hintText: 'Enter your name',
  //hintStyle: TextStyle(color: Colors.grey),
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),

  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);

const kTextFieldReg = TextStyle(fontSize: 14, fontWeight:FontWeight.w500, color: Color(0xffa8d1df), fontFamily: 'LibreBaskerville-Regular');

const kFontStyle =  TextStyle(color: Color(0xffEFEFEF), fontSize: 25.0,
  fontWeight: FontWeight.w900,);

const kAppBarBackColor = Color(0xff185ADB);

const kLightBlue = Color(0xffa8d1df);

const kMaroon = Color(0xff660B21);

const kDarkBlue = Color(0xff0A1931);

const kCardBlue = Color(0xff71102D);