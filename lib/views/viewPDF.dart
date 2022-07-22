// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

/// Represents ViewPDF for Navigation
class ViewPDF extends StatefulWidget {
  final String nombre;
  final String referencia;
  final String telefono;
  final String correo;
  final String estatus;
  final String expediente;
  final double avanceAhorroPDF;
  const ViewPDF(this.nombre, this.referencia, this.telefono, this.correo,
      this.estatus, this.expediente, this.avanceAhorroPDF,
      {Key? key})
      : super(key: key);
  @override
  _ViewPDF createState() => _ViewPDF();
}

class _ViewPDF extends State<ViewPDF> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vista expediente digital'),
        actions: <Widget>[
          IconButton(
          
            icon: const Icon(
              Icons.bookmark,
              color: Colors.white,
              semanticLabel: 'Bookmark',
            ),
            onPressed: () {/*
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyApp(
                        widget.nombre,
                        widget.referencia,
                        widget.telefono,
                        widget.correo,
                        widget.estatus,
                        widget.avanceAhorroPDF.toString(),
                        4)),
              );*/
            },
          ),
        ],
      ),
      body: SizedBox(
        width: 400,
        child: SfPdfViewer.network(
          widget.expediente,
        ),
      ),
    );
  }
}
