import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:travellingg_viajes/pages/drawer/menu_screen.dart';
import 'package:travellingg_viajes/pages/main_screen.dart';

import 'my_drawer_controller.dart';

class MyHomePage extends GetView<MyDrawerController> {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF353535),
      body: GetBuilder<MyDrawerController>(
        builder: (_) => ZoomDrawer(
          controller: _.zoomDrawerController,
          menuScreen: const MenuScreen(),
          mainScreen: MainScreen(),
          borderRadius: 24.0,
          showShadow: true,
          angle: -0.0,
          drawerShadowsBackgroundColor: Colors.grey,
          slideWidth: MediaQuery.of(context).size.width * 0.70,
        ),
      ),
    );
  }
}
