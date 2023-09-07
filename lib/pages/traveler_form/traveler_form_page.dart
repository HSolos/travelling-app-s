import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:provider/provider.dart';
import 'package:travellingg_viajes/pages/drawer/home_page.dart';
import 'package:travellingg_viajes/providers/account_user_provider.dart';
import 'package:travellingg_viajes/providers/asientos_provider.dart';
import 'package:travellingg_viajes/providers/price._provider.dart';
import 'package:travellingg_viajes/providers/ticket_data_provider.dart';
import '../../widget/app_bar_from_to.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:material_dialogs/material_dialogs.dart';

class TravelerFormPage extends StatefulWidget {
  const TravelerFormPage({super.key});

  @override
  State<TravelerFormPage> createState() => _TravelerFormPageState();
}

class _TravelerFormPageState extends State<TravelerFormPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  GlobalKey<FormState> formk = GlobalKey();
  //String? nAsientos;
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    //
    final de = args["desde"] ?? "";
    final destino = args["destino"] ?? "";
    String fecha = args["date"] ?? "";
    TextEditingController fechaController = TextEditingController(text: fecha);
    final asientos = ["Un asiento", "Dos asientos"];
    final horas = context.watch<TIcketDataProvider>().getHours;
    final precio = context.watch<PriceProvider>().getPrice;
    final precio2 = args["precio"] ?? "";
    final name = context.watch<AccountUserProvider>().getName;
    final lastName = context.watch<AccountUserProvider>().getLastName;
    final email = context.watch<AccountUserProvider>().getEmail;

    String iDia = "8:30";
    String fDia = "10:45";
    // usar keyForm
    /*  String nAsientos =
        _formKey.currentState?.fields["asientos"]!.value ?? asientos[0]; */
    //
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        tooltip: "Regresar",
        child: const Icon(Icons.close),
      ),
      appBar: AppBar(
        toolbarHeight: 160,
        automaticallyImplyLeading: false,
        flexibleSpace: AppBarFromTo(
          args: args,
        ),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Datos de Vuelo",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, left: 25.0, bottom: 20.0, right: 25.0),
                  child: Column(
                    children: [
                      FormBuilder(
                        key: _formKey,
                        child: Column(
                          children: [
                            FormBuilderTextField(
                              name: 'name',
                              initialValue: name,
                              decoration:
                                  const InputDecoration(labelText: 'Nombre'),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                            ),
                            FormBuilderTextField(
                              name: 'lastName',
                              initialValue: lastName,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              decoration:
                                  const InputDecoration(labelText: 'Apellidos'),
                            ),
                            FormBuilderTextField(
                              name: 'email',
                              initialValue: email,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              decoration:
                                  const InputDecoration(labelText: 'Email'),
                            ),
                            FormBuilderTextField(
                              name: 'de',
                              initialValue: de,
                              readOnly: true,
                              decoration:
                                  const InputDecoration(labelText: 'De'),
                            ),
                            FormBuilderTextField(
                              name: 'destino',
                              initialValue: destino,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              decoration:
                                  const InputDecoration(labelText: 'Destino'),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 130,
                                  child: FormBuilderTextField(
                                    name: 'fecha',
                                    readOnly: true,
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                    ]),
                                    controller: fechaController,
                                    onTap: () async {
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                              context: context,
                                              locale: const Locale("es", "ES"),
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2000),
                                              lastDate: DateTime(2040));
                                      if (pickedDate != null) {
                                        String formattedDate =
                                            DateFormat('dd-MM-yyyy')
                                                .format(pickedDate);
                                        debugPrint(formattedDate);
                                        fechaController.text = formattedDate;
                                      } else {
                                        debugPrint(
                                            "Ninguna fecha seleccionada");
                                      }
                                    },
                                    decoration: const InputDecoration(
                                        labelText: 'Fecha'),
                                  ),
                                ),
                                const SizedBox(
                                  width: 40,
                                ),
                                SizedBox(
                                  width: 130,
                                  child: FormBuilderDropdown(
                                    name: 'horasIniFin',
                                    initialValue: horas[0],
                                    decoration: const InputDecoration(
                                        labelText: 'Horas'),
                                    items: horas.map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      List<String> horasSplit =
                                          value!.split("-");

                                      iDia = horasSplit[0];
                                      fDia = horasSplit[1];
                                    },
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: 130,
                                  child: FormBuilderTextField(
                                    name: 'telefono',
                                    keyboardType: TextInputType.phone,
                                    decoration: const InputDecoration(
                                        labelText: 'N° Telefono'),
                                  ),
                                ),
                                const Expanded(
                                  child: SizedBox(
                                    width: 40,
                                  ),
                                ),
                                SizedBox(
                                  width: 140,
                                  child: FormBuilderDropdown(
                                    name: 'asientos',
                                    initialValue: asientos[0],
                                    decoration: const InputDecoration(
                                        labelText: 'N° Asientos'),
                                    items: asientos
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      Provider.of<AsientosProvider>(context,
                                              listen: false)
                                          .setAsientos(value);
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      shadowColor: MaterialStatePropertyAll(
                          Theme.of(context).colorScheme.onPrimary),
                      padding:
                          const MaterialStatePropertyAll(EdgeInsets.all(20)),
                      elevation: const MaterialStatePropertyAll(8),
                      backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).colorScheme.secondary)),
                  onPressed: () {
                    // Validate and save the form values

                    debugPrint(_formKey.currentState?.value.toString());

                    //
                    if (_formKey.currentState?.saveAndValidate() == true) {
                      buttomSaveForm(
                        context,
                        precio2 == "" ? precio : precio2,
                        args,
                        fechaController.text,
                        args["fDia"] == "" ? fDia : args["fDia"],
                        args["hDia"] == "" ? iDia : args["hDia"],
                      );
                    }
                    //
                  },
                  child: const Text('RESERVAR AHORA')),
            ],
          ),
        ),
      ]),
    );
  }

  Future<dynamic> buttomSaveForm(
      BuildContext context, precio, args, fechacon, hfinal, hInicio) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CreditCardWidget(
                cardNumber: "123123132132132",
                expiryDate: "12/25",
                cardHolderName: "USERNAME",
                cvvCode: "123",
                showBackView: false,
                onCreditCardWidgetChange: (a) {},
                isChipVisible: false,
                backgroundImage: "lib/assets/card_bg.png",
                obscureCardCvv: false,
                //
              ),
              CreditCardForm(
                cardNumber: "123123132132132",
                expiryDate: "12/25",
                cardHolderName: "USERNAME",
                cvvCode: "123",
                onCreditCardModelChange: (_) {},
                themeColor: Colors.blue,
                formKey: formk,
                textColor: Colors.white,
                cardNumberDecoration: const InputDecoration(
                  labelText: 'Number',
                  hintText: 'XXXX XXXX XXXX XXXX',
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                ),
                expiryDateDecoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  labelText: 'Expired Date',
                  hintText: 'XX/XX',
                ),
                cvvCodeDecoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  labelText: 'CVV',
                  hintText: 'XXX',
                ),
                cardHolderDecoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  labelText: 'Card Holder',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(EdgeInsets.all(12)),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Cerrar",
                          style: TextStyle(fontSize: 15),
                        )),
                    ElevatedButton(
                        style: ButtonStyle(
                            padding: const MaterialStatePropertyAll(
                                EdgeInsets.all(12)),
                            backgroundColor: MaterialStatePropertyAll(
                                Theme.of(context).colorScheme.surface)),
                        onPressed: () {
                          Dialogs.materialDialog(
                              color: const Color.fromARGB(255, 246, 253, 255),
                              context: context,
                              customView: const Image(
                                  image: AssetImage("lib/assets/avion.gif")),
                              msg: 'Felicidades por su compra',
                              msgStyle: const TextStyle(color: Colors.black),
                              titleStyle: const TextStyle(color: Colors.black),
                              actions: [
                                IconsButton(
                                  onPressed: () {
                                    Provider.of<TIcketDataProvider>(context,
                                            listen: false)
                                        .setPrice(precio);
                                    Provider.of<TIcketDataProvider>(context,
                                            listen: false)
                                        .setDestino(args["destino"]);
                                    Provider.of<TIcketDataProvider>(context,
                                            listen: false)
                                        .setFecha(fechacon);
                                    //
                                    Provider.of<TIcketDataProvider>(context,
                                            listen: false)
                                        .setHInicio(hInicio);
                                    Provider.of<TIcketDataProvider>(context,
                                            listen: false)
                                        .setHFinal(hfinal);
                                    //HORAS

                                    //
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                const MyHomePage()),
                                        (route) => false);
                                    //
                                  },
                                  text: 'Aceptar',
                                  iconData: Icons.done,
                                  color: Colors.blue,
                                  textStyle:
                                      const TextStyle(color: Colors.white),
                                  iconColor: Colors.white,
                                ),
                              ]).then((_) => Navigator.pop(context));
                        },
                        child: Row(
                          children: [
                            const Text("Pagar", style: TextStyle(fontSize: 15)),
                            const SizedBox(
                              width: 20,
                            ),
                            Text("S/.$precio",
                                style: const TextStyle(fontSize: 15)),
                          ],
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    iconSize: 40,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_down_outlined,
                    )),
              ),
            ],
          );
        });
  }
}
