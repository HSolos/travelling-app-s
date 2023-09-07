import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travellingg_viajes/providers/ticket_data_provider.dart';
import 'package:travellingg_viajes/widget/card_ticket.dart';

class ShowflightticketsPage extends StatefulWidget {
  const ShowflightticketsPage({super.key});

  @override
  State<ShowflightticketsPage> createState() => _ShowflightticketsPageState();
}

class _ShowflightticketsPageState extends State<ShowflightticketsPage> {
  @override
  Widget build(BuildContext context) {
    String hInicio = context.watch<TIcketDataProvider>().getHInicio;
    String hFinal = context.watch<TIcketDataProvider>().getHFinal;
    String precio = context.watch<TIcketDataProvider>().getPrice;
    String destino = context.watch<TIcketDataProvider>().getDestino;
    String fecha = context.watch<TIcketDataProvider>().getFecha;

    //Provider.of<AccountUserProvider>(context, listen: false).setEmail(email);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mis vuelos'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: ListView(
            children: [
              CardTicket(
                hInicio: hInicio,
                hFinal: hFinal,
                price: precio.toString(),
                destino: destino,
                fecha: fecha,
              ),
            ],
          ),
        ));
  }
}
