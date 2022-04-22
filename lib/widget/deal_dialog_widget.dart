import 'package:blur_bg_dialog/entity/deal.dart';
import 'package:blur_bg_dialog/widget/deal_card.dart';
import 'package:blur_bg_dialog/widget/deal_menu.dart';
import 'package:flutter/material.dart';

class DealDialogWidget extends StatelessWidget {
  const DealDialogWidget({
    Key? key,
    required this.deal,
  }) : super(key: key);

  final Deal deal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: DealCard(
              deal: deal,
            ),
          ),
          const DealMenu(),
        ],
      ),
    );
  }
}
