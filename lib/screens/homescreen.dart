import 'package:bettadrive/util/category_builder.dart';
import 'package:bettadrive/util/footer_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/constants.dart';
import '../widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      key: _scaffoldKey,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: primaryColor4,
        ),
        toolbarHeight: 0.0,
        elevation: 0.0,
        backgroundColor: primaryColor4,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [ListView(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          children: [
            SizedBox(
              height: screenHeight * 0.36,
              child:
              Stack(children: [
                Container(
                  height: screenWidth * 0.5,
                  decoration: const BoxDecoration(
                      color: primaryColor4,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15.0, top: 20.0, right: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 20.0,
                              width: 20.0,
                              child: GestureDetector(
                                child: Image.asset('images/hamburger.png', color: Colors.white, ),
                                onTap: () {
                                  _scaffoldKey.currentState?.openDrawer();
                                },
                              ),
                            ),
                            const CircleAvatar(
                              radius: 27.0,
                              backgroundImage: NetworkImage(
                                  imageURL),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Hi, $constName',
                              style: TextStyle(
                                  fontFamily: 'Quicksand-SemiBold',
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w600,
                                  color: primaryColor8),
                            ),
                            Text(
                              '($constID)',
                              style: TextStyle(
                                fontFamily: 'Quicksand-Regular',
                                fontSize: 22.0,
                                fontWeight: FontWeight.w400,
                                color: primaryColor8,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      height: screenHeight * 0.2,
                      width: screenWidth * 0.8,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 10.0,
                              spreadRadius: 0.002,
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                            ),
                          ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: const AssetImage('images/Home Display Image.png'),
                            height: screenHeight * 0.18,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ]),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Text(
                'Choose a category: ',
                style: TextStyle(
                  fontFamily: 'Quicksand-SemiBold',
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                  color: primaryColor2,
                ),
              ),
            ),
            SizedBox(
              width: screenWidth,
              height: screenHeight * 1.59,
              child: Column(
                children: [
                  CategoryBuilder(
                    onPress: () {
                      Navigator.pushNamed(context, '/sixth');
                    },
                    label: 'Road Signs',
                    imageLink: 'images/road signs.jpeg',
                  ),
                  CategoryBuilder(
                    onPress: () {
                      Navigator.pushNamed(context, '/sixth');
                    },
                    label: 'General Awareness',
                    imageLink: 'images/general awareness.jpeg',
                  ),
                  CategoryBuilder(
                    onPress: () {
                      Navigator.pushNamed(context, '/sixth');
                    },
                    label: 'Situation Based',
                    imageLink: 'images/Situation based.jpeg',
                  ),
                  CategoryBuilder(
                    onPress: () {
                      Navigator.pushNamed(context, '/sixth');
                    },
                    label: 'Random Questions',
                    imageLink: 'images/random questions.jpeg',
                  ),
                ],
              ),
            ),
          ],
        ),
          const Positioned(
            bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child:  FooterBar())
    ]
      ),
    );
  }
}
