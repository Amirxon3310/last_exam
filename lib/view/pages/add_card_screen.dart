import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:last_exam/controller/my_controller.dart';
import 'package:last_exam/model/card_model.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final dateController = TextEditingController();
  final typeController = TextEditingController();
  final balanceController = TextEditingController();
  final bankController = TextEditingController();

  final myController = Get.find<MyController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 60, left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(10),
                    backgroundColor: Color(0xFF536DFF),
                  ),
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
                Text(
                  'Add Card',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                IconButton(
                    onPressed: () async {
                      // var cardDetails = await CardScanner.scanCard();
                      // if (cardDetails != null) {
                      //   print('Card number: ${cardDetails.cardNumber}');
                      //   print('Expiry: ${cardDetails.expiryDate}');
                      // }
                    },
                    icon: Icon(Icons.camera))
              ],
            ),
            SizedBox(height: 20),
            Text(
              'To add a new card, please fill out the fields below carefully in order to add card successfully.',
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            buildLabel("Card Number"),
            buildTextField(
                hintText: "1234-5678-1234-5678", controller: numberController),

            //!
            buildLabel("Holder’s Name"),
            buildTextField(
                hintText: "William Smith", controller: nameController),

            //!
            buildLabel("Expiry Date"),
            buildTextField(
              hintText: "11/25",
              controller: dateController,
            ),

            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                myController.addCard(
                  CardModel(
                    bank: balanceController.text,
                    date: dateController.text,
                    name: nameController.text,
                    number: numberController.text,
                    summa: 999,
                    type: typeController.text,
                  ),
                );
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF536DFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
              ),
              child: Text(
                'Confirm',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 4),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              color: Color(0xFF536DFF),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField({
    required String hintText,
    required TextEditingController controller,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF536DFF)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF536DFF)),
        ),
        hintStyle: TextStyle(
          color: Colors.black.withAlpha(100),
        ),
      ),
    );
  }
}
