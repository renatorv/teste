import 'package:flutter/material.dart';

const kPrimary = Color(0xFF009340);
const kSecondary = Color(0xFFFF8628);
const kBackgroundLight = Color(0xFFe8f1f2);
const kBackgroundDark = Color(0xFF272932);
const kDark = Color(0xFF1a1b1e);
const kOffWhite = Color(0xffF3F4F8);
const kOffBlack = Color(0xFF000000);

class Temas {
  Temas._();
  // Tema Light
  static final lightTheme = ThemeData.light().copyWith(
    splashColor: Colors.transparent,
    scaffoldBackgroundColor: kOffBlack,
    textTheme: ThemeData.light().textTheme.apply(
          fontFamily: 'Sarpanch',
          bodyColor: Colors.black,
        ),
    primaryTextTheme: ThemeData.light().textTheme.apply(
          fontFamily: 'Sarpanch',
          bodyColor: Colors.black,
        ),
  );

  // Tema Dark
  static final darkTheme = ThemeData.dark().copyWith(
    splashColor: Colors.transparent,
    scaffoldBackgroundColor: kOffBlack,
    textTheme: ThemeData.light().textTheme.apply(
          fontFamily: 'Sarpanch',
          bodyColor: Colors.white,
        ),
    primaryTextTheme: ThemeData.light().textTheme.apply(
          fontFamily: 'Sarpanch',
          bodyColor: Colors.white,
        ),
  );
}
