import 'package:flutter/material.dart';
import 'package:premier_league_app_6404800010/MyHomePage.dart';
import 'package:premier_league_app_6404800010/premier_team.dart';
import 'package:premier_league_app_6404800010/premier_map.dart';

class Stack2 extends StatefulWidget {
  const Stack2({super.key});

  @override
  State<Stack2> createState() => _Stack2State();
}

class _Stack2State extends State<Stack2> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'stack/main',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'stack/main':
            builder = (BuildContext context) => const MyHomepage();
            break;
          case 'stack/teamball':
            builder = (BuildContext context) => const premierTeam();
            break;
          case 'stack/map':
            builder = (BuildContext context) => const premierMap();
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute<void>(builder: builder, settings: settings);
      },
    );
  }
}