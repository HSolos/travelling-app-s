import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:travellingg_viajes/pages/about_page/about_page.dart';
import 'package:travellingg_viajes/pages/book_flight/book_flight_page.dart';
import 'package:travellingg_viajes/pages/drawer/home_page.dart';
import 'package:travellingg_viajes/pages/drawer/my_drawer_controller.dart';
import 'package:travellingg_viajes/pages/login/login_page.dart';
import 'package:travellingg_viajes/pages/settings/settings_page.dart';
import 'package:travellingg_viajes/pages/showflighttickets/showflighttickets_page.dart';
import 'package:travellingg_viajes/providers/account_user_provider.dart';

class MenuScreen extends GetView<MyDrawerController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//String accountName = context.watch<AccountUserProvider>().getAccountName(name, lastName);
    String accountName = context.watch<AccountUserProvider>().getAccountName();
    String email = context.watch<AccountUserProvider>().getEmail;

    return Column(
      children: [
        UserAccountsDrawerHeader(
          accountName: Text(accountName.toUpperCase()),
          accountEmail: Text(email),
          currentAccountPicture: const CircleAvatar(
            backgroundImage: AssetImage("lib/assets/user.jpg"),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Inicio'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const MyHomePage()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.airplanemode_active),
          title: const Text('Reservar Vuelo'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const BookFlightPage()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.airplane_ticket_sharp),
          title: const Text('Mis vuelos'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const ShowflightticketsPage()));
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
          leading: const Icon(Icons.account_box),
          title: const Text('Mi Datos'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const SettingsPage()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Desvincular Cuenta'),
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const LoginPage()),
                (route) => false);
          },
        ),
      ],
    );
  }
}
