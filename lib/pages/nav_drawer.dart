/* import 'package:flutter/material.dart';
import 'package:travellingg_viajes/pages/about_page/about_page.dart';
import 'package:travellingg_viajes/pages/book_flight/book_flight_page.dart';
import 'package:travellingg_viajes/pages/home_page.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});
  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  int _selectedIndex = 0;

  List pages = const [HomePage(), BookFlightPage(), AboutPage()];
//  void _onItemTapped(int index) {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

//
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("Drawer")),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            selected: _selectedIndex == 0,
            onTap: () {
              _onItemTapped(0);
              Navigator.pop(context);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const HomePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.airplane_ticket),
            title: const Text('Reservar Vuelo'),
            selected: _selectedIndex == 1,
            onTap: () {
              _onItemTapped(1);
              Navigator.pop(context);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const BookFlightPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.ac_unit),
            title: const Text('Sobre Nosostros'),
            selected: _selectedIndex == 2,
            onTap: () {
              _onItemTapped(2);
              Navigator.pop(context);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const AboutPage()));
            },
          ),
        ],
      ),
    );
  }
}
 */