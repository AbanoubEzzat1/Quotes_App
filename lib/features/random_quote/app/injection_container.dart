import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quotes/features/random_quote/data/api/api_consumer.dart';
import 'package:quotes/features/random_quote/data/api/app_interceptors.dart';
import 'package:quotes/features/random_quote/data/api/dio_consumer.dart';
import 'package:quotes/features/random_quote/data/datasources/local_data_source.dart';
import 'package:quotes/features/random_quote/data/datasources/remote_datasource.dart';
import 'package:quotes/features/random_quote/data/network/network_info.dart';
import 'package:quotes/features/random_quote/data/repositories/quote_repository_impl.dart';
import 'package:quotes/features/random_quote/domain/repositories/quote_repository.dart';
import 'package:quotes/features/random_quote/domain/usecases/get_random_quote.dart';
import 'package:quotes/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:quotes/features/splash/data/datasources/lang_local_data_source.dart';
import 'package:quotes/features/splash/data/repositories/lang_repositories_impl.dart';
import 'package:quotes/features/splash/domain/repositories/lang_repositories.dart';
import 'package:quotes/features/splash/domain/usecases/change_lang.dart';
import 'package:quotes/features/splash/domain/usecases/get_saved_lang.dart';
import 'package:quotes/features/splash/presentation/cubit/local_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final instance = GetIt.instance;

Future<void> init() async {
  //bloc
  instance.registerFactory(
      () => RandomQuoteCubit(getRandomQuoteUseCase: instance()));

  //LocalCubit
  instance.registerLazySingleton(() => LocalCubit(
      changeLanguageUseCase: instance(), getSaveLanguageUseCase: instance()));

  //use cases
  instance.registerLazySingleton(() => GetRandomQuote(instance())); //1
  //.registerLazySingleton<GetRandomQuote>(() => GetRandomQuote(instance()));
  //return it self so you can warite it as 1
  //dosno't return it self so you can warite it as 2

//GetSaveLanguageUseCase
  instance.registerLazySingleton<GetSaveLanguageUseCase>(
      () => GetSaveLanguageUseCase(langRepository: instance()));

  //ChangeLanguageUseCase
  instance.registerLazySingleton<ChangeLanguageUseCase>(
      () => ChangeLanguageUseCase(langRepository: instance()));

//Repository
//2
  instance.registerLazySingleton<QuoteRepository>(() => QuoteRepositoryImpl(
      networkInfo: instance(),
      randomQuoteRemoteDataSource: instance(),
      randomQuoteLocalDataSource: instance()));

//LangRepository
  instance.registerLazySingleton<LangRepository>(
      () => LangRepositoryImpl(langLocalDataScource: instance()));

//LocalDataSource
  instance.registerLazySingleton<RandomQuoteLocalDataSource>(
      () => RandomQuoteLocalDataSourceImpl(sharedPreferences: instance()));

//LangLocalDataScource
  instance.registerLazySingleton<LangLocalDataScource>(
      () => LangLocalDataScourceImpl(sharedPreferences: instance()));

//RemoteDataSource
  instance.registerLazySingleton<RandomQuoteRemoteDataSource>(
      () => RandomQuoteRemoteDataSourceImpl(apiConsumer: instance()));

//ApiConsumer
  instance.registerLazySingleton<ApiConsumer>(
      () => DioConsumer(client: instance()));
//Dio
  instance.registerLazySingleton(() => Dio());

//NetworkInfo
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: instance()));

//SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  instance.registerLazySingleton(() => sharedPreferences);

//http
  instance.registerLazySingleton(() => http.Client());

//InternetConnectionChecker
  instance.registerLazySingleton(() => InternetConnectionChecker());

//AppIntercepters
  instance.registerLazySingleton(() => AppIntercepters());

//LogInterceptor
  instance.registerLazySingleton(() => LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ));
}
