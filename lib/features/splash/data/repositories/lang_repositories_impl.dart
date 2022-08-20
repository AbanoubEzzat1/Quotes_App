import 'package:quotes/features/random_quote/data/network/exeption.dart';
import 'package:quotes/features/random_quote/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:quotes/features/splash/data/datasources/lang_local_data_source.dart';
import 'package:quotes/features/splash/domain/repositories/lang_repositories.dart';

class LangRepositoryImpl implements LangRepository {
  final LangLocalDataScource langLocalDataScource;

  LangRepositoryImpl({required this.langLocalDataScource});
  @override
  Future<Either<Failure, bool>> changeLang(
      {required String changeLangCode}) async {
    try {
      final langIsChanged =
          await langLocalDataScource.changeLang(changeLangCode: changeLangCode);
      return Right(langIsChanged);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getSaveLang() async {
    try {
      final langCode = await langLocalDataScource.getSaveLang();
      return Right(langCode);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
