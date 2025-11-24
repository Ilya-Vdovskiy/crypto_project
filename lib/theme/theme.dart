import 'package:flutter/material.dart';

final theme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 34, 34, 34),
  dividerTheme: DividerThemeData(color: Colors.white24),
  appBarTheme: AppBarTheme(
    backgroundColor: const Color.fromARGB(255, 34, 34, 34),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.w700,
    ),
    centerTitle: true,
  ),
  listTileTheme: ListTileThemeData(iconColor: Colors.white),
  textTheme: TextTheme(
    labelLarge: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
    labelMedium: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w300,
      fontSize: 14,
    ),
  ),
);
