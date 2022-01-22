import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  var isSearching = false.obs;
  late FocusNode focusNode = FocusNode();
  late TextEditingController searchFieldController = TextEditingController();

  // Animation for the search recommendations to pop out
  void playAnimationForward(
      {required FocusNode focusNode,
      required AnimationController controller}) async {
    try {
      focusNode.requestFocus();
      await controller.forward().orCancel;
      isSearching.value = true;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  // Animation for the search recommendations to pop back in
  void playAnimationReverse(
      {required FocusNode focusNode,
      required AnimationController controller}) async {
    try {
      await controller.reverse().orCancel;
      isSearching.value = false;
      focusNode.unfocus();
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  // Sets the text field value to the clicked text and removes the search recommendations
  searchItemClicked(
      {required String text, required AnimationController controller}) {
    playAnimationReverse(focusNode: focusNode, controller: controller);
    searchFieldController.text = text;
  }
}
