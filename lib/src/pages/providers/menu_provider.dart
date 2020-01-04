import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider{
  List<dynamic> opciones = [];

  _MenuProvider(){
//    cargarData();
  }

  Future <List<dynamic>> cargarData() async{ //Va a retornar la informacion q este dentro en un futuro, dentro de unos cuantos segundos

    final resp = await rootBundle.loadString('data/menu_opts.json');

    Map dataMap = json.decode(resp);
    opciones = dataMap['rutas'];

//    .then((data) { //Este metodo lee un json
//
//      }).catchError((err) {
//        print('Error: '+err.toString());
//      });
    return opciones;
  }
}

final menuProvider = new _MenuProvider();