import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:planet_app/screen/home/model/home_model.dart';

class APIHelper
{
   static APIHelper helper=APIHelper._();
  APIHelper._();
  Future<List<PlanetModel>> planetdata()
  async {
    String planetString= await rootBundle.loadString("assets/json/planet.json");
    List<dynamic> json=jsonDecode(planetString);
    List<PlanetModel> planetlist=json.map((e) =>PlanetModel.mapToModel(e)).toList();
    return planetlist;
  }
}