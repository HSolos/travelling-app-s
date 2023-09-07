import 'package:flutter/material.dart';

import 'package:travellingg_viajes/pages/traveler_form/traveler_form_page.dart';

import 'package:travellingg_viajes/widget/app_bar_from_to.dart';
import 'package:travellingg_viajes/widget/card_traveler_flight.dart';

class TravelerFlightPage extends StatefulWidget {
  const TravelerFlightPage({super.key});

  @override
  State<TravelerFlightPage> createState() => _TravelerFlightPageState();
}

class _TravelerFlightPageState extends State<TravelerFlightPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final desde = args["desde"];
    final precio = args["precio"];
    final destino = args["destino"];

    String hDia = "08:30";
    String fDia = "10:45";
/*     String hTarde = "10:30";
    String fTarde = "13:45";
    String hMTarde = "13:30";
    String fMTarde = "16:45"; */

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 160,
          automaticallyImplyLeading: false,
          flexibleSpace: AppBarFromTo(
            args: args,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: const Icon(
            Icons.keyboard_arrow_left_outlined,
            color: Colors.white,
            size: 40,
            semanticLabel: "Regresar",
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      InkWell(
                        child: CardTravelerFlight(
                          hInicio: hDia,
                          hFinal: fDia,
                          price: precio.toString(),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const TravelerFormPage(),
                                  settings: RouteSettings(arguments: {
                                    "desde": desde,
                                    "destino": destino,
                                    "precio": precio,
                                    //?
                                    "hDia": "08:30",
                                    "fDia": "10:45",
                                  })));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
