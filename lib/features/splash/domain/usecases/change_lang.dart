import 'package:quotes/features/random_quote/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:quotes/features/random_quote/domain/usecases/base_usecase.dart';
import 'package:quotes/features/splash/domain/repositories/lang_repositories.dart';

class ChangeLanguageUseCase implements UseCase<bool, String> {
  final LangRepository langRepository;

  ChangeLanguageUseCase({required this.langRepository});
  @override
  Future<Either<Failure, bool>> call(String langCode) async {
    return await langRepository.changeLang(changeLangCode: langCode);
  }
}
