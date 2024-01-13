import 'package:flutter/material.dart';
import 'package:weather_app/screen/main_screen.dart';

import '../screen/search_screen.dart';

@immutable
class ScreenNavigation {
  const ScreenNavigation._();
  static Map<String, Widget Function(BuildContext context)> routes() {
    return {
      ScreenAddresses.mainScreen: (context) => MainScreen(),
      ScreenAddresses.searchScreen: (context) => SearchScreen()
    };
  }
}

class ScreenAddresses {
  const ScreenAddresses._();
  static const String mainScreen = '/main_screen';

  //====Before Auth===========
  static const String searchScreen = '/search_screen';
}
