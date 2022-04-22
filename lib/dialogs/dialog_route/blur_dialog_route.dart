import 'dart:ui';

import 'package:flutter/material.dart';

class BlurDialogRoute<T> extends PopupRoute<T> {
  final double blurSigmaX;
  final double blurSigmaY;
  final WidgetBuilder builder;
  final bool useSafeArea;
  final Offset startPosition;

  BlurDialogRoute({
    required this.builder,
    this.blurSigmaX = 0.0,
    this.blurSigmaY = 0.0,
    this.startPosition = const Offset(0, 0),
    this.useSafeArea = true,
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
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: blurSigmaX,
        sigmaY: blurSigmaY,
      ),
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, _child) {
          return Transform.scale(
            origin: Offset(
              -(MediaQuery.of(context).size.width / 2) + startPosition.dx,
              -(MediaQuery.of(context).size.height / 2) + startPosition.dy,
            ),
            scale: animation.value,
            child: _child,
          );
        },
        child: useSafeArea ? SafeArea(child: builder(context)) : builder(context),
      ),
    );
  }
}
