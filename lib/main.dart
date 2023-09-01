import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travellingg_viajes/pages/drawer/my_drawer_controller.dart';
import 'package:travellingg_viajes/pages/drawer/home_page.dart';

void main() {
  Get.put<MyDrawerController>(MyDrawerController());

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoom Drawer Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.dark,
          colorScheme: const ColorScheme(
              brightness: Brightness.dark,
              primary: Color(0xFABB86FC),
              onPrimary: Color(0xFFFFFFFF),
              secondary: Color(0xFF03DAC6),
              onSecondary: Color(0xFF000000),
              error: Color(0xFFCF6679),
              onError: Color(0xFF000000),
              background: Color(0xFF121212),
              onBackground: Color(0xFFFFFFFF),
              surface: Color(0xFF018786),
              onSurface: Color(0xFFFFFFFF))
          //
          ),
      themeMode: ThemeMode.dark,
      home: const MyHomePage(),
    );
  }
}
