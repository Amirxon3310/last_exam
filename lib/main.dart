import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:last_exam/controller/my_controller.dart';
import 'package:last_exam/view/pages/home_screen.dart';

void main() {
  Get.put(MyController());
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
