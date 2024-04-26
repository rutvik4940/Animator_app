import 'package:shared_preferences/shared_preferences.dart';

class ShareHelper {
static ShareHelper shareHelper=ShareHelper._();
ShareHelper._();

  Future<void> setTheme(bool isTheme) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setBool('theme', isTheme);
  }

  Future<bool?> getTheme() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    return shr.getBool("theme");
  }
  Future<void> setBookMark(List<String>nameList,List<String>imageList,List<String>desList)
  async {
    SharedPreferences shr=await SharedPreferences.getInstance();
    shr.setStringList("name", nameList);
    shr.setStringList("image", imageList);
    shr.setStringList("des", desList);
  }
  Future<List<String>?> getnameList()
  async {
    SharedPreferences shr= await SharedPreferences.getInstance();
    return shr.getStringList("name");
  }
  Future<List<String>?> getimageList()
  async {
    SharedPreferences shr= await SharedPreferences.getInstance();
    return shr.getStringList("image");
  }
  Future<List<String>?> getdesList()
  async {
    SharedPreferences shr= await SharedPreferences.getInstance();
    return shr.getStringList("des");
  }

}