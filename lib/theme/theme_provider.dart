import 'package:flutter/material.dart';
import 'package:notes_app/theme/theme.dart';

class ThemeProvider extends ChangeNotifier{
  //initially theme is light mode
  ThemeData _themeData = lightMode;

  //getter method to access the theme from other parts of the code
  ThemeData get themeData => _themeData;

  // getter method to see if we are in dark mode or not
  bool get isDarkMode => _themeData == darkMode; 

  // setter method to set the new theme
  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }

  // to toggle between light and dark theme
  void toggleTheme(){
    if(_themeData == lightMode){
      themeData = darkMode;
    }
    else{
      themeData = lightMode;
    }
  }
}