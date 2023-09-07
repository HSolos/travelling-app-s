import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travellingg_viajes/pages/traveler_form/traveler_form_page.dart';

// ignore: must_be_immutable
class WhereToWidget extends StatefulWidget {
  TextEditingController destinoController;
  TextEditingController desdeController;
  TextEditingController fechaController;
  String precio;

  WhereToWidget(
      {super.key,
      required this.destinoController,
      required this.desdeController,
      required this.fechaController,
      required this.precio});

  @override
  State<WhereToWidget> createState() => _WhereToWidgetState();
}

class _WhereToWidgetState extends State<WhereToWidget> {
  bool validate = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 10,
          margin: const EdgeInsets.only(top: 20, bottom: 10),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: 340,
              height: 210,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextField(
                    readOnly: true,
                    decoration: const InputDecoration(
                      enabled: true,
                      constraints: BoxConstraints(maxHeight: 45),
                      icon: Icon(Icons.radio_button_checked),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                    ),
                    controller: widget.desdeController,
                  ),
                  TextField(
                    // ignore: prefer_const_constructors
                    key: Key("destino"),
                    controller: widget.destinoController,
                    decoration: InputDecoration(
                      constraints: const BoxConstraints(maxHeight: 84),
                      errorText: validate ? "Seleccione un destino" : null,
                      helperText: "Toca en un pais de destino",
                      icon: const Icon(Icons.location_on),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      labelText: 'Destino ...',
                    ),
                  ),
                  TextField(
                      readOnly: true,
                      onTap: () async {
                        await getDate(context);
                      },
                      decoration: const InputDecoration(
                        constraints: BoxConstraints(maxHeight: 45),
                        icon: Icon(Icons.date_range),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        labelText: 'Fecha',
                      ),
                      controller: widget.fechaController),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: FloatingActionButton(
            child: const Icon(Icons.airplanemode_active),
            onPressed: () {
              if (widget.destinoController.text != "") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TravelerFormPage(),
                        settings: RouteSettings(arguments: {
                          "desde": widget.desdeController.text,
                          "date": widget.fechaController.text,
                          "destino": widget.destinoController.text,
                          "precio": widget.precio,
                          "hDia": "",
                          "fDia": "",
                        })));
              } else {
                setState(() {
                  validate = true;
                });
              }
              return;
            },
          ),
        )
      ],
    );
  }

  Future<void> getDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        locale: const Locale("es", "ES"),
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040));
    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      debugPrint(formattedDate);
      widget.fechaController.text = formattedDate;
    } else {
      debugPrint("Ninguna fecha seleccionada");
    }
  }
}
