// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:plan_vivienda_rutas/datos.dart';

class ResumenDeAhorro extends StatefulWidget {
  final String nombre;
  final double avance;
  final String usuario;

  ResumenDeAhorro(
    this.nombre,
    this.avance,
    this.usuario, {
    Key? key,
  }) : super(key: key);
  @override
  State<ResumenDeAhorro> createState() => _ResumenDeAhorroState();
}

class _ResumenDeAhorroState extends State<ResumenDeAhorro> {
  List<AfiliadoNuevoAfiliado> dataAfiliadoNuevoAfiliado =
      <AfiliadoNuevoAfiliado>[];

  var registrosAfiliadoNuevoAfiliado = <AfiliadoNuevoAfiliado>[];

  Future<List<AfiliadoNuevoAfiliado>> tomarDatosAfiliadoNuevoAfiliado() async {
    var url = Uri.parse(
      "https://planvivienda.com.mx/SISPLAN/login/webServices/resumen_de_ahorro.php",
    );
    var response = await http.post(
      url,
      body: {"usuario": widget.usuario.toString()},
    );
    var datos = jsonDecode(response.body);

    for (var datos in datos["data"]) {
      registrosAfiliadoNuevoAfiliado.add(AfiliadoNuevoAfiliado.fromJson(datos));
    }
    print(datos);

    return registrosAfiliadoNuevoAfiliado;
  }

  regresoFecha() {
    var fecha;
    if (dataAfiliadoNuevoAfiliado.isEmpty) {
      fecha = '0000-00-00';
    } else {
      for (var element in dataAfiliadoNuevoAfiliado) {
        fecha = element.fechaInicioAhorro;
      }
    }
    fecha = DateTime.parse(fecha);
    fecha = DateFormat.yMMMd().format(fecha);
    return fecha;
  }

  regresoIconoStatus() {
    var icon;
    var color;
    double rotacion = 0.0;
    var estatus = '';
    if (dataAfiliadoNuevoAfiliado.isEmpty) {
      estatus = '';
    } else {
      for (var element in dataAfiliadoNuevoAfiliado) {
        estatus = element.estatus;
      }
    }

    switch (estatus) {
      case "cumplido":
        icon = Icons.check_circle;
        color = Colors.green;
        rotacion = 0.0;
        break;
      case "incumplido":
        icon = Icons.close;
        color = Colors.red[800];
        rotacion = 0.0;
        break;
      case "consistente":
        icon = Icons.help;
        color = Colors.orange;
        rotacion = 0.0;
        break;
      case "inconsistente":
        icon = Icons.error;
        color = Colors.red[800];
        rotacion = 0.0;
        break;
      default:
        icon = Icons.check;
    }

    List numero = [icon, color, rotacion];
    return numero;
  }

