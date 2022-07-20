// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

import 'package:plan_vivienda_rutas/views/bienvenida.dart';
import 'package:plan_vivienda_rutas/views/contacto.dart';
import 'package:plan_vivienda_rutas/views/expedienteDigital.dart';
import 'package:plan_vivienda_rutas/views/informacionDeCuenta.dart';
import 'package:plan_vivienda_rutas/views/precalificacion.dart';
import 'package:plan_vivienda_rutas/views/reporteDeFallas.dart';
import 'package:plan_vivienda_rutas/views/resumenDeAhorro.dart';
import 'package:plan_vivienda_rutas/views/talleres.dart';

class MyApp extends StatefulWidget {
  final String nombre;
  final String referencia;
  final String telefono;
  final String correo;
  final String estatus;
  final String avanceAhorro;
  final int selectDrawerItem;
  final String estado;
  const MyApp(this.nombre, this.referencia, this.telefono, this.correo,
      this.estatus, this.avanceAhorro, this.selectDrawerItem,this.estado,
      {Key? key})
      : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late int _selectDrawerItem = widget.selectDrawerItem;


  _getDrawerItemWidget(int pos) {
    print(widget.estado);
    switch (pos) {
      case 0:
        return const contacto();
      case 1:
        return ReporteDeFallas(widget.referencia);
      case 2:
        return InformacionDeCuenta(widget.nombre, widget.referencia,widget.estado);
      case 3:
        return talleres(widget.referencia);
      case 4:
        return ExpedienteDigital(
            widget.referencia,
            widget.nombre,
            widget.telefono,
            widget.correo,
            widget.estatus,
            double.parse(widget.avanceAhorro));
      case 6: 
            return Precalificacion(widget.nombre, widget.referencia);
      case 8:
        return ResumenDeAhorro(widget.nombre, double.parse(widget.avanceAhorro),
            widget.referencia);
      case 9:
        return PageStateFullWidget(widget.nombre);
    }
  }

  _onselectItem(int pos) {
    Navigator.of(context).pop();
    setState(() {
      _selectDrawerItem = pos;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.8),
        iconTheme: const IconThemeData(color: Colors.grey),
        title: Image.network(
          'https://planvivienda.com.mx/img/logo01.png',
          fit: BoxFit.contain,
          height: 60,
        ),
      ),
      body: _getDrawerItemWidget(_selectDrawerItem),
      drawer: menu(),
    );
  }

  Drawer menu() {
    List<String> nombreSplit = widget.nombre.split(" ");
    String primerLetra = nombreSplit[0].substring(0, 1);
    String segundaLetra = nombreSplit[1].substring(0, 1);

    return Drawer(
      child: ListView(
        children: [
          // ignore: prefer_const_constructors, duplicate_ignore
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.lightGreen,
            ),
            accountName: Text(widget.correo),
            // ignore: prefer_const_constructors
            accountEmail: Text(widget.nombre),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Text('$primerLetra $segundaLetra'),
            ),
          ),
          ListTile(
            title: const Text("Avance de ahorro"),
            leading: const Icon(Icons.signal_cellular_alt),
            selected: (8 == _selectDrawerItem),
            onTap: () {
              _onselectItem(8);
            },
          ),
          ListTile(
            leading: const Icon(Icons.feed),
            title: const Text("Estado de cuenta"),
            selected: (7 == _selectDrawerItem),
            onTap: () {
              _onselectItem(7);
            },
          ),
          ListTile(
            leading: const Icon(Icons.check_box),
            title: const Text("Precalificación de tu credito hipotecario"),
            selected: (6 == _selectDrawerItem),
            onTap: () {
              _onselectItem(6);
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Prototipo de vivienda"),
            selected: (5 == _selectDrawerItem),
            onTap: () {
              _onselectItem(5);
            },
          ),
          ListTile(
            leading: const Icon(Icons.folder),
            title: const Text("Expediente digital"),
            selected: (4 == _selectDrawerItem),
            onTap: () {
              _onselectItem(4);
            },
          ),
          ListTile(
            leading: const Icon(Icons.groups),
            title: const Text("Talleres"),
            selected: (3 == _selectDrawerItem),
            onTap: () {
              _onselectItem(3);
            },
          ),
          ListTile(
            leading: const Icon(Icons.dns),
            title: const Text("Información de mi cuenta de cuenta"),
            selected: (2 == _selectDrawerItem),
            onTap: () {
              _onselectItem(2);
            },
          ),
          ListTile(
            leading: const Icon(Icons.article),
            title: const Text("Reporte de fallas"),
            selected: (1 == _selectDrawerItem),
            onTap: () {
              _onselectItem(1);
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            selected: (0 == _selectDrawerItem),
            title: const Text("Contacto"),
            onTap: () {
              _onselectItem(0);
            },
          ),
        ],
      ),
    );
  }
}
