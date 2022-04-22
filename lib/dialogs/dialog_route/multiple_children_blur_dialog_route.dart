import 'dart:ui';

import 'package:flutter/material.dart';

class MultipleChildrenBlurDialogRoute<T> extends PopupRoute<T> {
  final double blurSigmaX;
  final double blurSigmaY;
  final List<Widget> children;
  final bool useSafeArea;
  final MainAxisAlignment verticalAlignment;
  final CrossAxisAlignment horizontalAlignment;

  MultipleChildrenBlurDialogRoute({
    required this.children,
    this.blurSigmaX = 0.0,
    this.blurSigmaY = 0.0,
    this.useSafeArea = true,
    this.verticalAlignment = MainAxisAlignment.start,
    this.horizontalAlignment = CrossAxisAlignment.start,
    bool barrierDismissible = true,
    Color? barrierColor = const Color(0x80000000),
    String? barrierLabel,
    Duration transitionDuration = const Duration(milliseconds: 200),
    RouteSettings? settings,
  })  : _barrierColor = barrierColor,
        _barrierDismissible = barrierDismissible,
        _barrierLabel = barrierLabel,
        _transitionDuration = transitionDuration,
        super(settings: settings);

  @override
  Color? get barrierColor => _barrierColor;
  final Color? _barrierColor;

  @override
  bool get barrierDismissible => _barrierDismissible;
  final bool _barrierDismissible;

  @override
  String? get barrierLabel => _barrierLabel;
  final String? _barrierLabel;

  @override
  Duration get transitionDuration => _transitionDuration;
  final Duration _transitionDuration;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    final child = Column(
      mainAxisAlignment: verticalAlignment,
      crossAxisAlignment: horizontalAlignment,
      children: children
          .asMap()
          .entries
          .map(
            (entry) => AnimatedBuilder(
              child: entry.value,
              animation: animation,
              builder: (context, _child) {
                return SlideTransition(
                  child: _child,
                  position: Tween<Offset>(
                    begin: Offset(entry.key % 2 == 0 ? 1 : -1, 0),
                    end: const Offset(0, 0),
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Interval(
                        entry.key * (1 / children.length),
                        entry.key * (1 / children.length) + 1 / children.length,
                        curve: Curves.fastOutSlowIn,
                      ),
                    ),
                  ),
                );
              },
            ),
          )
          .toList(),
    );

    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: blurSigmaX,
        sigmaY: blurSigmaY,
      ),
      child: useSafeArea ? SafeArea(child: child) : child,
    );
  }
}
