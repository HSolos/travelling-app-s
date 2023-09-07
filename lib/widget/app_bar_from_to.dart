import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travellingg_viajes/providers/asientos_provider.dart';

class AppBarFromTo extends StatelessWidget {
  const AppBarFromTo({
    super.key,
    required this.args,
  });

  final Map args;

  @override
  Widget build(BuildContext context) {
    final destino = args["destino"];
    List pais = [];
    var paisDestino = "";
    if (destino != null) {
      final destinoSplit = destino.split(",");
      pais = destinoSplit[destinoSplit.length - 1].toUpperCase().split(" ");
      paisDestino = pais[pais.length - 1];
    }
    final providerAsientos = context.watch<AsientosProvider>().getAsientos;

    //
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    args["desde"] ?? "",
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
                const Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    children: [
                      Icon(Icons.radio_button_checked),
                      Text("- - - - - - - - - - - - - - -"),
                      Icon(Icons.location_on),
                    ],
                  ),
                ),
                Expanded(
                  child: Text(
                    paisDestino,
                    style: const TextStyle(fontSize: 25),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                DateTime.now().toString(),
              ),
            ),
            const Divider(
              thickness: 3,
            ),
            Text(providerAsientos),
          ],
        ),
      ),
    );
  }
}
