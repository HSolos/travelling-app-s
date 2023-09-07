import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travellingg_viajes/models/country.dart';
import 'package:travellingg_viajes/pages/drawer/my_drawer_controller.dart';
import 'package:travellingg_viajes/providers/price._provider.dart';
import 'package:travellingg_viajes/widget/countries_card_widget.dart';
import 'package:travellingg_viajes/widget/where_to_card_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  TextEditingController destinoController = TextEditingController(text: "");
  TextEditingController desdeController = TextEditingController(text: "Peru");
  TextEditingController fechaController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    //   TextEditingController searchController = TextEditingController();
    String precio = context.watch<PriceProvider>().getPrice;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SafeArea(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      MyDrawerController().toggleDrawer(context);
                    },
                    icon: const Icon(
                      Icons.menu,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10, top: 5),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text(
                        "¿A Donde?",
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WhereToWidget(
                        destinoController: destinoController,
                        desdeController: desdeController,
                        fechaController: fechaController,
                        precio: precio,
                      ),
                    ],
                  ),
                  const Divider(),
                ],
              ),
            ),
            //  CountriesCardWidget(),
            //
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(right: 10, left: 10),
                itemCount: countries.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      destinoController.text = countries[index].name;
                      Provider.of<PriceProvider>(context, listen: false)
                          .setPrice(countries[index].price.toString());
                    },
                    child: CountriesCardWidget(
                      image: countries[index].image,
                      title: countries[index].name,
                      description: countries[index].description,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
