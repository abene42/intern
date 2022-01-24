import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern/widgets/profile_photo_avatar/profile_photo_avatar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/entoto-park.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      bottom: 76,
                      left: 41,
                      child: ProfilePhotoAvatar(
                        imageUrl: 'assets/images/person_placeholder.png',
                        colors: const [Colors.red, Colors.purple],
                        radius: 50,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(36),
                  child: Column(
                    children: const [
                      Divider(
                        thickness: 1,
                        indent: 60,
                        endIndent: 60,
                        height: 0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          'Information',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        indent: 60,
                        endIndent: 60,
                        height: 0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
