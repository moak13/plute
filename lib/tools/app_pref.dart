import 'package:shared_preferences/shared_preferences.dart';

class AppPref {

  static var Value = 'searchValue';

  // To store a value
  static Future setSearch(String query) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(Value, query);
  } 

  // To get the stored value to be used in making background search query when the user revisits
  static Future getSearch() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String check = preferences.getString(Value) ?? 'No Search Has Been Initiated!';
    return check;
  }
}