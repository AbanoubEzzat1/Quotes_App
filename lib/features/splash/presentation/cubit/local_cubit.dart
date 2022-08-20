import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:quotes/features/random_quote/domain/usecases/base_usecase.dart';
import 'package:quotes/features/random_quote/presentation/resources/strings_manger.dart';
import 'package:quotes/features/splash/domain/usecases/change_lang.dart';
import 'package:quotes/features/splash/domain/usecases/get_saved_lang.dart';

part 'local_state.dart';

class LocalCubit extends Cubit<LocalState> {
  final ChangeLanguageUseCase changeLanguageUseCase;
  final GetSaveLanguageUseCase getSaveLanguageUseCase;

  LocalCubit({
    required this.changeLanguageUseCase,
    required this.getSaveLanguageUseCase,
  }) : super(const ChangeLocalState(Locale(AppStrings.englishCode)));

  String currentLanguageCode = AppStrings.englishCode;
  Future<void> getSavedLang() async {
    final response = await getSaveLanguageUseCase.call(NoParams());
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentLanguageCode = value;
      emit(ChangeLocalState(Locale(currentLanguageCode)));
    });
  }

  Future<void> _changeLang(String langCode) async {
    final response = await changeLanguageUseCase.call(langCode);
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentLanguageCode = langCode;
      emit(ChangeLocalState(Locale(currentLanguageCode)));
    });
  }

  void toEnglish() => _changeLang(AppStrings.englishCode);

  void toArabic() => _changeLang(AppStrings.arabicCode);
}
