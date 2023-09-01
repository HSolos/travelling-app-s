import 'package:flutter/material.dart';

class CountriesCardWidget extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const CountriesCardWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.description});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      shadowColor: Colors.white,
      elevation: 6,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(children: [
        Image.asset(image, height: 130, width: 400, fit: BoxFit.cover),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: SizedBox(
                width: 330,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Color(0xFF03DAC6),
                            fontWeight: FontWeight.bold)),
                    Text(
                      description,
                      // ignore: prefer_const_constructors
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                )),
          ),
        )
      ]),
    );
  }
}
