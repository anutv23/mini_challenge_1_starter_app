import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme with ChangeNotifier {
  var _themeType = ThemeType.Light;

  ThemeType get themeType => _themeType;

  MyTheme() {
    /// If the user changes the theme in their device's settings, this is picked up on as well:
    final window = WidgetsBinding.instance?.window;
    window?.onPlatformBrightnessChanged = () {
      final brightness = window.platformBrightness;

      switch (brightness) {
        case Brightness.dark:
          setThemeType(ThemeType.Dark);
          break;
        case Brightness.light:
          setThemeType(ThemeType.Light);
      }
    };
  }
  void setThemeType(ThemeType themeType) {
    _themeType = themeType;
    notifyListeners();
  }

  // todo(you) fill this in and make the different text styles visible in the text area look better in both light, dark and other mode?
  ThemeData get currentThemeData {
    switch (themeType) {
      case ThemeType.Light:
        return ThemeData(
            scaffoldBackgroundColor: Colors.yellow[50],
            primaryColor: Colors.amberAccent,
            accentColor: Colors.amber,
            appBarTheme: AppBarTheme(
              centerTitle: true,
              backgroundColor: Colors.yellow[50],
              textTheme: TextTheme(
                  headline6: TextStyle(
                          letterSpacing: 4,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Pacifico')
                      .apply(
                color: Colors.black54,
              )),
            ),
            textTheme: TextTheme(
                headline3:
                    TextStyle(letterSpacing: 3).apply(color: Color(0xffF2960B)),
                subtitle1: TextStyle().apply(color: Colors.brown),
                bodyText1: TextStyle(wordSpacing: 4).apply(
                  color: Colors.black54,
                )));
      case ThemeType.Dark:
        return ThemeData(
            scaffoldBackgroundColor: Colors.blueGrey[300],
            accentColor: Colors.blue,
            appBarTheme: AppBarTheme(
              centerTitle: true,
              backgroundColor: Colors.black,
              textTheme: TextTheme(
                  headline6: TextStyle(
                letterSpacing: 4,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ).apply(
                color: Colors.grey,
              )),
            ),
            textTheme: TextTheme(
                headline3: TextStyle(
                  fontFamily: 'Pacifico',
                        fontSize: 50,

                        letterSpacing: 3)
                    .apply(color: Colors.white),
                subtitle1: TextStyle(fontSize: 18).apply(color: Colors.white),
                bodyText1: TextStyle(wordSpacing: 2, fontSize: 15).apply(
                  color: Colors.orange[50],
                )));
      case ThemeType.Other:
        return ThemeData(
          appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: Colors.brown,
            textTheme: TextTheme(
                headline6: TextStyle(
              letterSpacing: 4,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ).apply(
              color: Colors.white,
            )),
          ),
        );
    }
  }
}

enum ThemeType {
  Light,
  Dark,
  Other,
}
