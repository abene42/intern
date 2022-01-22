import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchResultCardController extends GetxController {
  late final Animation<double> opacity;
  late final Animation<EdgeInsets> textAlignment;
  late final AnimationController animationController;

  SearchResultCardController({required this.animationController});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    // Opacity animation for the texts
    opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.401,
          0.600,
          curve: Curves.ease,
        ),
      ),
    );

    // Alignment animation for the texts
    textAlignment = Tween<EdgeInsets>(
      begin: const EdgeInsets.only(top: 60, left: 94),
      end: const EdgeInsets.only(top: 30, left: 94),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.401,
          0.600,
          curve: Curves.easeIn,
        ),
      ),
    );
  }
}
