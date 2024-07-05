import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade300,
    primary: Colors.grey.shade200,
    secondary: Colors.grey.shade400,
    inversePrimary: const Color.fromARGB(255, 34, 34, 34)
  )
);


ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: const Color.fromARGB(255, 14, 13, 13),
    primary: const Color.fromARGB(255, 39, 39, 39),
    secondary: Colors.grey.shade800,
    inversePrimary: Colors.grey.shade300
  )
);