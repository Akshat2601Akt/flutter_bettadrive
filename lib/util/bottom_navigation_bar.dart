import 'package:flutter/material.dart';
import '../constants/constants.dart';

enum Menu {home, cart, track}
Menu selectedMenu = Menu.home;

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.only(
          left: screenWidth * 0.046,
          right: screenWidth * 0.046,
          bottom: screenHeight * 0.0169),
      height: screenHeight * 0.0812,
      decoration: BoxDecoration(
          color: primaryColor5,
          borderRadius: BorderRadius.circular(screenHeight * 0.033)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                Navigator.pushNamed(context, '/fifth');
                selectedMenu = Menu.home;
              });
            },
            child: Column(
              children: [
                Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                      color: (ModalRoute.of(context)!.settings.name == '/fifth' || ModalRoute.of(context)!.settings.name == '/sixth')
                          ? primaryColor7
                          : primaryColor5,
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: Icon(
                    Icons.home_rounded,
                    color: (ModalRoute.of(context)!.settings.name == '/thirteenth')
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                const Text('Home',
                style: TextStyle(
                  fontSize: 15.0
                ),),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedMenu = Menu.cart;
                Navigator.pushNamed(context, '/thirteenth');
              });
            },
            child: Container(
              height: 40.0,
              width: 40.0,
              padding: const EdgeInsets.all(9.0),
              decoration: BoxDecoration(
                  color: (ModalRoute.of(context)!.settings.name == '/thirteenth')
                      ? primaryColor7
                      : primaryColor5,
                  borderRadius: BorderRadius.circular(20.0)
              ),
              child: Icon(
                  Icons.file_copy_outlined,
                color: (ModalRoute.of(context)!.settings.name == '/thirteenth')
                    ? Colors.white
                    : Colors.black,
                ),
              ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedMenu = Menu.track;
                Navigator.pushNamed(context, '/eleventh');
              });
            },
            child: Container(
              height: 40.0,
              width: 40.0,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: (ModalRoute.of(context)!.settings.name == '/eleventh')
                      ? primaryColor7
                      : primaryColor5,
                  borderRadius: BorderRadius.circular(20.0)
              ),
              child: Icon(
                Icons.map_outlined,
                color: (ModalRoute.of(context)!.settings.name == '/eleventh')
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
