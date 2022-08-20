import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quotes/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:quotes/features/random_quote/presentation/resources/colors_manger.dart';

import 'package:quotes/features/random_quote/presentation/widgets/error_widget.dart'
    as error_widget;
import 'package:quotes/features/splash/presentation/cubit/local_cubit.dart';
import 'package:quotes/locale/app_localizations.dart';

import '../widgets/quote_content.dart';

class QuouteScreen extends StatefulWidget {
  const QuouteScreen({Key? key}) : super(key: key);

  @override
  State<QuouteScreen> createState() => _QuouteScreenState();
}

class _QuouteScreenState extends State<QuouteScreen> {
  _getRandomQuote() =>
      BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();

  @override
  void initState() {
    super.initState();
    _getRandomQuote();
  }

  Widget _buildBodyContent() {
    return BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
        builder: ((context, state) {
      if (state is RandomQuoteIsLoading) {
        return const Center(
          child: SpinKitFadingCircle(
            color: ColorsManger.primary,
          ),
        );
      } else if (state is RandomQuoteIsError) {
        return error_widget.ErrorWidget(
          onPress: () => _getRandomQuote(),
        );
      } else if (state is RandomQuoteIsLoaded) {
        return SingleChildScrollView(
          child: Column(
            children: [
              QuoteContent(
                quote: state.quote,
              ),
              InkWell(
                  onTap: () => _getRandomQuote(),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: ColorsManger.primary),
                    child: const Icon(
                      Icons.refresh,
                      size: 28,
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        );
      } else {
        return const Center(
          child: SpinKitFadingCircle(
            color: ColorsManger.primary,
          ),
        );
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      systemOverlayStyle:
          SystemUiOverlayStyle(statusBarColor: ColorsManger.white),
      leading: IconButton(
        icon: const Icon(
          Icons.translate_outlined,
          color: ColorsManger.primary,
        ),
        onPressed: () {
          if (AppLocalizations.of(context)!.isEnLocale) {
            BlocProvider.of<LocalCubit>(context).toArabic();
          } else {
            BlocProvider.of<LocalCubit>(context).toEnglish();
          }
        },
      ),
      title:
          //const Text('app_name'),
          Text(AppLocalizations.of(context)!.translate('app_name')!),
    );
    return RefreshIndicator(
        child: Scaffold(appBar: appBar, body: _buildBodyContent()),
        onRefresh: () => _getRandomQuote());
  }
}
