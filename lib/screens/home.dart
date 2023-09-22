import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/authentication.dart';
import 'package:flutter_application_1/screens/service.dart';

class MyPageHome extends StatefulWidget {
  const MyPageHome({super.key});

  @override
  State<MyPageHome> createState() => _MyAppState();
}

class _MyAppState extends State<MyPageHome> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Center(
              child: TabBarView(
            children: [
              Authentication(),
              ServiceScreen(),
            ],
          )),
        ));
  }
}
