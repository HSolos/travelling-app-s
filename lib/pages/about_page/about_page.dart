import 'package:flutter/material.dart';
import 'package:travellingg_viajes/pages/nav_drawer.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPage();
}

class _AboutPage extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AboutPage'),
        centerTitle: true, /*  */
      ),
      body: Center(
        child: Column(children: [
          Text(
            'Travelling-Viajes',
            style: TextStyle(fontSize: 20),
          ),
          Text(
              "En Travelling-Viajes, creemos en el poder de las experiencias de viaje transformadoras. Somos más que una empresa de viajes; somos facilitadores de aventuras, descubrimientos y conexiones. Desde nuestro comienzo, nos hemos comprometido a ofrecer a nuestros clientes experiencias inolvidables que van más allá de lo convencional."),
          Text("Nuestra Misión"),
          Text(
              "Nuestra misión es abrir el mundo para todos. Creemos que cada persona merece la oportunidad de explorar destinos fascinantes, sumergirse en culturas diversas y crear recuerdos que perduren toda la vida. Nos esforzamos por hacer que el mundo sea accesible y emocionante, sin importar quién seas o a dónde quieras ir."),
          Text(
              "Gracias por elegir Travelling-Viajes como tu compañero de viaje. Esperamos inspirarte a explorar, descubrir y vivir la emoción de viajar. ¡Bienvenido a un mundo de posibilidades infinitas!"),
          Text(" Contáctanos"),
          Text(
              "Si tienes alguna pregunta o deseas comenzar a planificar tu próximo viaje, no dudes en ponerte en contacto con nuestro equipo amable y dedicado. Estamos aquí para ayudarte a hacer realidad tus sueños de viaje.")
        ]),
      ),
    );
  }
}
