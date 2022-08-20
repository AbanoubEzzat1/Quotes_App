import 'package:flutter/material.dart';
import 'package:quotes/features/random_quote/domain/entities/quote.dart';
import 'package:quotes/features/random_quote/presentation/resources/colors_manger.dart';
import 'package:quotes/features/random_quote/presentation/resources/values_manger.dart';

class QuoteContent extends StatelessWidget {
  final Quote quote;
  const QuoteContent({
    Key? key,
    required this.quote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(AppMargin.m20),
          padding: const EdgeInsets.all(AppMargin.m20),
          decoration: BoxDecoration(
              color: ColorsManger.primary,
              borderRadius: BorderRadius.circular(AppSize.s28)),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(bottom: AppSize.s8),
                child: Icon(
                  Icons.format_quote_sharp,
                  size: AppSize.s35,
                  color: ColorsManger.white,
                ),
              ),
              Text(quote.content,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium),
              Container(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.format_quote_sharp,
                  size: AppSize.s35,
                  color: ColorsManger.white,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: AppSize.s16,
                  horizontal: AppSize.s20,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: AppSize.s40,
                      color: ColorsManger.white,
                    ),
                    const SizedBox(width: AppSize.s18),
                    Text(quote.author,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: AppMargin.m20),
          padding: const EdgeInsets.all(AppMargin.m20),
          decoration: BoxDecoration(
              color: ColorsManger.primary,
              borderRadius: BorderRadius.circular(AppSize.s28)),
          child: Text(quote.permalink,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium),
        ),
      ],
    );
  }
}
