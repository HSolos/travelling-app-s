import 'package:flutter/material.dart';
import 'package:travellingg_viajes/models/country.dart';
import 'package:travellingg_viajes/pages/traveler_flight/traveler_flight_page.dart';
import 'package:travellingg_viajes/widget/card_book_flght/card_book_flght.dart';

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
        centerTitle: true,
        title: const Text(
          '----------VIAJES----------',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: countries.length,
              itemBuilder: (BuildContext context, int index) {
                final price = countries[index].price.toString();
                final image = countries[index].image;
                final name = countries[index].name;

                return InkWell(
                    child: CardBookFlght(
                      image: image,
                      price: price,
                      name: name,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TravelerFlightPage(),
                              settings: RouteSettings(arguments: {
                                "desde": "PERU",
                                "destino": name,
                                "precio": price
                              })));
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
