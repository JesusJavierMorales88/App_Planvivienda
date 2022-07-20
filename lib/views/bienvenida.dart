// ignore: file_names
// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";

class PageStateFullWidget extends StatefulWidget {
  final String texto;
  // ignore: prefer_const_constructors_in_immutables
  PageStateFullWidget(this.texto, {Key? key}) : super(key: key);

  @override
  State<PageStateFullWidget> createState() => _PageStateFullWidgetState();
}

class _PageStateFullWidgetState extends State<PageStateFullWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Bienveni@",
                style: TextStyle(
                  color: Colors.lightGreen,
                  fontSize: 35,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.texto,
                style: TextStyle(
                    color: Colors.lightGreen,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "A la plataforma en la que podrás gestionar tu",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "vivienda y el crédito hipotecario",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "para adquirirla fácilmente",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 46,
              ),
              Row(
                children: [
                  Expanded(
                    child: Image.network(
                        "https://planvivienda.com.mx/02/SISPLAN/POO/WEBSERVICE/img/logs_nueva_app/Mesa de trabajo 13Logos.png"),
                  ),
                  Expanded(
                    child: Image.network(
                        "https://planvivienda.com.mx/02/SISPLAN/POO/WEBSERVICE/img/logs_nueva_app/Mesa de trabajo 13 copiaLogos.png"),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PageStateFullWidget(""),
                    ),
                  );
                },
                icon: Icon(Icons.arrow_forward),
                label: Text("Continuar"),
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                "Alianza con:",
                style: TextStyle(fontSize: 16),
              ),
              Image.network(
                  "https://planvivienda.com.mx/02/SISPLAN/POO/WEBSERVICE/img/logs_nueva_app/Mesa_de_trabajo_15Logos.png")
            ],
          ),
        ),
      ),
    );
  }
}
