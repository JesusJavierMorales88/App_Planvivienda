import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:plan_vivienda_rutas/views/viewPDF.dart';
import 'dart:async';
import '../datos.dart';


// ignore: camel_case_types
class talleres extends StatefulWidget {
  final String referencia;
  const talleres(this.referencia, {Key? key}) : super(key: key);
  @override
  State<talleres> createState() => _talleresState();
}

// ignore: camel_case_types
class _talleresState extends State<talleres> {
  late String existeTallerAfiliacion ='';
   late String existeTallerVinculacion ='';

     late String existeTallerAfiliacionURL ='';
   late String existeTallerVinculacionURL ='';

  List<DatosTallerresAfiliacion> dataDatosTallerresAfiliacion = <DatosTallerresAfiliacion>[];
  List<DatosTallerresVinculacion> dataDatosTallerresVinculacion = <DatosTallerresVinculacion>[];

/* TALERES DE AFILIACION */
  var registrosDatosTallerresAfiliacion = <DatosTallerresAfiliacion>[];
  Future<List<DatosTallerresAfiliacion>> tomarDatosDatosTallerresAfiliacion(tipoTaller) async {
    var url = Uri.parse(
      "https://planvivienda.com.mx/SISPLAN/login/webServices/operacionesWebServices.php",
    );
    var response = await http.post(
      url,
      body: {"referencia": widget.referencia, "claveTaller": tipoTaller},
    );
    var datos = jsonDecode(response.body);
    print(datos);
    for (var datos in datos["TALLERES"]) {
      registrosDatosTallerresAfiliacion.add(DatosTallerresAfiliacion.fromJson(datos));
    }
    if(datos["CER_AFI"][0]["EXISTE_CERTIFICADO"] =='NO'){
      existeTallerAfiliacion = datos["CER_AFI"][0]["EXISTE_CERTIFICADO"];
      existeTallerAfiliacionURL = datos["CER_AFI"][0]["RUTA"];
    }
    
    return registrosDatosTallerresAfiliacion;
  }

    var registrosDatosTallerresVinculacion = <DatosTallerresVinculacion>[];
  Future<List<DatosTallerresVinculacion>> tomarDatosDatosTallerresVinculacion(tipoTaller) async {
    var url = Uri.parse(
      "https://planvivienda.com.mx/SISPLAN/login/webServices/operacionesWebServices.php",
    );
    var response = await http.post(
      url,
      body: {"referencia": widget.referencia, "claveTaller": tipoTaller},
    );
    var datos = jsonDecode(response.body);
    print(datos);
    for (var datos in datos["TALLERES"]) {
      registrosDatosTallerresVinculacion.add(DatosTallerresVinculacion.fromJson(datos));
    }
    if( datos["CER_VIN"][0]["EXISTE_CERTIFICADO"]=='NO'){
      existeTallerVinculacion = datos["CER_VIN"][0]["EXISTE_CERTIFICADO"];
      existeTallerVinculacionURL = datos["CER_VIN"][0]["RUTA"];
      }
     
    return registrosDatosTallerresVinculacion;
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
       tomarDatosDatosTallerresAfiliacion("AFILIACION").then((value) {        
      setState(() {      
        dataDatosTallerresAfiliacion.addAll(value);         
      });
    });
     tomarDatosDatosTallerresVinculacion("VINCULACION").then((value) {        
      setState(() {      
        dataDatosTallerresVinculacion.addAll(value);
         
      });
    });
     
  }

