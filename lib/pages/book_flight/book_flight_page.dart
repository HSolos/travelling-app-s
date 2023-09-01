import 'package:flutter/material.dart';
import 'package:travellingg_viajes/pages/nav_drawer.dart';

class BookFlightPage extends StatefulWidget {
  const BookFlightPage({super.key});

  @override
  State<BookFlightPage> createState() => _BookFlightPageState();
}

class _BookFlightPageState extends State<BookFlightPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookFlightPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BookFlightPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
