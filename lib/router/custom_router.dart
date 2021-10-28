import 'package:flutter/material.dart';
import 'package:flutterbeki_app/UI/guest_page.dart';
import 'package:flutterbeki_app/UI/basic%20_info.dart';
import 'package:flutterbeki_app/UI/post.dart';
import 'package:flutterbeki_app/UI/regstration.dart';
import 'package:flutterbeki_app/router/route_constants.dart';

class CustomRouter {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => GestPage());
      case aboutRoute:
        return MaterialPageRoute(builder: (_) => dataFromDatabase());
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => FormScreen());
      default:
        return MaterialPageRoute(builder: (_) => BasicInfo());
    }
  }
}
