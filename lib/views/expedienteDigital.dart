// ignore: file_names
// ignore: file_names
import 'package:flutter/material.dart';

import 'package:plan_vivienda_rutas/views/viewPDF.dart';

import '../datos.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async';

class ExpedienteDigital extends StatefulWidget {
  final String nombre;
  final String referencia;
  final String celular;
  final String correo;
  final String estatus;
  final double avanceAhorro;
  ExpedienteDigital(this.referencia, this.nombre, this.celular, this.correo,
      this.estatus, this.avanceAhorro,
      {Key? key})
      : super(key: key);

  @override
  State<ExpedienteDigital> createState() => _ExpedienteDigitalState();
}

class _ExpedienteDigitalState extends State<ExpedienteDigital> {
  List<DatosExpediente> dataDatosExpediente = <DatosExpediente>[];

  var registrosDatosExpediente = <DatosExpediente>[];

  Future<List<DatosExpediente>> tomarDatosDatosExpediente() async {
    var url = Uri.parse(
      "https://planvivienda.com.mx/SISPLAN/login/webServices/expedienteAfiliacion.php",
    );
    var response = await http.post(
      url,
      body: {"usuario": widget.referencia},
    );
    var datos = jsonDecode(response.body);

    for (var datos in datos["data"]) {
      registrosDatosExpediente.add(DatosExpediente.fromJson(datos));
    }
    // print(datos);

    return registrosDatosExpediente;
  }

/* DATOS DE VINCULACIÓN */
  List<DatosExpediente> dataDatosExpedienteVinculacion = <DatosExpediente>[];

  var registrosDatosExpedienteVinculacion = <DatosExpediente>[];

