import 'package:flutter/material.dart';

class contacto extends StatelessWidget {
  const contacto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const SizedBox(
          height: 30,
        ),
        const Text(
          "CONTACTO",
          style: TextStyle(
              color: Colors.lightGreen,
              fontSize: 25,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          "Nuestra misión es gestionar",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "VIVIENDAS Y FINANCIAMIENTOS",
          style: TextStyle(
              color: Colors.lightGreen,
              fontSize: 23,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "de calidad para las FAMILIAS mexicanas",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 50,
        ),
        const Text(
          "Encuentranos en:",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ListTile(
          title: const Text(
            "consultas@planvivienda.com.mx",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: const Icon(
            Icons.email,
            color: Colors.black,
          ),
          onTap: () {},
        ),
        ListTile(
          title: const Text(
            "planvivienda.com.mx",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: const Icon(
            Icons.language,
            color: Colors.black,
          ),
          onTap: () {},
        ),
        ListTile(
          title: const Text(
            "(744) 481 1535",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: const Icon(
            Icons.phone,
            color: Colors.black,
          ),
          onTap: () {},
        ),
        ListTile(
          title: const Text(
            "Acapulco",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: const Icon(
            Icons.place,
            color: Colors.black,
          ),
          onTap: () {},
        ),
        ListTile(
          title: const Text(
            "Chilpancingo",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: const Icon(
            Icons.place,
            color: Colors.black,
          ),
          onTap: () {},
        ),
      ],
    ));
  }
}
