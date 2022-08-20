import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:quotes/features/random_quote/data/network/failure.dart';
import 'package:quotes/features/random_quote/domain/entities/quote.dart';
import 'package:quotes/features/random_quote/domain/usecases/base_usecase.dart';
import 'package:quotes/features/random_quote/presentation/resources/strings_manger.dart';

import '../../domain/usecases/get_random_quote.dart';

part 'random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  final GetRandomQuote getRandomQuoteUseCase;
  RandomQuoteCubit({required this.getRandomQuoteUseCase})
      : super(RandomQuoteInitial());

  Future<void> getRandomQuote() async {
    emit(RandomQuoteIsLoading());
    Either<Failure, Quote> response =
        await getRandomQuoteUseCase.call(NoParams());
    emit(
      response.fold(
        (failure) => RandomQuoteIsError(msg: _mapFailureToMsg(failure)),
        (quote) => RandomQuoteIsLoaded(quote: quote),
      ),
    );
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case CacheFailure:
        return AppStrings.cacheFailure;
      default:
        return AppStrings.unexpectedError;
    }
  }
}
