import 'package:flutter/material.dart';
import 'package:intern/pages/search-page/search_page_controller.dart';
import 'package:intern/widgets/profile_photo_avatar/profile_photo_avatar.dart';

class SearchResultCard extends StatefulWidget {
  final SearchPageController searchPageController;
  const SearchResultCard({Key? key, required this.searchPageController})
      : super(key: key);

  @override
  State<SearchResultCard> createState() => _SearchResultCardState();
}

class _SearchResultCardState extends State<SearchResultCard>
    with TickerProviderStateMixin {
  late final Animation<double> opacity;
  late final Animation<EdgeInsets> textAlignment;
  late final SearchPageController searchPageController;
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    searchPageController = widget.searchPageController;
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 400),
        reverseDuration: const Duration(milliseconds: 100));

    // Opacity animation for the texts
    opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.000,
          0.400,
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
        parent: _animationController,
        curve: const Interval(
          0.001,
          0.400,
          curve: Curves.easeIn,
        ),
      ),
    );

    _animationController.forward();

    searchPageController.isSearching.listen((isSearching) {
      isSearching
          ? _animationController.reverse().orCancel
          : _animationController.forward().orCancel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: buildSearchResultsCardWithAnimation);
  }

  Widget buildSearchResultsCardWithAnimation(
      BuildContext context, Widget? child) {
    return Opacity(
      opacity: opacity.value,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 80,
            margin: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color(0xffA3A3A3),
                  offset: Offset(-1, 1),
                  blurRadius: 5,
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 21),
                  child: ProfilePhotoAvatar(
                    colors: const [
                      Color(0xff00FA9A),
                      Color(0xff00FA9A),
                    ],
                    imageUrl: 'assets/images/person_placeholder.png',
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: textAlignment.value,
            // color: Colors.deepPurple,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Daniel Masresha',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w100,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.left,
                ),
                const Divider(
                  thickness: 0.2,
                  color: Colors.black,
                  endIndent: 94,
                  height: 1,
                ),
                IntrinsicHeight(
                  child: Row(
                    children: const [
                      Text(
                        'Photography',
                        style: TextStyle(
                          color: Color(0xffA3A3A3),
                          fontSize: 10,
                        ),
                      ),
                      VerticalDivider(
                        color: Color(0xffA3A3A3),
                        indent: 2,
                        endIndent: 2,
                      ),
                      Text(
                        'Painting',
                        style: TextStyle(
                          color: Color(0xffA3A3A3),
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
