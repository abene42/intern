import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPageController extends GetxController {
  // State variable for the searching state
  var isSearching = false.obs;

  // Focus node for search bar text field
  late FocusNode focusNode = FocusNode();
  late TextEditingController searchFieldController = TextEditingController();

  // Animation controller for all animations happening on the search page
  AnimationController animationController;

  SearchPageController({required this.animationController});

  // Toggle the isSearching state variable
  toggleIsSearching() {
    isSearching.value = !isSearching.value;
    if (isSearching.isTrue) {
      playAnimationForward();
    } else {
      playAnimationReverse();
    }
  }

  // Animation for the search recommendations to pop out
  void playAnimationForward() async {
    try {
      focusNode.requestFocus();
      await animationController.forward().orCancel;
      isSearching.value = true;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  // Animation for the search recommendations to pop back in
  void playAnimationReverse() async {
    try {
      await animationController.reverse().orCancel;
      isSearching.value = false;
      focusNode.unfocus();
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  // Sets the text field value to the clicked text and removes the search recommendations
  searchItemClicked({required String text}) {
    playAnimationReverse();
    searchFieldController.text = text;
  }
}
