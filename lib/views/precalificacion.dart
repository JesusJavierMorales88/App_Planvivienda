import 'package:flutter/material.dart';
import 'package:plan_vivienda_rutas/views/viewPDF.dart';

class Precalificacion extends StatefulWidget {
  final String nombre;
  final String referencia;
  const Precalificacion(this.nombre, this.referencia, {Key? key})
      : super(key: key);

  @override
  State<Precalificacion> createState() => _PrecalificacionState();
}

class _PrecalificacionState extends State<Precalificacion> {
  @override
  Widget build(BuildContext context) {
    return mostrarTaleres();
  }

  mostrarTaleres() {
    return DefaultTabController(
      length: 2,
      child: Column(children: [
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),          
          child: TabBar(
              indicator: BoxDecoration(                
                borderRadius: BorderRadius.circular(5), // Creates border
                color: Colors.lightGreen,
              ),
              unselectedLabelColor: Colors.lightGreen,
              labelColor: Colors.white,
              tabs: const [
                Tab(
                  child: Text(
                    "ACTUAL",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    "ANTERIORES",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
        ),
        Container(
          constraints: const BoxConstraints(
            maxHeight: 600,
          ),
          child: TabBarView(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    width: 500,
                    height: 80,
                    child: Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(11.0),
                        ),
                      ),
                      color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Text(
                                  "PRECALIFICACIÓN",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ]),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                "SHF",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.nombre,
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.lightGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Row(children: [
                        const SizedBox(
                          width: 220,
                          height: 45,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                              Radius.circular(11.0),
                            )),
                            color: Color.fromARGB(255, 142, 207, 67),
                            child: Center(
                              child: Text(
                                "Referencia",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Wrap(
                          children: [Text(widget.referencia)],
                        )
                      ]),
                      Row(children: [
                        const SizedBox(
                          width: 220,
                          height: 45,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                              Radius.circular(11.0),
                            )),
                            color: Color.fromARGB(255, 142, 207, 67),
                            child: Center(
                              child: Text(
                                "CURP",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Wrap(
                          children: [Text("widget.referencia")],
                        )
                      ]),
                      Row(children: [
                        const SizedBox(
                          width: 220,
                          height: 45,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                              Radius.circular(11.0),
                            )),
                            color: Color.fromARGB(255, 142, 207, 67),
                            child: Center(
                              child: Text(
                                "RFC",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Wrap(
                          children: [Text("widget.referencia")],
                        )
                      ]),
                      Row(children: [
                        const SizedBox(
                          width: 220,
                          height: 45,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                              Radius.circular(11.0),
                            )),
                            color: Color.fromARGB(255, 142, 207, 67),
                            child: Center(
                              child: Text(
                                "Sueldo básico mensual",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Wrap(
                          children: [Text("widget.referencia")],
                        )
                      ]),
                      Row(children: [
                        const SizedBox(
                          width: 220,
                          height: 45,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                              Radius.circular(11.0),
                            )),
                            color: Color.fromARGB(255, 142, 207, 67),
                            child: Center(
                              child: Text(
                                "Monto de crédito estimado",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Wrap(
                          children: [Text("widget.referencia")],
                        )
                      ]),
                      Row(children: [
                        const SizedBox(
                          width: 220,
                          height: 45,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                              Radius.circular(11.0),
                            )),
                            color: Color.fromARGB(255, 142, 207, 67),
                            child: Center(
                              child: Text(
                                "Mensualidad aproximada",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Wrap(
                          children: [Text("widget.referencia")],
                        )
                      ]),
                      SizedBox(
                        width: 500,
                        height: 70,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                            Radius.circular(11.0),
                          ),
                          ),
                          color: Colors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    const Text(
                                      "Precalificación actualizada al 17/Sep/2021",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ]),
                              const SizedBox(
                                height: 10,
                              ),
                              
                            ],
                          ),
                        ),
                      ),
                      const Text("Esta precalificación constituye un ejercicio numérico de"),
                      const Text("acuerdo a una simulación de condiciones financieras y"),
                      const Text("NO constituye una solicitud formal, ni implica obligación"),
                      const Text("alguna para Planvivienda.")
                    ],
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
                  // ignore: prefer_const_constructors
                  1 == 1
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ViewPDF(
                                        "widget.nombre",
                                        "widget.referencia",
                                        " widget.celular",
                                        " widget.correo",
                                        "widget.estatus",
                                        "existeTallerVinculacionURL",
                                        2,
                                      )),
                            );
                          },
                          child: Image.asset(
                            'assets/images/PDF_file_icon.png',
                            scale: 15,
                          ),
                        )
                      : Image.asset(
                          'assets/images/PDF_file_icon.png',
                          scale: 15,
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Constancia disponible"),
                  const SizedBox(
                    height: 20,
                  ),
                  DataTable(
                    headingRowColor: MaterialStateColor.resolveWith(
                        (states) => const Color.fromARGB(221, 31, 30, 30)),
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text(
                          'Nombre del taller',
                          style: TextStyle(
                              fontStyle: FontStyle.italic, color: Colors.white),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Asistencia',
                          style: TextStyle(
                              fontStyle: FontStyle.italic, color: Colors.white),
                        ),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                      2,
                      (int index) => const DataRow(
                        cells: <DataCell>[
                          DataCell(
                            Text(
                              "dataDatosTallerresVinculacion[index].nombreTaller",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          DataCell(
                            1 == 1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.lightGreen,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
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
}
