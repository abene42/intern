import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern/pages/search-page/search_page_controller.dart';
import 'package:intern/widgets/search_result_card/search_result_card.dart';

class SearchResultSection extends StatelessWidget {
  final SearchPageController searchPageController;

  const SearchResultSection({Key? key, required this.searchPageController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.pink,
      width: Get.width,
      height: double.maxFinite,
      margin: const EdgeInsets.only(top: 75),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SearchResultCard(
              searchPageController: searchPageController,
            ),
            SearchResultCard(
              searchPageController: searchPageController,
            ),
            SearchResultCard(
              searchPageController: searchPageController,
            ),
            SearchResultCard(
              searchPageController: searchPageController,
            ),
            SearchResultCard(
              searchPageController: searchPageController,
            ),
          ],
        ),
      ),
    );
  }
}
