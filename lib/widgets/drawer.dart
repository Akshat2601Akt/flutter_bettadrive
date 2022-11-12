import 'package:flutter/material.dart';

import '../constants/constants.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  const NavigationDrawerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const userName = 'Akshat Khandelwal';
    const userID = constID;
    const urlImage = imageURL;
    return Drawer(
      child: Material(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              userName: userName,
              userID: userID,
            ),
            const Divider(
              thickness: 2.0,
              color: Color(0xffE3E3E3),
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Home',
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 33),
                  buildMenuItem(
                    text: 'My Profile',
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 33),
                  buildMenuItem(
                    text: 'Recent Tests',
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 33),
                  buildMenuItem(
                    text: 'Sign Out',
                    onClicked: () => selectedItem(context, 3),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String userName,
    required String userID,
  }) =>
      InkWell(
        child: Container(
          padding: padding.add(const EdgeInsets.only(top: 40.0, bottom: 20.0)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: const TextStyle(
                        fontFamily: 'Quicksand-SemiBold',
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    userID,
                    style: const TextStyle(
                      fontFamily: 'Quicksand-Regular',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.black45,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    required String text,
    VoidCallback? onClicked,
  }) {
    return GestureDetector(
      onTap: onClicked,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          text,
          style: const TextStyle(
            fontFamily: 'Quicksand-Regular',
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),
        ),
        const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 14.0,
        ),
      ]),
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/ninth');
        break;
      case 1:
        Navigator.pushNamed(context, '/fifteenth');
        break;
      case 2:
        Navigator.pushNamed(context, '/seventh');
        break;
      case 3:
        Navigator.pushNamed(context, '/second');
        break;
    }
  }
}