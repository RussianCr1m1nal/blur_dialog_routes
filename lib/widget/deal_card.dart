import 'package:blur_bg_dialog/entity/deal.dart';
import 'package:flutter/material.dart';

class DealCard extends StatelessWidget {
  final Deal deal;

  const DealCard({Key? key, required this.deal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              deal.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              deal.sum.toString(),
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
