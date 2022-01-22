import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern/pages/search-page/search_page_controller.dart';
import 'package:intern/widgets/profile_photo_avatar/profile_photo_avatar.dart';
import 'package:intern/widgets/search_bar/search_bar.dart';
import 'package:intern/widgets/search_result_section/search_result_section.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late final SearchPageController _searchPageController;

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    _searchPageController =
        SearchPageController(animationController: _animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: const Color(0xffF4F4F4),
      child: Scaffold(
        backgroundColor: const Color(0xffF4F4F4),
        body: Stack(
          children: [
            SearchResultSection(
              searchPageController: _searchPageController,
            ),
            Container(
              width: Get.width,
              padding: const EdgeInsets.only(right: 58, left: 58, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ProfilePhotoAvatar(
                        imageUrl: 'assets/images/person_placeholder.png',
                        colors: const [
                          Colors.purpleAccent,
                          Colors.red,
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SearchBar(
                        searchPageController: _searchPageController,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xffA3A3A3),
          unselectedItemColor: const Color(0xffA3A3A3),
          iconSize: 30,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
              tooltip: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.group_outlined),
                label: 'Group',
                tooltip: 'Group'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_outlined),
                label: 'Notification',
                tooltip: 'Notification'),
            BottomNavigationBarItem(
              icon: Icon(Icons.tune),
              label: 'Settings',
              tooltip: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
