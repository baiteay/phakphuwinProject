import 'package:flutter/material.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 131, 131, 131), // กำหนดสีของ AppBar ที่นี่
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'stack/teamball');
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 209, 199, 199),onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(
                      horizontal: 120, vertical: 30), // ปรับขนาดพื้นที่ปุ่ม
                ),
                child: Text("เข้าดูทีม", style: TextStyle(fontSize: 25))),
          ],
        ),
      ),
    );
  }
}
