import 'package:flutter/material.dart';
import 'package:last_exam/model/card_model.dart';

class WCard extends StatelessWidget {
  final CardModel card;
  const WCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xff5366BE),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        child: Column(
          spacing: 8,
          children: [
            Row(
              children: [
                Text(
                  card.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Text(
                  card.type,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  card.number,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Spacer(),
                Text(
                  card.date,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Text(
                  "Your Balance",
                  style: TextStyle(
                    color: Colors.white.withAlpha(150),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "${card.summa}",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                Spacer(),
                Text(
                  card.bank,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
