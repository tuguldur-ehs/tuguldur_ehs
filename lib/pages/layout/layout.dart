import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:hab_security_fornt/pages/home/view/home_screen.dart';
import 'package:hab_security_fornt/pages/info/view/info_screen.dart';
import 'package:hab_security_fornt/pages/layout/layoutController.dart';
import 'package:hab_security_fornt/pages/profile/view/profile_screen.dart';
import 'package:hab_security_fornt/pages/uniform/controller/uniform_controller.dart';

import '../files/view/file_screen.dart';

class Layout extends StatefulWidget {
  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final NavigationController bottomNavController =
      Get.put(NavigationController());

  final List<Widget> pages = [
    HomeScreen(),
    InfoPage(),
    UniformPage(),
    FilePage(),
    ProfilePage(),
  ];

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialog(
        title: 'Та системээс гарахдаа итгэлтэй байна уу?',
        message: 'Та өөрийн хаягаас гарсан байх болно.',
        confirmButtonText: 'Гарах',
        cancelButtonText: 'Болих',
        onConfirm: () async {
          // await TokenPreference().clearTokens();
          SystemNavigator.pop();
        },
        onCancel: () {},
      ),
    )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF172D46),
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 30),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Color(0xFF172D46),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.spa, size: 24, color: Colors.green),
                          Text(
                            'EHS',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Hi ${bottomNavController.tokenInfo.value}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(width: 8),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/profileImg.png'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Obx(
        () => pages[bottomNavController.selectedIndex.value],
      ),
      bottomNavigationBar: Obx(
        () => CurvedNavigationBar(
          backgroundColor: Color(0xFF172D46),
          // color: Color(0xFF7EF0CE),
          index: bottomNavController.selectedIndex.value,
          onTap: bottomNavController.changeTabIndex,
          items: const [
            Icon(Icons.home),
            Icon(Icons.info),
            Icon(Icons.shop),
            Icon(Icons.file_copy),
            Icon(Icons.man),
          ],
        ),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmButtonText;
  final String cancelButtonText;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const CustomDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.confirmButtonText,
    required this.cancelButtonText,
    required this.onConfirm,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black26,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text(
        maxLines: 2,
        title,
        style: TextStyle(
          color: Colors.white
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          message,
          style: TextStyle(fontSize: 13, color: Colors.white),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            onCancel();
            Navigator.of(context).pop();
          },
          child: Text(
            cancelButtonText,
            style: TextStyle(
              color: Colors.red,
              fontSize: 16,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            onConfirm();
            Navigator.of(context).pop();
          },
          child: Text(
            confirmButtonText,
            style: TextStyle(
              color: Colors.green,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
