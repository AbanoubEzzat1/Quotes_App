import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:quotes/features/random_quote/presentation/resources/strings_manger.dart';
import 'package:quotes/features/random_quote/presentation/screens/quote_screen.dart';
import 'package:quotes/features/random_quote/app/injection_container.dart'
    as di;

import '../../../splash/presentation/screens/splash_screen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String randomQuoteRoute = "/randomQuoteRoute ";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.randomQuoteRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => di.instance<RandomQuoteCubit>(),
            child: const QuouteScreen(),
          ),
        );

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(
                child: Text(AppStrings.noRouteFound),
              ),
            ));
  }
}
