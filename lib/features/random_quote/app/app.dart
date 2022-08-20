import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/features/random_quote/presentation/resources/routes_manger.dart';
import 'package:quotes/features/random_quote/presentation/resources/strings_manger.dart';
import 'package:quotes/features/random_quote/presentation/resources/them_manger.dart';
import 'package:quotes/features/splash/presentation/cubit/local_cubit.dart';
import 'package:quotes/locale/app_localizations_setup.dart';
import 'injection_container.dart' as di;

class QuoteApp extends StatelessWidget {
  const QuoteApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => di.instance<LocalCubit>()..getSavedLang()),
      ],
      child: BlocBuilder<LocalCubit, LocalState>(
        buildWhen: (previousState, currentState) {
          return previousState != currentState;
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            onGenerateRoute: RouteGenerator.getRoute,
            //initialRoute: Routes.splashRoute,
            theme: getAppThemDatat(),
            locale: state.locale,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localeResolutionCallback:
                AppLocalizationsSetup.localeResolutionCallback,
            localizationsDelegates:
                AppLocalizationsSetup.localizationsDelegates,
          );
        },
      ),
    );
  }
}
