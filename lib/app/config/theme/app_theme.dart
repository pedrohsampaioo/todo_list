import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static ThemeData configured(BuildContext context) => ThemeData(
        indicatorColor: Colors.black,
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.transparent,
        ),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ).copyWith(
          headline1: TextStyle(
            fontSize: 42,
            height: 1,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          headline2: TextStyle(
            fontSize: 32,
            height: 1,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          headline3: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          headline4: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
          headline5: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          headline6: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
          bodyText1: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          bodyText2: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
          subtitle1: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
          subtitle2: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            decoration: TextDecoration.underline,
            color: Colors.black,
          ),
        ),
      );
}
