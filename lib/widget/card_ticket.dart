import 'package:flutter/material.dart';

class CardTicket extends StatefulWidget {
  const CardTicket(
      {super.key,
      required this.hInicio,
      required this.hFinal,
      required this.price,
      required this.fecha,
      this.destino});
  final String hInicio;
  final String hFinal;
  final String price;
  final String? destino;
  final String? fecha;

  @override
  State<CardTicket> createState() => _CardTravelerFlightState();
}

class _CardTravelerFlightState extends State<CardTicket> {
  @override
  Widget build(BuildContext context) {
    //
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.only(bottom: 30),
      shadowColor: Colors.white,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 25.0, left: 10, right: 10, bottom: 0),
            child: Row(
              children: [
                const Text(
                  "PERU -> ",
                  style: TextStyle(fontSize: 25),
                ),
                Flexible(
                  child: Text(
                    widget.destino ?? "",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 25.0, left: 10, right: 10, bottom: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.hInicio} - - - - -",
                  style: const TextStyle(fontSize: 25),
                ),
                const Icon(
                  Icons.airplane_ticket,
                  size: 35,
                ),
                Text("- - - - - ${widget.hFinal}",
                    style: const TextStyle(fontSize: 25)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 0.0, left: 10, right: 10, bottom: 10),
            child: Row(
              children: [Text('Fecha:  ${widget.fecha ?? ""}')],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            width: 360,
            color: Theme.of(context).colorScheme.secondary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 3.0, right: 5.0),
                      child: Icon(Icons.work),
                    ),
                    Text(
                      "57Kg",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 3.0),
                  child: Text(
                    "S/.${widget.price}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
