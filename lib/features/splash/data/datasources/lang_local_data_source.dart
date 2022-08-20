import 'package:quotes/features/random_quote/presentation/resources/strings_manger.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LangLocalDataScource {
  Future<bool> changeLang({required String changeLangCode});
  Future<String> getSaveLang();
}

class LangLocalDataScourceImpl extends LangLocalDataScource {
  final SharedPreferences sharedPreferences;

  LangLocalDataScourceImpl({required this.sharedPreferences});
  @override
  Future<bool> changeLang({required String changeLangCode}) async {
    return await sharedPreferences.setString(AppStrings.locale, changeLangCode);
  }

  @override
  Future<String> getSaveLang() async {
    return await sharedPreferences.getString(AppStrings.locale) ??
        AppStrings.englishCode;

    // sharedPreferences.containsKey(AppStrings.locale)?
    //  sharedPreferences.getString(AppStrings.locale): AppStrings.englishCode;
  }
}
