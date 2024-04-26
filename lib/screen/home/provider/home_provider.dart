
import 'package:flutter/material.dart';
import 'package:planet_app/screen/home/model/home_model.dart';
import 'package:planet_app/utils/api_helper.dart';

import '../../../utils/shared_helper.dart';

class HomeProvider with ChangeNotifier {
  List<PlanetModel> planetdata = [];
  APIHelper? helper;
  bool isLight = true;
  List<String>nameList = [];
  List<String>imageList = [];
  List<String>desList = [];
  int index = 0;

  Future<void> planetgetdata() async {
    List<PlanetModel> list = await APIHelper.helper.planetdata();
    planetdata = list;
    notifyListeners();
  }

  // void changeIndex(int i) {
  //   index = i;
  //   notifyListeners();
  // }

  void changeTheme() async {
    ShareHelper shr = ShareHelper.shareHelper;
    bool? isTheme = await shr.getTheme();
    isLight = isTheme ?? false;
    notifyListeners();
    // }
    // Future<void> setData(
    //     {required String n1, required String i1, required String d1}) async {
    //   await getdata();
    //   nameList.add(n1);
    //   imageList.add(i1);
    //   desList.add(d1);
    //   await ShareHelper.shareHelper.setBookMark(nameList, imageList, desList);
    //   notifyListeners();
    // }
    // Future<void> getData() async {
    //   if (nameList != null) {
    //     nameList = nameList;
    //     imageList = (await ShareHelper.shareHelper.getimageList())!;
    //     desList = (await ShareHelper.shareHelper.getdesList())!;
    //     notifyListeners();
    //   }
    //   notifyListeners();
    // }
  }
}