import 'package:flutter/material.dart';
import 'package:premier_league_app_6404800010/premier_map.dart';
import 'package:premier_league_app_6404800010/premier_team.dart';

class Stack extends StatefulWidget {
  const Stack({super.key});

  @override
  State<Stack> createState() => _StackState();
}

class _StackState extends State<Stack> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'stack/teamball',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
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