import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:travellingg_viajes/models/country.dart';

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
        title: const Text('Sobre Nosotros'),
        centerTitle: true,
      ),
      body: ListView(children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Travelling-Viajes',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("lib/assets/logo.png"),
                    )
                  ],
                ),
              ),
              const Text(
                  "En Travelling-Viajes, creemos en el poder de las experiencias de viaje transformadoras. Somos más que una empresa de viajes; somos facilitadores de aventuras, descubrimientos y conexiones. Desde nuestro comienzo, nos hemos comprometido a ofrecer a nuestros clientes experiencias inolvidables que van más allá de lo convencional."),
              CarouselSlider.builder(
                options:
                    CarouselOptions(height: 250.0, enlargeCenterPage: true),
                itemCount: countries.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Image(
                      image: AssetImage("${countries[index].image}"),
                    ),
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: [
                    Text(
                      "Nuestra Misión",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                  "Nuestra misión es abrir el mundo para todos. Creemos que cada persona merece la oportunidad de explorar destinos fascinantes, sumergirse en culturas diversas y crear recuerdos que perduren toda la vida. Nos esforzamos por hacer que el mundo sea accesible y emocionante, sin importar quién seas o a dónde quieras ir."),
              const Text(
                  "Gracias por elegir Travelling-Viajes como tu compañero de viaje. Esperamos inspirarte a explorar, descubrir y vivir la emoción de viajar. ¡Bienvenido a un mundo de posibilidades infinitas!"),
              //
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Image.asset("lib/assets/avion.gif"),
              ),
              //
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: [
                    Text(
                      " Contáctanos",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                  "Si tienes alguna pregunta o deseas comenzar a planificar tu próximo viaje, no dudes en ponerte en contacto con nuestro equipo amable y dedicado. Estamos aquí para ayudarte a hacer realidad tus sueños de viaje.")
            ]),
          ),
        ),
      ]),
    );
  }
}
