import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MyDrawerController {
  @override
  // ignore: override_on_non_overriding_member
  final zoomDrawerController = ZoomDrawerController();
  //
  void toggleDrawer(context) {
    if (ZoomDrawer.of(context)!.isOpen()) {
      print("Toggle drawer ");

      ZoomDrawer.of(context)!.close();
    } else {
      print("Toggle drawer cerrar");

      ZoomDrawer.of(context)!.open();
    }
    //zoomDrawerController.toggle?.call();
  }
}
