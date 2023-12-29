import 'package:flutter/material.dart';
import 'package:premier_league_app_6404800010/stack2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teay Map',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.purple,
          // กำหนดสีหลักของแอป
        ),
      ),

      initialRoute: '/homestack',
      routes: {
        '/homestack': (context) => const Stack2(),
        '/productstack': (context) => const Stack(),
      },
      debugShowCheckedModeBanner: false, //ลบ Banner ขวาบน
    );
  }
}