  regresoEstatus() {
    String estatus = '';
    if (dataAfiliadoNuevoAfiliado.isEmpty) {
      estatus = '';
    } else {
      for (var element in dataAfiliadoNuevoAfiliado) {
        estatus = element.estatus;
      }
    }

    return estatus.toUpperCase();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tomarDatosAfiliadoNuevoAfiliado().then((value) {
      setState(() {
        dataAfiliadoNuevoAfiliado.addAll(value);
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
    // var fecha = data[1].fechaInicioAhorro.toString();

    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
            child: Row(
              children: [
                Image.network(
                  "https://planvivienda.com.mx/02/SISPLAN/POO/WEBSERVICE/img/logs_nueva_app/Mesa_de_trabajo_4_copiaiconos.png",
                  width: 120,
                ),
                Stack(
                  children: [
                    Text(
                      "AHORRO",
                      style: TextStyle(
                          color: Colors.lightGreen,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                      width: 260,
                      child: Text(
                        "Ahorrar en Planvivienda es sencillo, te permitirá estar preparado para realizar los gastos inherentes a la adquisición de tu vivienda.",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    "Estatus",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  Transform.rotate(
                    angle: regresoIconoStatus()[2], //3.127
                    child: Icon(
                      regresoIconoStatus()[0],
                      color: regresoIconoStatus()[1], //Colors.red[800],
                      size: 110,
                    ),
                  ),
                  Text(
                    regresoEstatus().toString(),
                    style: TextStyle(
                        color: regresoIconoStatus()[1],
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 2),
                    child: Text(
                      widget.nombre,
                      style: TextStyle(
                          color: Colors.lightGreen,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 2),
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text("Inicio de ahorro ",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              )),
                          Text(regresoFecha().toString()),
                          // data[0].fechaInicioAhorro
                        ],
                      )),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 2),
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text("Meta de mensualidades ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(
                          "24 meses",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 2),
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          "Avance: ",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Text("2%"),
                        Stack(
                          children: [
                            SizedBox(
                              height: 18,
                              width: 200,
                              child: LinearProgressIndicator(
                                value: widget.avance,
                                backgroundColor: Colors.grey,
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.lightGreen),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                              child: Text('${widget.avance}%'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Row(children: [
                  SizedBox(
                    width: 100,
                    height: 35,
                    child: Card(
                      color: Color.fromARGB(255, 59, 46, 46),
                      child: Text(
                        "Mes",
                        style:
                            const TextStyle(fontSize: 17, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Wrap(
                    children: List.generate(
                      dataAfiliadoNuevoAfiliado.length,
                      (index) {
                        return SizedBox(
                          width: 100,
                          height: 35,
                          child: Card(
                            color: Color.fromARGB(255, 59, 46, 46),
                            child: Text(
                              dataAfiliadoNuevoAfiliado[index].anio,
                              style: const TextStyle(
                                  fontSize: 17, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ]),
                Row(children: [
                  SizedBox(
                    width: 100,
                    height: 35,
                    child: Card(
                      color: Colors.grey,
                      child: Text(
                        "Enero",
                        style: const TextStyle(fontSize: 17),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Wrap(
                    children: List.generate(
                      dataAfiliadoNuevoAfiliado.length,
                      (index) {
                        return SizedBox(
                          width: 100,
                          height: 35,
                          child: Card(
                            color: dataAfiliadoNuevoAfiliado[index].enero ==
                                    '-0.00'
                                ? Colors.white
                                : dataAfiliadoNuevoAfiliado[index].enero ==
                                        '0.00'
                                    ? Colors.red
                                    : Colors.green,
                            child:
                                dataAfiliadoNuevoAfiliado[index].enero == '0.00'
                                    ? Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      ),
                          ),
                        );
                      },
                    ),
                  )
                ]),
                Row(children: [
                  SizedBox(
                    width: 100,
                    height: 35,
                    child: Card(
                      color: Colors.grey,
                      child: Text(
                        "Febrero",
                        style: const TextStyle(fontSize: 17),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Wrap(
                    children: List.generate(
                      dataAfiliadoNuevoAfiliado.length,
                      (index) {
                        return SizedBox(
                          width: 100,
                          height: 35,
                          child: Card(
                            color: dataAfiliadoNuevoAfiliado[index].febrero ==
                                    '-0.00'
                                ? Colors.white
                                : dataAfiliadoNuevoAfiliado[index].febrero ==
                                        '0.00'
                                    ? Colors.red
                                    : Colors.green,
                            child: dataAfiliadoNuevoAfiliado[index].febrero ==
                                    '0.00'
                                ? Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                          ),
                        );
                      },
                    ),
                  )
                ]),
                Row(children: [
                  SizedBox(
                    width: 100,
                    height: 35,
                    child: Card(
                        color: Colors.grey,
                        child: Text(
                          "Marzo",
                          style: const TextStyle(fontSize: 17),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Wrap(
                    children: List.generate(
                      dataAfiliadoNuevoAfiliado.length,
                      (index) {
                        return SizedBox(
                          width: 100,
                          height: 35,
                          child: Card(
                            color: dataAfiliadoNuevoAfiliado[index].marzo ==
                                    '-0.00'
                                ? Colors.white
                                : dataAfiliadoNuevoAfiliado[index].marzo ==
                                        '0.00'
                                    ? Colors.red
                                    : Colors.green,
                            child:
                                dataAfiliadoNuevoAfiliado[index].marzo == '0.00'
                                    ? Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      ),
                          ),
                        );
                      },
                    ),
                  )
                ]),
                Row(children: [
                  SizedBox(
                    width: 100,
                    height: 35,
                    child: Card(
                        color: Colors.grey,
                        child: Text(
                          "Abril",
                          style: const TextStyle(fontSize: 17),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Wrap(
                    children: List.generate(
                      dataAfiliadoNuevoAfiliado.length,
                      (index) {
                        return SizedBox(
                          width: 100,
                          height: 35,
                          child: Card(
                            color: dataAfiliadoNuevoAfiliado[index].abril ==
                                    '-0.00'
                                ? Colors.white
                                : dataAfiliadoNuevoAfiliado[index].abril ==
                                        '0.00'
                                    ? Colors.red
                                    : Colors.green,
                            child:
                                dataAfiliadoNuevoAfiliado[index].abril == '0.00'
                                    ? Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      ),
                          ),
                        );
                      },
                    ),
                  )
                ]),
                Row(children: [
                  SizedBox(
                    width: 100,
                    height: 35,
                    child: Card(
                        color: Colors.grey,
                        child: Text(
                          "Mayo",
                          style: const TextStyle(fontSize: 17),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Wrap(
                    children: List.generate(
                      dataAfiliadoNuevoAfiliado.length,
                      (index) {
                        return SizedBox(
                          width: 100,
                          height: 35,
                          child: Card(
                            color:
                                dataAfiliadoNuevoAfiliado[index].mayo == '-0.00'
                                    ? Colors.white
                                    : dataAfiliadoNuevoAfiliado[index].mayo ==
                                            '0.00'
                                        ? Colors.red
                                        : Colors.green,
                            child:
                                dataAfiliadoNuevoAfiliado[index].mayo == '0.00'
                                    ? Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      ),
                          ),
                        );
                      },
                    ),
                  )
                ]),
                Row(children: [
                  SizedBox(
                    width: 100,
                    height: 35,
                    child: Card(
                        color: Colors.grey,
                        child: Text(
                          "Junio",
                          style: const TextStyle(fontSize: 17),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Wrap(
                    children: List.generate(
                      dataAfiliadoNuevoAfiliado.length,
                      (index) {
                        return SizedBox(
                          width: 100,
                          height: 35,
                          child: Card(
                            color: dataAfiliadoNuevoAfiliado[index].junio ==
                                    '-0.00'
                                ? Colors.white
                                : dataAfiliadoNuevoAfiliado[index].junio ==
                                        '0.00'
                                    ? Colors.red
                                    : Colors.green,
                            child:
                                dataAfiliadoNuevoAfiliado[index].junio == '0.00'
                                    ? Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      ),
                          ),
                        );
                      },
                    ),
                  )
                ]),
                Row(children: [
                  SizedBox(
                    width: 100,
                    height: 35,
                    child: Card(
                        color: Colors.grey,
                        child: Text(
                          "Julio",
                          style: const TextStyle(fontSize: 17),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Wrap(
                    children: List.generate(
                      dataAfiliadoNuevoAfiliado.length,
                      (index) {
                        return SizedBox(
                          width: 100,
                          height: 35,
                          child: Card(
                            color: dataAfiliadoNuevoAfiliado[index].julio ==
                                    '-0.00'
                                ? Colors.white
                                : dataAfiliadoNuevoAfiliado[index].julio ==
                                        '0.00'
                                    ? Colors.red
                                    : Colors.green,
                            child:
                                dataAfiliadoNuevoAfiliado[index].julio == '0.00'
                                    ? Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      ),
                          ),
                        );
                      },
                    ),
                  )
                ]),
                Row(children: [
                  SizedBox(
                    width: 100,
                    height: 35,
                    child: Card(
                        color: Colors.grey,
                        child: Text(
                          "Agosto",
                          style: const TextStyle(fontSize: 17),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Wrap(
                    children: List.generate(
                      dataAfiliadoNuevoAfiliado.length,
                      (index) {
                        return SizedBox(
                          width: 100,
                          height: 35,
                          child: Card(
                            color: dataAfiliadoNuevoAfiliado[index].agosto ==
                                    '-0.00'
                                ? Colors.white
                                : dataAfiliadoNuevoAfiliado[index].agosto ==
                                        '0.00'
                                    ? Colors.red
                                    : Colors.green,
                            child: dataAfiliadoNuevoAfiliado[index].agosto ==
                                    '0.00'
                                ? Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                          ),
                        );
                      },
                    ),
                  )
                ]),
                Row(children: [
                  SizedBox(
                    width: 100,
                    height: 35,
                    child: Card(
                        color: Colors.grey,
                        child: Text(
                          "Septiembre",
                          style: const TextStyle(fontSize: 17),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Wrap(
                    children: List.generate(
                      dataAfiliadoNuevoAfiliado.length,
                      (index) {
                        return SizedBox(
                          width: 100,
                          height: 35,
                          child: Card(
                            color: dataAfiliadoNuevoAfiliado[index]
                                        .septiembre ==
                                    '-0.00'
                                ? Colors.white
                                : dataAfiliadoNuevoAfiliado[index].septiembre ==
                                        '0.00'
                                    ? Colors.red
                                    : Colors.green,
                            child:
                                dataAfiliadoNuevoAfiliado[index].septiembre ==
                                        '0.00'
                                    ? Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      ),
                          ),
                        );
                      },
                    ),
                  )
                ]),
                Row(children: [
                  SizedBox(
                    width: 100,
                    height: 35,
                    child: Card(
                        color: Colors.grey,
                        child: Text(
                          "Octubre",
                          style: const TextStyle(fontSize: 17),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Wrap(
                    children: List.generate(
                      dataAfiliadoNuevoAfiliado.length,
                      (index) {
                        return SizedBox(
                          width: 100,
                          height: 35,
                          child: Card(
                            color: dataAfiliadoNuevoAfiliado[index].octubre ==
                                    '-0.00'
                                ? Colors.white
                                : dataAfiliadoNuevoAfiliado[index].octubre ==
                                        '0.00'
                                    ? Colors.red
                                    : Colors.green,
                            child: dataAfiliadoNuevoAfiliado[index].octubre ==
                                    '0.00'
                                ? Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                          ),
                        );
                      },
                    ),
                  )
                ]),
                Row(children: [
                  SizedBox(
                    width: 100,
                    height: 35,
                    child: Card(
                        color: Colors.grey,
                        child: Text(
                          "Noviembre",
                          style: const TextStyle(fontSize: 17),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Wrap(
                    children: List.generate(
                      dataAfiliadoNuevoAfiliado.length,
                      (index) {
                        return SizedBox(
                          width: 100,
                          height: 35,
                          child: Card(
                            color: dataAfiliadoNuevoAfiliado[index].noviembre ==
                                    '-0.00'
                                ? Colors.white
                                : dataAfiliadoNuevoAfiliado[index].noviembre ==
                                        '0.00'
                                    ? Colors.red
                                    : Colors.green,
                            child: dataAfiliadoNuevoAfiliado[index].noviembre ==
                                    '0.00'
                                ? Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                          ),
                        );
                      },
                    ),
                  )
                ]),
                Row(children: [
                  SizedBox(
                    width: 100,
                    height: 35,
                    child: Card(
                        color: Colors.grey,
                        child: Text(
                          "Diciembre",
                          style: const TextStyle(fontSize: 17),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Wrap(
                    children: List.generate(
                      dataAfiliadoNuevoAfiliado.length,
                      (index) {
                        return SizedBox(
                          width: 100,
                          height: 35,
                          child: Card(
                            color: dataAfiliadoNuevoAfiliado[index].diciembre ==
                                    '-0.00'
                                ? Colors.white
                                : dataAfiliadoNuevoAfiliado[index].diciembre ==
                                        '0.00'
                                    ? Colors.red
                                    : Colors.green,
                            child: dataAfiliadoNuevoAfiliado[index].diciembre ==
                                    '0.00'
                                ? Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                          ),
                        );
                      },
                    ),
                  )
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
