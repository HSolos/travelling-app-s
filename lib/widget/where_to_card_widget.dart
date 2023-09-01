import 'package:flutter/material.dart';
import 'package:travellingg_viajes/pages/book_flight/book_flight_page.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class WhereToWidget extends StatefulWidget {
  TextEditingController destinoController;
  TextEditingController desdeController;
  TextEditingController fechaController;

  WhereToWidget(
      {super.key,
      required this.destinoController,
      required this.desdeController,
      required this.fechaController});

  @override
  State<WhereToWidget> createState() => _WhereToWidgetState();
}

class _WhereToWidgetState extends State<WhereToWidget> {
  @override
  Widget build(
    BuildContext context,
  ) {
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      constraints: BoxConstraints(maxHeight: 55),
                      icon: Icon(Icons.radio_button_checked),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      labelText: 'De ...',
                    ),
                    style: const TextStyle(),
                    controller: widget.desdeController,
                  ),
                  TextField(
                    controller: widget.destinoController,
                    decoration: const InputDecoration(
                      constraints: BoxConstraints(maxHeight: 60),
                      icon: Icon(Icons.location_on),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      labelText: 'Destino ...',
                    ),
                  ),
                  TextField(
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(
                                2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));
                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16

                          widget.fechaController.text = formattedDate;
                        }
                      },
                      decoration: const InputDecoration(
                        constraints: BoxConstraints(maxHeight: 55),
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
              //Navigator.push(context,MaterialPageRoute(builder: (context) => BookFlightPage()));
              print(widget.fechaController.text);
            },
          ),
        )
      ],
    );
  }
}
