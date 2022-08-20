import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:quotes/features/random_quote/app/BlocObserver%20.dart';

import 'package:quotes/features/random_quote/app/app.dart';
import 'package:quotes/features/random_quote/app/injection_container.dart'
    as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer = MyBlocObserver();
  runApp(const QuoteApp());

  // BlocOverrides.runZoned(() {
  //   runApp(const QuoteApp());
  // }, blocObserver: MyBlocObserver());
}
