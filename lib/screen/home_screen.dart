import 'package:blur_bg_dialog/dialogs/dialog_route/blur_dialog_route.dart';
import 'package:blur_bg_dialog/dialogs/dialog_route/multiple_children_blur_dialog_route.dart';
import 'package:blur_bg_dialog/entity/deal.dart';
import 'package:blur_bg_dialog/widget/deal_card.dart';
import 'package:blur_bg_dialog/widget/deal_dialog_widget.dart';
import 'package:blur_bg_dialog/widget/deal_menu.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Deal> deals = [
      Deal(id: 1, name: 'Deal 1', sum: 100),
      Deal(id: 2, name: 'Deal 2', sum: 200),
      Deal(id: 3, name: 'Deal 3', sum: 300),
      Deal(id: 4, name: 'Deal 4', sum: 400),
      Deal(id: 5, name: 'Deal 5', sum: 500),
      Deal(id: 6, name: 'Deal 6', sum: 600),
      Deal(id: 1, name: 'Deal 1', sum: 100),
      Deal(id: 2, name: 'Deal 2', sum: 200),
      Deal(id: 3, name: 'Deal 3', sum: 300),
      Deal(id: 4, name: 'Deal 4', sum: 400),
      Deal(id: 5, name: 'Deal 5', sum: 500),
      Deal(id: 6, name: 'Deal 6', sum: 600),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Blur BG demo')),
      body: ListView.builder(
        itemCount: deals.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onLongPressStart: (LongPressStartDetails details) {
              // BLUR ROUTE

              // Navigator.of(context).push(
              //   BlurDialogRoute(
              //     barrierColor: Colors.black.withOpacity(0.2),
              //     blurSigmaX: 3,
              //     blurSigmaY: 3,
              //     startPosition: details.globalPosition,
              //     builder: (context) {
              //       return DealDialogWidget(
              //         deal: deals[index],
              //       );
              //     },
              //   ),
              // );

              // BLUR ROUTE MULTIPLE CHILDREN

              Navigator.of(context).push(
                MultipleChildrenBlurDialogRoute(
                  barrierColor: Colors.black.withOpacity(0.2),
                  offsetTop: details.globalPosition.dy,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: DealCard(
                        deal: deals[index],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: DealMenu(),
                    ),
                  ],
                  blurSigmaX: 3,
                  blurSigmaY: 3,
                ),
              );
            },
            child: DealCard(deal: deals[index]),
          );
        },
      ),
    );
  }
}
