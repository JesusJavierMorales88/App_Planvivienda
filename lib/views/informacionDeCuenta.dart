import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plan_vivienda_rutas/operacionLogin.dart';

import '../datos.dart';
import 'package:http/http.dart' as http;

class InformacionDeCuenta extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final String Referencia;
  // ignore: non_constant_identifier_names
  final String Nombre;
  final String Estado;
  const InformacionDeCuenta(this.Nombre, this.Referencia,this.Estado, {Key? key})
      : super(key: key);

  @override
  State<InformacionDeCuenta> createState() => _InformacionDeCuentaState();
}

class _InformacionDeCuentaState extends State<InformacionDeCuenta> {
  final _claveFormulario = GlobalKey<FormState>();
  /* CONTROLLADORES DE PASSWORD */
  TextEditingController textControllePassword = TextEditingController();
  TextEditingController textControlleNewPassword = TextEditingController();
  /* CONTROLLADORES DE INFORMACIÓN */
  TextEditingController textControlleCalle = TextEditingController();
  TextEditingController textControlleNumeroCalle = TextEditingController();
  TextEditingController textControlleCodigoPostal = TextEditingController();
  TextEditingController textControlleColonia = TextEditingController();
  TextEditingController textControlleEstado = TextEditingController();
  TextEditingController textControlleMunicipio = TextEditingController();
  TextEditingController textControlleSubPrograma = TextEditingController();
  TextEditingController textControlleCorreo = TextEditingController();
  TextEditingController textControlleCorreoAternativo = TextEditingController();
  TextEditingController textControlleTelefonoCasa = TextEditingController();
  TextEditingController textControlleTelefonoCelular = TextEditingController();
  TextEditingController textControlleTelefonoCelularAlternativo =
      TextEditingController();
  TextEditingController textControlleTelefonoOficinaTrabajo =
      TextEditingController();

/*  CONSULTAR DATOS DE CUENTA */
  // List<DatosCuenta> dataDatosCuenta = <DatosCuenta>[];

  var registrosDatosCuenta = <DatosCuenta>[];
  var prueba = '';
  Future<List<DatosCuenta>> tomarDatosDatosCuenta() async {
    var url = Uri.parse(
      "https://planvivienda.com.mx/SISPLAN/login/webServices/operacionesWebServices.php",
    );
    var response = await http.post(
      url,
      body: {
        "referencia": widget.Referencia,
        "idDatosCuenta": "01",
      },
    );
    var datosUsuario = json.decode(response.body);
    for (var element in datosUsuario["data"]) {
      textControlleCalle.text = element["CALLE"];
      textControlleNumeroCalle.text = element["NUMERO_INTERIOR"];
      textControlleCodigoPostal.text = element["CODIGO_POSTAL"];
      textControlleColonia.text = element["COLONIA"];
      textControlleEstado.text = element["ESTADO"];
      textControlleMunicipio.text = element["MUNICIPIO"];
      textControlleSubPrograma.text = element["SUB_PROGRAMA"];
      textControlleCorreo.text = element["CORREO"];
      textControlleCorreoAternativo.text = element["CORREO_ALTERNATIVO"];
      textControlleTelefonoCasa.text = element["TELEFONO_CASA"];
      textControlleTelefonoCelular.text = element["TELEFONO_CELULAR"];
      textControlleTelefonoCelularAlternativo.text =
          element["TELEFONO_CELULAR_ALTERNATIVO"];
      textControlleTelefonoOficinaTrabajo.text =
          element["TELEFONO_OFICINA_TRABAJO"];
    }

    return registrosDatosCuenta;
  }

