import 'package:flutter/material.dart';

final lightTheme = ThemeData.light().copyWith(
  appBarTheme: const AppBarTheme(
    shape: Border(
      bottom: BorderSide(color: Colors.black),
    ),
  ),
  colorScheme: const ColorScheme.light(
    primary: Colors.blue,
    onPrimary: Colors.black,
    surfaceTint: Colors.transparent,
  ),
  dividerTheme: const DividerThemeData(color: Colors.black26),
  dialogTheme: const DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      side: BorderSide(color: Colors.black),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.zero),
    ),
  ),
);

final darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    shape: Border(
      bottom: BorderSide(color: Colors.white54),
    ),
  ),
  colorScheme: const ColorScheme.dark(
    primary: Colors.blue,
    onPrimary: Colors.white,
    surface: Colors.black,
    surfaceTint: Colors.transparent,
  ),
  dividerTheme: const DividerThemeData(color: Colors.white24),
  dialogTheme: const DialogTheme(
    backgroundColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      side: BorderSide(color: Colors.white),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.zero),
    ),
  ),
);
