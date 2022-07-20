class DatosPrincipalesAfiliado {
  String referencia;
  String nombre;
  String telefono;
  String correo;
  String estatus;
  String avanceDeAhorro;

  DatosPrincipalesAfiliado(
      {required this.referencia,
      required this.nombre,
      required this.telefono,
      required this.correo,
      required this.estatus,
      required this.avanceDeAhorro});

  factory DatosPrincipalesAfiliado.fromJson(Map<String, dynamic> data) {
    return DatosPrincipalesAfiliado(
      referencia: data['REFERENCIA'].toString(),
      nombre: data['NOMBRE'].toString(),
      telefono: data['TELEFONO'].toString(),
      correo: data['CORREO'].toString(),
      estatus: data['ESTATUS'].toString(),
      avanceDeAhorro: data['AVANCEDEAHORRO'].toString(),
    );
  }
}

class DatosTallerresAfiliacion {
  String tipoTaller;
  String nombreTaller;
  String fechaTaller;
  String asistencia;

  DatosTallerresAfiliacion({
    required this.tipoTaller,
    required this.nombreTaller,
    required this.fechaTaller,
    required this.asistencia,
  });

  factory DatosTallerresAfiliacion.fromJson(Map<String, dynamic> data) {
    return DatosTallerresAfiliacion(
      tipoTaller: data['TIPO_TALLER'].toString(),
      nombreTaller: data['NOMBRE_TALLER'].toString(),
      fechaTaller: data['FECHA_TALLER'].toString(),
      asistencia: data['ASISTENCIA'].toString(),
    );
  }
}
class DatosTallerresVinculacion {
  String tipoTaller;
  String nombreTaller;
  String fechaTaller;
  String asistencia;

  DatosTallerresVinculacion({
    required this.tipoTaller,
    required this.nombreTaller,
    required this.fechaTaller,
    required this.asistencia,
  });

  factory DatosTallerresVinculacion.fromJson(Map<String, dynamic> data) {
    return DatosTallerresVinculacion(
      tipoTaller: data['TIPO_TALLER'].toString(),
      nombreTaller: data['NOMBRE_TALLER'].toString(),
      fechaTaller: data['FECHA_TALLER'].toString(),
      asistencia: data['ASISTENCIA'].toString(),
    );
  }
}
class DatosCuenta {
  String referencia;
  String nombreAfiliado;
  String rfc;
  String colonia;
  String calle;
  String numeroInterior;
  String codigoPostal;
  String municipio;
  String estado;
  String telefonoCasa;
  String telefonoCelular;
  String telefonoCelularAlternativo;
  String correo;
  String correoAternativo;
  String subPrograma;
  String telefonoOficinaTrabajo;
  String fechaActual;

  DatosCuenta(
      {required this.referencia,
      required this.nombreAfiliado,
      required this.rfc,
      required this.colonia,
      required this.calle,
      required this.numeroInterior,
      required this.codigoPostal,
      required this.municipio,
      required this.estado,
      required this.telefonoCasa,
      required this.telefonoCelular,
      required this.telefonoCelularAlternativo,
      required this.correo,
      required this.correoAternativo,
      required this.subPrograma,
      required this.telefonoOficinaTrabajo,
      required this.fechaActual});

  factory DatosCuenta.fromJson(Map<String, dynamic> data) {
    return DatosCuenta(
      referencia: data['REFERENCIA'].toString(),
      nombreAfiliado: data['NOMBRE_AFILIADO'].toString(),
      rfc: data['RFC'].toString(),
      colonia: data['COLONIA'].toString(),
      calle: data['CALLE'].toString(),
      numeroInterior: data['NUMERO_INTERIOR'].toString(),
      codigoPostal: data['CODIGO_POSTAL'].toString(),
      municipio: data['MUNICIPIO'].toString(),
      estado: data['ESTADO'].toString(),
      telefonoCasa: data['TELEFONO_CASA'].toString(),
      telefonoCelular: data['TELEFONO_CELULAR'].toString(),
      telefonoCelularAlternativo:
          data['TELEFONO_CELULAR_ALTERNATIVO'].toString(),
      correo: data['CORREO'].toString(),
      correoAternativo: data['CORREO_ALTERNATIVO'].toString(),
      subPrograma: data['SUB_PROGRAMA'].toString(),
      telefonoOficinaTrabajo: data['TELEFONO_OFICINA_TRABAJO'].toString(),
      fechaActual: data['FECHA_ACTUAL'].toString(),
    );
  }
}

class DatosExpediente {
  String tipoExpediente;
  String documento;
  String fechaDigitalizacion;
  String existe;
  String ruta;
  String vigencia;
  String numeroDocumentos;

  DatosExpediente({
    required this.tipoExpediente,
    required this.documento,
    required this.fechaDigitalizacion,
    required this.existe,
    required this.ruta,
    required this.vigencia,
    required this.numeroDocumentos,
  });

  factory DatosExpediente.fromJson(Map<String, dynamic> data) {
    return DatosExpediente(
      tipoExpediente: data['TIPO_EXPEDIENTE'].toString(),
      documento: data['DOCUMENTO'].toString(),
      fechaDigitalizacion: data['FECHA_DIG'].toString(),
      existe: data['EXISTE'].toString(),
      ruta: data['RUTA'].toString(),
      vigencia: data['VIGENCIA'].toString(),
      numeroDocumentos: data['NUMERO_DOCUMENTOS'].toString(),
    );
  }
}

class AfiliadoNuevoAfiliado {
  String anio;
  String ahorroPactado;
  String enero;
  String febrero;
  String marzo;
  String abril;
  String mayo;
  String junio;
  String julio;
  String agosto;
  String septiembre;
  String octubre;
  String noviembre;
  String diciembre;
  String fechaAclaracion;
  String completo;
  String fechaInicioAhorro;

  String estatus;

  AfiliadoNuevoAfiliado({
    required this.anio,
    required this.ahorroPactado,
    required this.enero,
    required this.febrero,
    required this.marzo,
    required this.abril,
    required this.mayo,
    required this.junio,
    required this.julio,
    required this.agosto,
    required this.septiembre,
    required this.octubre,
    required this.noviembre,
    required this.diciembre,
    required this.fechaAclaracion,
    required this.completo,
    required this.fechaInicioAhorro,
    required this.estatus,
  });
  factory AfiliadoNuevoAfiliado.fromJson(Map<String, dynamic> data) {
    return AfiliadoNuevoAfiliado(
      anio: data['ANIO'].toString(),
      ahorroPactado: data['AHORROPACTADO'].toString(),
      enero: data['ENE'].toString(),
      febrero: data['FEB'].toString(),
      marzo: data['MAR'].toString(),
      abril: data['ABR'].toString(),
      mayo: data['MAY'].toString(),
      junio: data['JUN'].toString(),
      julio: data['JUL'].toString(),
      agosto: data['AGO'].toString(),
      septiembre: data['SEP'].toString(),
      octubre: data['OCT'].toString(),
      noviembre: data['NOV'].toString(),
      diciembre: data['DIC'].toString(),
      fechaAclaracion: data['F_ACLARACIONES'].toString(),
      completo: data['COMPLETO'].toString(),
      fechaInicioAhorro: data['FECHAINIAHORRO'].toString(),
      estatus: data['ESTATUS'].toString(),
    );
  }
}
