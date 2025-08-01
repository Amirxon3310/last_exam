import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_exam/controller/my_controller.dart';
import 'package:last_exam/view/pages/add_card_screen.dart';
import 'package:last_exam/view/widgets/w_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final cardController = Get.put(MyController()); // ✅

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddCardScreen(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Obx(() {
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: cardController.cardsList.length,
            itemBuilder: (context, index) {
              final card = cardController.cardsList[index];
              return WCard(
                card: card,
              );
            },
          );
        }),
      ),
    );
  }
}
