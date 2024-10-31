import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF172D46),
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
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
                    bottomNavController.tokenInfo.value,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(width: 8),
                  CircleAvatar(
                    radius: 33,
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
