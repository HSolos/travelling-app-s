class Country {
  String name;
  String description;
  String image;
  double? price = 10.0;
  Country(
      {required this.name,
      required this.description,
      required this.image,
      this.price});
}

final List countries = [
  Country(
    name: "Gran Muralla, China",
    description:
        "La Gran Muralla China fue incluida entre las Nuevas Siete Maravillas del Mundo Moderno y es Patrimonio de la Humanidad.",
    image: "lib/assets/countries/gran-muralla-china.jpg",
    price: 500.0,
  ),
  Country(
    name: "Gran Palacio de Bangkok, Tailandia",
    description:
        "El monumento arquitectónico más importante de Tailandia fue mandado a construir en los años 1790 por el rey de Siam, Rama I el Grande. Está protegido por un lado por el río Chao Phraya y por el otro por un canal construido con propósitos defensivos, por lo que parece estar en una isla.",
    image: "lib/assets/countries/gran-palacio-de-bangkok-tailandia.jpg",
    price: 800.0,
  ),
  Country(
    name: "Gran Pirámide de Guiza, Egipto",
    description:
        "En la Necrópolis de Guiza, a 14 km al suroeste de El Cairo, hallarás las pirámides Micerinos, Kefrén y Keops, esta última la más atractiva para los turistas pues es la única de las Siete Maravillas del Mundo Antiguo que se mantiene en pie. Además, es la mayor de las pirámides egipcias y fue la construcción más alta del planeta por casi 4 milenios.",
    image: "lib/assets/countries/gran-piramide-de-guiza-egipto.jpg",
    price: 700.0,
  ),
  Country(
    name: "Hollywood Sign, Los Ángeles, EE.UU",
    description:
        "Lo que comenzó en 1923 como un enorme anuncio comercial para promocionar un desarrollo inmobiliario, se convirtió en la principal postal turística de Los Ángeles, California. El empresario inmobiliario, H.J. Whitley, también conocido como el Padre de Hollywood, usó mulas para subir las letras originales de 15 metros de alto y 9 metros de ancho. Desde 1978 miden 13.7 metros de altura",
    image: "lib/assets/countries/hollywood-sign-los-angeles-eeuu.jpg",
    price: 600.0,
  ),
  Country(
    name: "La Alhambra, Granada, España",
    description:
        "El conjunto arquitectónico fue sabiamente insertado en la naturaleza circundante y la decoración de sus interiores es una de las cumbres del arte hispanomusulmán. En las edificaciones hay cerca de 10 mil inscripciones escritas en árabe clásico, la mayoría textos del Corán, versos de poemas de la época y sentencias.",
    image: "lib/assets/countries/la-alhambra-granada-espana.jpg",
    price: 750.0,
  ),
  Country(
    name: "Templo Expiatorio de la Sagrada Familia, Barcelona, España",
    description:
        "El templo consta de 5 naves centrales y 3 fachadas dedicadas al Nacimiento, la Pasión y Muerte y la Resurrección de Jesús. Cuando haya sido terminada tendrá 18 torres, una para cada apóstol, 4 para los evangelistas, una para la Virgen y una para Jesús. Antes de la muerte de Gaudí, atropellado por un tranvía, se habían concluido la fachada dedicada al Nacimiento (parcialmente), el ábside y la cripta.",
    image:
        "lib/assets/countries/templo-expiatorio-de-la-sagrada-familia-barcelona-espana.jpg",
    price: 900.0,
  ),
];
