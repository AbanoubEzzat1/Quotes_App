import 'package:quotes/features/random_quote/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:quotes/features/random_quote/domain/entities/quote.dart';
import 'package:quotes/features/random_quote/domain/repositories/quote_repository.dart';
import 'package:quotes/features/random_quote/domain/usecases/base_usecase.dart';

class GetRandomQuote implements UseCase<Quote, NoParams> {
  final QuoteRepository _quoteRepository;

  GetRandomQuote(this._quoteRepository);
  @override
  Future<Either<Failure, Quote>> call(NoParams params) async {
    return await _quoteRepository.getRandomQuote();
  }
}
