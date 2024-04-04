import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData appTheme() {
  return ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
      constraints: BoxConstraints(
          maxHeight: 50, maxWidth: 270, minHeight: 50, minWidth: 270),
      fillColor: Colors.white,
      filled: true,
      suffixIconColor: const Color(0xff64748b),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 1,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: const BorderSide(color: Colors.white, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 1.4,
        ),
      ),
    ),
    textTheme: TextTheme(
        headlineLarge: const TextStyle(
          fontSize: 32,
          color: Color(0xff1E293B),
          fontWeight: FontWeight.w800,
        ),
        bodyLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        bodySmall: const TextStyle(
          color: Color(0xff1E293B),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: const TextStyle(
          color: Color(0xff1E293B),
          fontSize: 18,
        ),
        labelSmall: const TextStyle(
          color: Color(0xff1E293B),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        labelMedium: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        displaySmall: const TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
        displayMedium: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        )),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color.fromARGB(255, 234, 234, 234),
      selectedItemColor: Colors.black,
      elevation: 20,
    ),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ).copyWith(
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
      ),
      color: Colors.white,
      elevation: 0,
      iconTheme: const IconThemeData(
        color: Colors.black,
        size: 24,
      ),
      titleTextStyle: const TextStyle(
          fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
    ),
  );
}
