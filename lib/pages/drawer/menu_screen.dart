import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travellingg_viajes/pages/about_page/about_page.dart';
import 'package:travellingg_viajes/pages/book_flight/book_flight_page.dart';
import 'package:travellingg_viajes/pages/drawer/my_drawer_controller.dart';

class MenuScreen extends GetView<MyDrawerController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UserAccountsDrawerHeader(
          accountName: Text("Nombre de usuario"),
          accountEmail: Text("Email de usuario"),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage("lib/assets/user.jpg"),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.airplane_ticket),
          title: const Text('Reservar Vuelo'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const BookFlightPage()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.ac_unit),
          title: const Text('Sobre Nosostros'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const AboutPage()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.airplane_ticket),
          title: const Text('Desvincular Cuenta'),
          onTap: () {},
        ),
      ],
    );
  }
}