  Future<List<DatosExpediente>> tomarDatosDatosExpedienteVinculacion() async {
    var url = Uri.parse(
      "https://planvivienda.com.mx/SISPLAN/login/webServices/expedienteVinculacion.php",
    );
    var response = await http.post(
      url,
      body: {"usuario": widget.referencia},
    );
    var datos = jsonDecode(response.body);

    for (var datos in datos["data"]) {
      registrosDatosExpedienteVinculacion.add(DatosExpediente.fromJson(datos));
    }
    // print(datos);

    return registrosDatosExpedienteVinculacion;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tomarDatosDatosExpediente().then((value) {
      setState(() {
        dataDatosExpediente.addAll(value);
      });
    });
    tomarDatosDatosExpedienteVinculacion().then((value) {
      setState(() {
        dataDatosExpedienteVinculacion.addAll(value);
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(height: 40,),
          Row(
            children: [
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(
                    Icons.description,
                    color: Colors.lightGreen,
                    size: 100,
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "EXPEDIENTE DIGITAL",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.lightGreen,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Desde aquí administramos tu",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "EXPEDIENTE para generar el",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "CRÉDITO HIPOTECARIO que te",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "permitirá adquirir tu vivienda.",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            widget.nombre,
            style: const TextStyle(
                fontSize: 22,
                color: Colors.lightGreen,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Row(children: [
                const SizedBox(
                  width: 100,
                  height: 50,
                  child: Card(
                    color: Color.fromARGB(255, 142, 207, 67),
                    child: Center(
                      child: Text(
                        "Referencia",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Wrap(
                  children: [Text(widget.referencia)],
                )
              ]),
            ],
          ),
          Column(
            children: [
              Row(children: [
                const SizedBox(
                  width: 100,
                  height: 50,
                  child: Card(
                    color: Color.fromARGB(255, 142, 207, 67),
                    child: Center(
                      child: Text(
                        "Celular",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Wrap(
                  children: [Text(widget.celular)],
                )
              ]),
            ],
          ),
          Column(
            children: [
              Row(children: [
                const SizedBox(
                  width: 100,
                  height: 50,
                  child: Card(
                    color: Color.fromARGB(255, 142, 207, 67),
                    child: Center(
                      child: Text(
                        "Email",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Wrap(
                  children: [Text(widget.correo)],
                )
              ]),
            ],
          ),
          mostrarExpeduiente(),
        ],
      ),
    );
  }

  mostrarExpeduiente() {
    return DefaultTabController(
      length: 2,
      child: Column(children: [
        const SizedBox(
          height: 20,
        ),
        TabBar(
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50), // Creates border
                color: Colors.blue),
            unselectedLabelColor: Colors.blue,
            labelColor: Colors.white,
            tabs: const [
              Tab(
                text: "AFILIACIÓN",
              ),
              Tab(
                text: "VINCULACIÓN",
              ),
            ]),
        Container(
          constraints: const BoxConstraints(
            maxHeight: 1200,
          ),
          child: TabBarView(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Estatus",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  Icon(
                    tipoExpedienteAfiliacion()[0],
                    color: tipoExpedienteAfiliacion()[2] == 'COMPLETO'
                        ? Colors.green
                        : Colors.red[800],
                    size: 100,
                  ),
                  Text(
                      "EXPEDIENTE DE ${tipoExpedienteAfiliacion()[3]}  ${tipoExpedienteVinculacion()[2]}",
                      style: TextStyle(
                        color: tipoExpedienteAfiliacion()[2] == 'COMPLETO'
                            ? Colors.green
                            : Colors.red[800],
                      )),
                  DataTable(
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text(
                          'Vigencia',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Documento',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Existe',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                      dataDatosExpediente.length,
                      (int index) => DataRow(
                        cells: <DataCell>[
                          DataCell(Text(dataDatosExpediente[index].vigencia)),
                          DataCell(
                            Text(
                              dataDatosExpediente[index].documento,
                              style: TextStyle(fontSize: 11),
                            ),
                          ),
                          DataCell(
                            Container(
                              child: dataDatosExpediente[index].existe == 'SI'
                                  ? IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ViewPDF(
                                                    widget.nombre,
                                                    widget.referencia,
                                                    widget.celular,
                                                    widget.correo,
                                                    widget.estatus,
                                                    dataDatosExpediente[index]
                                                        .ruta,
                                                    widget.avanceAhorro,
                                                  )),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.picture_as_pdf_sharp,
                                        color: Colors.red,
                                      ),
                                    )
                                  : const IconButton(
                                      onPressed: (null),
                                      icon: Icon(
                                        Icons.close,
                                      ),
                                    ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Estatus",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  Icon(
                    tipoExpedienteVinculacion()[0],
                    color: tipoExpedienteVinculacion()[2] == 'COMPLETO'
                        ? Colors.green
                        : Colors.red[800],
                    size: 100,
                  ),
                  Text(
                      "EXPEDIENTE DE ${tipoExpedienteVinculacion()[3]} ${tipoExpedienteVinculacion()[2]}",
                      style: TextStyle(
                        color: tipoExpedienteVinculacion()[2] == 'COMPLETO'
                            ? Colors.green
                            : Colors.red[800],
                      )),
                  DataTable(
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text(
                          'Vigencia',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Documento',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Existe',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                      dataDatosExpedienteVinculacion.length,
                      (int index) => DataRow(
                        cells: <DataCell>[
                          DataCell(Text(
                              dataDatosExpedienteVinculacion[index].vigencia)),
                          DataCell(
                            Text(dataDatosExpedienteVinculacion[index]
                                .documento),
                          ),
                          DataCell(
                            Container(
                              child: dataDatosExpedienteVinculacion[index]
                                          .existe ==
                                      'SI'
                                  ? IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ViewPDF(
                                                    widget.nombre,
                                                    widget.referencia,
                                                    widget.celular,
                                                    widget.correo,
                                                    widget.estatus,
                                                    dataDatosExpedienteVinculacion[
                                                            index]
                                                        .ruta,
                                                    widget.avanceAhorro,
                                                  )),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.picture_as_pdf_sharp,
                                        color: Colors.red,
                                      ))
                                  : const IconButton(
                                      onPressed: (null),
                                      icon: Icon(
                                        Icons.close,
                                      ),
                                    ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }

  tipoExpedienteVinculacion() {
    var estatus;
    var tipo;
    var icon;
    var color;
    int numero = 0;
    var numeroDocument;
    if (dataDatosExpedienteVinculacion.isEmpty) {
      estatus = '';
    } else {
      for (var element in dataDatosExpedienteVinculacion) {
        tipo = element.tipoExpediente;
        numeroDocument = element.numeroDocumentos;
        if (element.existe == 'SI') {
          numero++;
        }
      }
    }

    if (numeroDocument == numero) {
      estatus = 'COMPLETO';
      icon = Icons.check_circle;
      color = Colors.green;
    } else {
      estatus = 'INCOMPLETO';
      icon = Icons.error;
      color = Colors.red[800];
    }

    List datosExpediente = [icon, color, estatus, tipo];
    return datosExpediente;
  }

  tipoExpedienteAfiliacion() {
    var estatus;
    var tipo;
    var icon;
    var color;
    int numero = 0;
    var numeroDocument;
    if (dataDatosExpediente.isEmpty) {
      estatus = '';
    } else {
      for (var element in dataDatosExpediente) {
        tipo = element.tipoExpediente;
        numeroDocument = element.numeroDocumentos;
        if (element.existe == 'SI') {
          numero++;
        }
      }
    }

    if (numeroDocument == numero) {
      estatus = 'COMPLETO';
      icon = Icons.check_circle;
      color = Colors.green;
    } else {
      estatus = 'INCOMPLETO';
      icon = Icons.error;
      color = Colors.red[800];
    }

    List datosExpediente = [icon, color, estatus, tipo];
    return datosExpediente;
  }
}
