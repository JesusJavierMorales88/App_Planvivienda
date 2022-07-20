// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:plan_vivienda_rutas/operacionLogin.dart';

class ReporteDeFallas extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final referencia;
  const ReporteDeFallas(this.referencia, {Key? key}) : super(key: key);

  @override
  State<ReporteDeFallas> createState() => _ReporteDeFallasState();
}

enum fallas { Visual, Funcional, Sugerencia, Otro }

class _ReporteDeFallasState extends State<ReporteDeFallas> {
  TextEditingController textControlleDescripcion = TextEditingController();
  fallas _value = fallas.Visual;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const SizedBox(
              height: 30,
            ),
            // ignore: prefer_const_constructors
            Text(
              "Reporte de fallas App",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: textControlleDescripcion,

                  maxLines: 5, //or null
                  decoration: const InputDecoration.collapsed(
                      hintText: "Descripción de la falla."),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // ignore: prefer_const_constructors
            Text(
              "Seleccione el tipo de reporte",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),

            ListTile(
              title: const Text("Visual"),
              leading: Radio<fallas>(
                  value: fallas.Visual,
                  groupValue: _value,
                  onChanged: (fallas? value) {
                    setState(() {
                      setState(() {
                        _value = value!;
                      });
                    });
                  }),
            ),
            ListTile(
              title: const Text("Funcional"),
              leading: Radio<fallas>(
                  value: fallas.Funcional,
                  groupValue: _value,
                  onChanged: (fallas? value) {
                    setState(() {
                      setState(() {
                        _value = value!;
                      });
                    });
                  }),
            ),
            ListTile(
              title: const Text("Sugerencia de mejora"),
              leading: Radio<fallas>(
                  value: fallas.Sugerencia,
                  groupValue: _value,
                  onChanged: (fallas? value) {
                    setState(() {
                      setState(() {
                        _value = value!;
                      });
                    });
                  }),
            ),
            ListTile(
              title: const Text("Otro"),
              leading: Radio(
                  value: fallas.Otro,
                  groupValue: _value,
                  onChanged: (fallas? value) {
                    setState(() {
                      setState(() {
                        _value = value!;
                      });
                    });
                  }),
            ),
            const SizedBox(
              height: 20,
            ),

            ElevatedButton(
              onPressed: () {
                reporteDeFallasBD(widget.referencia, _value,
                    textControlleDescripcion.text, context);
                textControlleDescripcion.clear();
                setState(() {
                  setState(() {
                    _value = fallas.Visual;
                  });
                });
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 50), primary: Colors.lightGreen),
              child: const Text(
                "ENVIAR REPORTE",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ],
    ));
  }
}
