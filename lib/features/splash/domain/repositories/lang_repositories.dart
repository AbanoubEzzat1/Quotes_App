import 'package:dartz/dartz.dart';
import 'package:quotes/features/random_quote/data/network/failure.dart';

abstract class LangRepository {
  Future<Either<Failure, bool>> changeLang({required String changeLangCode});
  Future<Either<Failure, String>> getSaveLang();
}
