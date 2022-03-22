import 'package:shared_preferences/shared_preferences.dart';

class Todorepository {
  Todorepository() {
    SharedPreferences.getInstance().then(
      (value) => sharedPreferences = value,
    );
  }

  late SharedPreferences sharedPreferences;
}
