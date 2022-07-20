import 'package:flutter/material.dart';

import '../operacionLogin.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool obscuserTexto = true;
  TextEditingController textControllerReferencia = TextEditingController();
  TextEditingController textControllerPassword = TextEditingController();
  TextEditingController textControllerNumneroCelular = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Primier StateFullWidget"),
      // ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.network(
              "http://planvivienda.org/SISPLAN-PROD/img/Recurso 1IMG032.png",
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              child: Image.network(
                "https://planvivienda.com.mx/img/logo01.png",
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 120, horizontal: 0),
              // padding: const EdgeInsets.all(0),
              width: 500,
              child: const Text(
                "Nuestra misión es gestionar",
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 150, horizontal: 0),
              // padding: const EdgeInsets.all(0),
              width: 500,
              child: const Text(
                "VIVIENDAS Y FINANCIAMIENTO",
                style: TextStyle(
                    color: Colors.lightGreen,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 180, horizontal: 0),
              // padding: const EdgeInsets.all(0),
              width: 500,
              child: const Text(
                "de calidad para las FAMILIAS mexicanas",
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xFFffffcc),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: Colors.grey)),
              // ignore: sort_child_properties_last
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "SI YA ERES AFILIADO PLANVIVIENDA",
                      style: TextStyle(fontSize: 17),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: textControllerReferencia,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          // border: InputBorder.none,
                          hintText: 'Tu referencia'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: textControllerPassword,
                      obscureText: obscuserTexto,
                      decoration: InputDecoration(
                        suffix: InkWell(
                          onTap: () {
                            setState(() {
                              obscuserTexto = !obscuserTexto;
                            });
                          },
                          child: const Icon(Icons.visibility),
                        ),
                        prefixIcon: const Icon(Icons.lock),
                        hintText: 'Contraseña',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: textControllerNumneroCelular,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.phone_android),
                          hintText: 'Número telefónico'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          login(
                              textControllerReferencia.text,
                              textControllerPassword,
                              textControllerNumneroCelular,
                              context);
                        },
                        child: const Text("INICIAR SESIÓN")),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "¿OLVIDASTE TU CONTRASEÑA?", //011AAVZ89021455242 DXTCA
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              margin: const EdgeInsets.fromLTRB(10, 230, 10, 30),
              // padding: const EdgeInsets.all(0),
              width: 400,
              height: 360,
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xFFffffcc),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: Colors.grey)),
              // ignore: sort_child_properties_last
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "SI QUIERES CONOCER NUESTRA PLATAFORMA Y SERVICIOS",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        child: const Text("INICIAR SESIÓN COMO INVITADO")),
                  ],
                ),
              ),
              margin: const EdgeInsets.fromLTRB(10, 600, 10, 30),
              // padding: const EdgeInsets.all(0),
              width: 400,
              height: 104,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 730, 10, 30),
              // padding: const EdgeInsets.all(0),
              width: 400,
              height: 40,
              child: const Text(
                "Sistema de Información y Gestión para afiiación de Planvivienda. Todos los derechos reservados. PLANVIVIENDA",
                style: TextStyle(fontSize: 13.3),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.refresh),
      //   onPressed: () {},
      // ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState

    textControllerReferencia.text = '011AACP73062919411';
    textControllerPassword.text = 'pac2906y';
    super.initState();
  }
}
