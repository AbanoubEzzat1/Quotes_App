import 'package:quotes/features/random_quote/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:quotes/features/random_quote/domain/usecases/base_usecase.dart';
import 'package:quotes/features/splash/domain/repositories/lang_repositories.dart';

class GetSaveLanguageUseCase extends UseCase<String, NoParams> {
  final LangRepository langRepository;
  GetSaveLanguageUseCase({required this.langRepository});
  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return await langRepository.getSaveLang();
  }
}
