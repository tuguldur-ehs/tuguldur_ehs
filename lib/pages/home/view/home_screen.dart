import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text('home')),
      ),
    );

    // return GetBuilder(
    //   init: HomeController(),
    //   builder: (HomeController controller) {
    //     return Scaffold(
    //       body: Container(
    //         child: Text('home'),
    //       ),
    //     );
    //   },
    // );
  }
}
