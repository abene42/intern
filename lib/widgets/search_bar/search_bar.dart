import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> with TickerProviderStateMixin {
  bool isSearching = false;
  late final Animation<double> height;
  late final Animation<double> opacity;
  late final Animation<EdgeInsets> textAlignment;
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);

    // Height animation for the texts
    height = Tween<double>(
      begin: 20,
      end: 130,
    ).animate(
      CurvedAnimation(
        parent: _controller,
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
        parent: _controller,
        curve: const Interval(
          0.401,
          0.600,
          curve: Curves.ease,
        ),
      ),
    );

    // Alignment animation for the texts
    textAlignment = Tween<EdgeInsets>(
      begin: const EdgeInsets.only(top: 52, left: 91),
      end: const EdgeInsets.only(top: 52, left: 36),
    ).animate(
      CurvedAnimation(
        parent: _controller,
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
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: _controller, builder: _buildAnimation);
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Stack(
      alignment: Alignment.topRight,
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
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                topLeft: Radius.circular(25),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Opacity(
              opacity: opacity.value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '#Nearby',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xffA3A3A3),
                    ),
                  ),
                  Divider(
                    endIndent: 35.5,
                    thickness: 1,
                  ),
                  Text(
                    '#Home',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xffA3A3A3),
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
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  suffixIcon: IconButton(
                    color: Color(0xffA3A3A3),
                    icon: Icon(Icons.search),
                    onPressed: () {
                      isSearching
                          ? _playAnimationReverse()
                          : _playAnimationForward();
                    },
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _playAnimationForward() async {
    try {
      await _controller.forward().orCancel;
      setState(() {
        isSearching = true;
      });
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  Future<void> _playAnimationReverse() async {
    try {
      await _controller.reverse().orCancel;
      setState(() {
        isSearching = false;
      });
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }
}
