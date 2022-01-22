import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern/widgets/search_bar/search_controller.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> with TickerProviderStateMixin {
  late final Animation<double> height;
  late final Animation<double> opacity;
  late final Animation<EdgeInsets> textAlignment;
  late AnimationController _animationController;
  SearchController searchController = SearchController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //Focus node for the text field
    searchController.focusNode = FocusNode();

    // Controller for the text field
    searchController.searchFieldController = TextEditingController();

    // Animation Controller
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);

    // Height animation for the texts
    height = Tween<double>(
      begin: 0,
      end: 130,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.0,
          0.400,
          curve: Curves.easeIn,
        ),
      ),
    );

    // Opacity animation for the texts
    opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.401,
          0.600,
          curve: Curves.ease,
        ),
      ),
    );

    // Alignment animation for the texts
    textAlignment = Tween<EdgeInsets>(
      begin: const EdgeInsets.only(left: 91),
      end: const EdgeInsets.only(left: 36),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.401,
          0.600,
          curve: Curves.easeIn,
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
    searchController.focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController, builder: _buildAnimation);
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Stack(
      alignment: Alignment.topRight,
      clipBehavior: Clip.antiAlias,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Colors.black12,
                blurRadius: 20,
                spreadRadius: 0.5,
                offset: Offset(0, 10),
              )
            ],
            borderRadius: BorderRadius.circular(40),
          ),
          child: Container(
            padding: textAlignment.value,
            height: height.value,
            width: 206,
            margin: EdgeInsets.only(top: 22),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(0),
                topLeft: Radius.circular(0),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Opacity(
              opacity: opacity.value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => searchController.searchItemClicked(
                        text: '#Nearby', controller: _animationController),
                    child: const Text(
                      '#Nearby',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xffA3A3A3),
                      ),
                    ),
                  ),
                  const Divider(
                    endIndent: 35.5,
                    thickness: 1,
                  ),
                  InkWell(
                    onTap: () => searchController.searchItemClicked(
                        text: '#Home', controller: _animationController),
                    child: const Text(
                      '#Home',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xffA3A3A3),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 206,
              height: 44,
              decoration: BoxDecoration(
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 0.1,
                  )
                ],
                borderRadius: BorderRadius.circular(40),
              ),
              child: TextFormField(
                focusNode: searchController.focusNode,
                controller: searchController.searchFieldController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  suffixIcon: IconButton(
                      color: const Color(0xffA3A3A3),
                      icon: const Icon(Icons.search),
                      splashColor: Colors.transparent,
                      splashRadius: 0.1,
                      onPressed: () {
                        searchController.isSearching.isTrue
                            ? searchController.playAnimationReverse(
                                focusNode: searchController.focusNode,
                                controller: _animationController)
                            : searchController.playAnimationForward(
                                focusNode: searchController.focusNode,
                                controller: _animationController);
                      }),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
