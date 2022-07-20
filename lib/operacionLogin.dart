import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:plan_vivienda_rutas/menuPrincipal.dart';
import 'dart:convert';

import 'package:plan_vivienda_rutas/views/login.dart';

void login(textControllerReferencia, textControllerPassword,
    textControllerNumneroCelular, context) async {
  try {
    var url = Uri.parse(
        "https://planvivienda.com.mx/SISPLAN/login/webServices/LogiApp.php");
    var response = await http.post(
      url,
      body: {
        "usuario": textControllerReferencia.toString(),
        "contrasenia": textControllerPassword.toString(),
        "celular": textControllerNumneroCelular.toString(),
      },
    );
    var url2 = Uri.parse(
        "https://planvivienda.com.mx/SISPLAN/login/webServices/datos_principales.php");
    var response2 = await http.post(
      url2,
      body: {"usuario": textControllerReferencia.toString()},
    );
  print(response2.body);
    Map datosUsuario = json.decode(response2.body);

    if (response.body == 'ERROR: Usuario o contraseña incorrecta' ||
        response.body == 'ERROR: Usuario o contraseña incorrecta 2') {
      // ignore: use_build_context_synchronously

      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('¡Error!'),
          content: Text(response.body),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      textControllerReferencia.clear();
      textControllerPassword.clear();
      textControllerNumneroCelular.clear();
      // ignore: use_build_context_synchronously

    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyApp(
              datosUsuario["data"][0]["NOMBRE"],
              datosUsuario["data"][0]["REFERENCIA"],
              datosUsuario["data"][0]["TELEFONO"],
              datosUsuario["data"][0]["CORREO"],
              datosUsuario["data"][0]["ESTATUS"],
              datosUsuario["data"][0]["AVANCEDEAHORRO"].toString(),
              9,
              datosUsuario["data"][0]["ESTADO"].toString(),),
        ),
      );
    }
  } catch (e) {
    print(e);
  }
}

void reporteDeFallasBD(
    referencia, falla, textControlleDescripcion, context) async {
  if (textControlleDescripcion == '') {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        // ignore: prefer_interpolation_to_compose_strings
        title: const Text("¡Erorr!"),
        // ignore: prefer_interpolation_to_compose_strings
        content: const Text("Es necesario llenar el campo de descripción."),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  } else {
    try {
      var url = Uri.parse(
          "https://planvivienda.com.mx/SISPLAN/login/webServices/reportarFallas.php");
      var response = await http.post(
        url,
        body: {
          "dataToSend": referencia.toString(),
          "item": falla.toString(),
          "descripcion": textControlleDescripcion.toString(),
        },
      );
      Map datosReporte = json.decode(response.body);
      if (datosReporte["REP_RESPONSE"][0]["ESTATUS"] == 'CORRECTO') {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            // ignore: prefer_interpolation_to_compose_strings
            title: Text("${"¡" + datosReporte["REP_RESPONSE"][0]["ESTATUS"]}!"),
            // ignore: prefer_interpolation_to_compose_strings
            content: Text("${"¡" + datosReporte["REP_RESPONSE"][0]["ALERT"]}!"),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
        //textControlleDescripcion
        textControlleDescripcion.clear();
      }
    } catch (e) {
      print(e);
    }
  }
}
/*
  011AACP73062919411
  pac2906y
*/

void actualizarPassword(password, newPassword, referencia, context) async {
  if (password == '' || newPassword == '') {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        // ignore: prefer_interpolation_to_compose_strings
        title: const Text("¡Erorr!"),
        // ignore: prefer_interpolation_to_compose_strings
        content: const Text("Es necesario llenar el campo de contraseña"),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  } else if (password != newPassword && password != '' && newPassword != '') {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        // ignore: prefer_interpolation_to_compose_strings
        title: const Text("¡Erorr!"),
        // ignore: prefer_interpolation_to_compose_strings
        content: const Text("Las contraseñas no coinciden"),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  } else /*(password == newPassword && password != '' && newPassword != '')*/ {
    try {
      var url = Uri.parse(
          "https://planvivienda.com.mx/SISPLAN/login/webServices/operacionesWebServices.php");
      var response = await http.post(
        url,
        body: {
          "referencia": referencia.toString(),
          "NuevoPaswword": newPassword.toString(),
        },
      );
      Map datosReporte = json.decode(response.body);

      if (datosReporte["data"][0]["ESTATUS"] == 'OK') {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            // ignore: prefer_interpolation_to_compose_strings
            title: Text("${"¡" + datosReporte["data"][0]["ESTATUS"]}!"),
            // ignore: prefer_interpolation_to_compose_strings
            content: Text("${"¡" + datosReporte["data"][0]["MENSAJE"]}!"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'OK');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