  @override
  void initState() {
    // TODO: implement initState
    tomarDatosDatosCuenta();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          mostrarInfomacionDeCuenta(),
        ],
      ),
    );
  }

  mostrarInfomacionDeCuenta() {
    return DefaultTabController(
      length: 2,
      child: Column(children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Información de mi cuenta",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        TabBar(
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50), // Creates border
                color: Colors.blue),
            unselectedLabelColor: Colors.blue,
            labelColor: Colors.white,
            tabs: const [
              Tab(
                child: Text(
                  "ACTUALIZAR INFORMACIÓN",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Tab(
                child: Text(
                  "CAMBIAR CONTRASEÑA",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ]),
        Container(
          constraints: const BoxConstraints(
              minHeight: 100, minWidth: double.infinity, maxHeight: 1350),
          child: TabBarView(
            children: [
              informacion(),
              contrasenia(),
            ],
          ),
        ),
      ]),
    );
  }

  Column contrasenia() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const SizedBox(
          height: 20,
        ),
        Card(
          child: Column(
            children: [
              Column(
                children: [
                  Row(children: [
                    const SizedBox(
                      width: 120,
                      height: 50,
                      child: Card(
                        color: Color.fromARGB(255, 142, 207, 67),
                        child: Center(
                          child: Text(
                            "Nombre",
                            style: TextStyle(fontSize: 17, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Wrap(
                      children: [Text(widget.Nombre)],
                    )
                  ]),
                  Row(children: [
                    const SizedBox(
                      width: 120,
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
                      children: [Text(widget.Referencia)],
                    )
                  ]),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Card(
          child: Form(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Row(children: [
                      const SizedBox(
                        width: 100,
                        height: 50,
                        child: Card(
                          elevation: 20,
                          shape: CircleBorder(),
                          color: Color.fromARGB(255, 142, 207, 67),
                          child: Center(
                            child: Text(
                              "1",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Wrap(
                        children: const [
                          Text(
                            "Escribe",
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      )
                    ]),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == '') {
                        return 'Escribe el código de barras';
                      }
                      return null;
                    },
                    controller: textControllePassword,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Contraseña',
                    ),
                  ),
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
                          elevation: 20,
                          shape: CircleBorder(),
                          color: Color.fromARGB(255, 142, 207, 67),
                          child: Center(
                            child: Text(
                              "2",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Wrap(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            "Confirma",
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      )
                    ]),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                  child: TextFormField(
                    controller: textControlleNewPassword,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Contraseña',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    actualizarPassword(
                        textControllePassword.text,
                        textControlleNewPassword.text,
                        widget.Referencia,
                        context);
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 50),
                      primary: Colors.lightGreen),
                  child: const Text(
                    "ENVIAR",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Column informacion() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const SizedBox(
          height: 20,
        ),
        Card(
          child: Column(
            children: [
              Column(
                children: [
                  Row(children: [
                    const SizedBox(
                      width: 120,
                      height: 50,
                      child: Card(
                        color: Color.fromARGB(255, 142, 207, 67),
                        child: Center(
                          child: Text(
                            "Nombre",
                            style: TextStyle(fontSize: 17, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Wrap(
                      children: [Text(widget.Nombre)],
                    )
                  ]),
                  Row(children: [
                    const SizedBox(
                      width: 120,
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
                      children: [Text(widget.Referencia)],
                    )
                  ]),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Card(
          child: Form(
            key: _claveFormulario,
            child: Column(
              children: [
                const Text(
                  "Los campos marcados con * son obligatorios",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Row(children: [
                      const SizedBox(
                        width: 100,
                        height: 50,
                        child: Card(
                          elevation: 20,
                          shape: CircleBorder(),
                          color: Color.fromARGB(255, 142, 207, 67),
                          child: Center(
                            child: Text(
                              "1",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Wrap(
                        children: const [
                          Text(
                            "Domicilio",
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      )
                    ]),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                  child: TextFormField(
                    controller: textControlleCalle,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Calle*',
                        labelStyle: TextStyle(color: Colors.lightGreen)),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: textControlleNumeroCalle,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Número*',
                        labelStyle: TextStyle(color: Colors.lightGreen)),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    maxLength: 5,
                    controller: textControlleCodigoPostal,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Código postal*',
                        labelStyle: TextStyle(color: Colors.lightGreen)),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                  child: TextFormField(
                    controller: textControlleColonia,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Colonia*',
                        labelStyle: TextStyle(color: Colors.lightGreen)),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                  /*child: dopDown(),
                  */

                  child: TextFormField(
                    controller: textControlleEstado,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Estado*',
                        labelStyle: TextStyle(color: Colors.lightGreen)),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                  child: TextFormField(
                    controller: textControlleMunicipio,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Municipio*',
                        labelStyle: TextStyle(color: Colors.lightGreen)),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                  child: TextFormField(
                    controller: textControlleSubPrograma,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Suprograma',
                        labelStyle: TextStyle(color: Colors.lightGreen)),
                  ),
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
                          elevation: 20,
                          shape: CircleBorder(),
                          color: Color.fromARGB(255, 142, 207, 67),
                          child: Center(
                            child: Text(
                              "2",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Wrap(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            "Contacto",
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ]),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: textControlleCorreo,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Correo electrónico*',
                        labelStyle: TextStyle(color: Colors.lightGreen)),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: textControlleCorreoAternativo,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Correo alternativo',
                        labelStyle: TextStyle(color: Colors.lightGreen)),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    controller: textControlleTelefonoCasa,
                    maxLength: 10,
                    validator: (value) {
                      if (value!.length < 10) {
                        return "Debe ingresa 10 digitos";
                      }
                    },
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Teléfono de casa*',
                        labelStyle: TextStyle(color: Colors.lightGreen)),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    maxLength: 10,
                    validator: (value) {
                      if (value!.length < 10) {
                        return "Debe ingresa 10 digitos";
                      }
                      return null;
                    },
                    controller: textControlleTelefonoCelular,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Teléfono celular*',
                      labelStyle: TextStyle(color: Colors.lightGreen),
                    ),
                  ),
                ),
                Padding(
                  padding: //7424242616
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: textControlleTelefonoCelularAlternativo,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (value) {
                      if (value != '') {
                        if (value!.length < 10) {
                          return "Debe ingresa 10 digitos";
                        }
                      }
                    },
                    maxLength: 10,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Teléfono celular alternativo',
                        labelStyle: TextStyle(color: Colors.lightGreen)),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                  child: TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (value) {
                      if (value != '') {
                        if (value!.length < 10) {
                          return "Debe ingresa 10 digitos";
                        }
                      }
                    },
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    controller: textControlleTelefonoOficinaTrabajo,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Teléfono de oficina o trabajo',
                        labelStyle: TextStyle(color: Colors.lightGreen)),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    final form = _claveFormulario.currentState;
                    if (form!.validate()) {
                      actualizarInformacionCuenta(
                          widget.Referencia,
                          textControlleCalle.text,
                          textControlleNumeroCalle.text,
                          textControlleCodigoPostal.text,
                          textControlleColonia.text,
                          textControlleEstado.text,
                          textControlleMunicipio.text,
                          textControlleSubPrograma.text,
                          textControlleCorreo.text,
                          textControlleCorreoAternativo.text,
                          textControlleTelefonoCasa.text,
                          textControlleTelefonoCelular.text,
                          textControlleTelefonoCelularAlternativo.text,
                          textControlleTelefonoOficinaTrabajo.text);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 50),
                      primary: Colors.lightGreen),
                  child: const Text(
                    "ENVIAR",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  
  DropdownButtonFormField<String> dopDown() {
    return DropdownButtonFormField(
      decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Estado*',
          labelStyle: TextStyle(color: Colors.lightGreen)),
      value: widget.Estado,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      onChanged: (String? newValue) {
        setState(() {
          textControlleEstado.text = newValue!;
        });
      },
      items: <String>[
        '',
        'Aguascalientes',
        'Baja California',
        'Baja California Sur',
        'Campeche',
        'Chiapas',
        'Chihuahua',
        'Ciudad de México',
        'Coahuila',
        'Colima',
        'Durango',
        'Guanajuato',
        'Guerrero',
        'Hidalgo',
        'Jalisco',
        'México',
        'Michoacán',
        'Morelos',
        'Nayarit',
        'Nuevo León',
        'Oaxaca',
        'Puebla',
        'Querétaro',
        'Quintana Roo',
        'San Luis Potosí',
        'Sinaloa',
        'Sonora',
        'Tabasco',
        'Tamaulipas',
        'Tlaxcala',
        'Veracruz',
        'Yucatán',
        'Zacatecas'
      ].map<DropdownMenuItem<String>>(
        (String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        },
      ).toList(),
    );
  }

  actualizarInformacionCuenta(
      referencia,
      calle,
      numero,
      codigoPostal,
      colonia,
      estado,
      municipio,
      subprograma,
      email1,
      email2,
      telCasa,
      celular1,
      celular2,
      telOficina) async {
    try {
      var url = Uri.parse(
          "https://planvivienda.com.mx/SISPLAN/login/webServices/operacionesWebServices.php");
      var response = await http.post(
        url,
        body: {
          "idDatosCuenta": "02",
          "referencia": referencia.toString(),
          "calle": calle.toString(),
          "numero": numero.toString(),
          "codigoPostal": codigoPostal.toString(),
          "colonia": colonia.toString(),
          "estado": estado.toString(),
          "municipio": municipio.toString(),
          "subprograma": subprograma.toString(),
          "email1": email1.toString(),
          "email2": email2.toString(),
          "telCasa": telCasa.toString(),
          "celular1": celular1.toString(),
          "celular2": celular2.toString(),
          "telOficina": telOficina.toString()
        },
      );
      Map datosInformacionActualizada = json.decode(response.body);
      //print(json.decode(response.body));

      if (datosInformacionActualizada["data"][0]["ESTATUS"] == 'OK') {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            // ignore: prefer_interpolation_to_compose_strings
            title: Text(
                // ignore: prefer_interpolation_to_compose_strings
                "${"¡" + datosInformacionActualizada["data"][0]["ESTATUS"]}!"),
            // ignore: prefer_interpolation_to_compose_strings
            content: Text(
                // ignore: prefer_interpolation_to_compose_strings
                "${"¡" + datosInformacionActualizada["data"][0]["MENSAJE"]}!"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'OK');
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }

      tomarDatosDatosCuenta();
    } catch (e) {
      print(e);
    }
  }
}