  @override
  Widget build(BuildContext context) {
   
  
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(1, 25, 1, 0),
                    child: Image.asset(
                      'assets/images/icon-talleres.png',
                      scale: 2.4,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "LISTA DE TALLERES",
                    style: TextStyle(
                        fontSize: 23,
                        color: Colors.lightGreen,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Mediante talleres presenciales y",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "virtuales, te informaremos sobre temas",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "relevantes de tu vivienda y tu crédito",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "hipotecario.",
                    style: TextStyle(
                      fontSize: 16,
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
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "En esta sección puedes visualizar el progreso de",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const Text(
                      "los talleres que has completado y los que tienes",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const Text(
                      "pendientes por cursar.",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          mostrarTaleres(),
        ],
      ),
    );
  }

  mostrarTaleres() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
      child: DefaultTabController(
        length: 2,
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          TabBar(
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), // Creates border
                  color: Colors.lightGreen),
              unselectedLabelColor: Colors.lightGreen,
              labelColor: Colors.white,
              tabs: const [
                Tab(
                  child: Text(
                    "AFILIACIÓN",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    "VINCULACIÓN Y TITULACIÓN",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
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
                      height: 20,
                    ),
                    // ignore: prefer_const_constructors
                    existeTallerAfiliacion == 'SI' ?
                    GestureDetector(                      
                      onTap: () {   
                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ViewPDF(
                                                    "widget.nombre",
                                                    "widget.referencia",
                                                   " widget.celular",
                                                   " widget.correo",
                                                    "widget.estatus",
                                                   existeTallerAfiliacionURL,
                                                    2,
                                                  )),
                                        );                  
                      },
                      child: Image.asset(
                        'assets/images/PDF_file_icon.png',
                        scale: 15,                                    
                        
                      ),
                    ):Image.asset(
                        'assets/images/PDF_file_icon.png',
                        scale: 15,                                    
                        
                      ),
                      const SizedBox(
                      height: 10,
                    ),
                    Text("Constancia $existeTallerAfiliacion disponible"),
                    const SizedBox(
                      height: 20,
                    ),
                    DataTable(
                      headingRowColor:MaterialStateColor.resolveWith((states) => const Color.fromARGB(221, 31, 30, 30)),
                      columns: const <DataColumn>[                        
                        DataColumn(
                          label: Text(
                            'Nombre del taller',
                            style: TextStyle(fontStyle: FontStyle.italic,color: Colors.white),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Asistencia',
                            style: TextStyle(fontStyle: FontStyle.italic,color: Colors.white),
                          ),
                        ),
                      ],
                      rows: List<DataRow>.generate(
                      dataDatosTallerresAfiliacion.length,                        
                        (int index) => DataRow(                          
                          cells: <DataCell>[                            
                            DataCell(Text(
                                dataDatosTallerresAfiliacion[index].nombreTaller, style: const TextStyle(fontSize: 12),),),                            
                            DataCell(
                               dataDatosTallerresAfiliacion[index].asistencia =='SI' ?                              
                              const Icon(
                                Icons.check_circle,color: Colors.lightGreen,
                              ):  const Icon(
                                Icons.cancel,color: Colors.red,
                              ),
                            ),                            
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
                    // ignore: prefer_const_constructors
                    existeTallerVinculacion == 'SI' ?
                    GestureDetector(                      
                      onTap: () {    
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewPDF(
                                      "widget.nombre",
                                      "widget.referencia",
                                      " widget.celular",
                                      " widget.correo",
                                      "widget.estatus",
                                      existeTallerVinculacionURL,
                                      2,
                                    )),
                      );                     
                      },
                      child: Image.asset(
                        'assets/images/PDF_file_icon.png',
                        scale: 15,                                  
                      ),
                    ):Image.asset(
                        'assets/images/PDF_file_icon.png',
                        scale: 15,                               
                      ),
                      const SizedBox(
                      height: 10,
                    ),
                    Text("Constancia $existeTallerVinculacion disponible"),
                    const SizedBox(
                      height: 20,
                    ),                  
                    DataTable(
                       headingRowColor:MaterialStateColor.resolveWith((states) => const Color.fromARGB(221, 31, 30, 30)),
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            'Nombre del taller',
                            style: TextStyle(fontStyle: FontStyle.italic,color: Colors.white),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Asistencia',
                            style: TextStyle(fontStyle: FontStyle.italic,color: Colors.white),
                          ),
                        ),
                      ],
                      rows: List<DataRow>.generate(
                        dataDatosTallerresVinculacion.length,                        
                        (int index) => DataRow(                          
                          cells: <DataCell>[                            
                            DataCell(Text(
                                dataDatosTallerresVinculacion[index].nombreTaller, style: const TextStyle(fontSize: 12),),),                            
                            DataCell(
                               dataDatosTallerresVinculacion[index].asistencia =='SI' ?                              
                              const Icon(
                                Icons.check_circle,color: Colors.lightGreen,
                              ):  const Icon(
                                Icons.cancel,color: Colors.red,
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
      ),
    );
  }
}
