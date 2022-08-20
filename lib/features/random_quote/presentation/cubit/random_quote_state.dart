part of 'random_quote_cubit.dart';

abstract class RandomQuoteState extends Equatable {
  const RandomQuoteState();

  @override
  List<Object> get props => [];
}

class RandomQuoteInitial extends RandomQuoteState {}

class RandomQuoteIsLoading extends RandomQuoteState {}

class RandomQuoteIsLoaded extends RandomQuoteState {
  final Quote quote;

  RandomQuoteIsLoaded({required this.quote});
  List<Object> get props => [quote];
}

class RandomQuoteIsError extends RandomQuoteState {
  final String msg;

  RandomQuoteIsError({required this.msg});
  List<Object> get props => [msg];
}
