import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/api/api_consumer.dart';
import 'core/api/app_interceptor.dart';
import 'core/api/dio_consumer.dart';
import 'core/network/network_info.dart';
import 'features/random_quotes/data/datasource/random_quote_local_datasource.dart';
import 'features/random_quotes/data/datasource/random_quote_remote_datasource.dart';
import 'features/random_quotes/data/repositories/quote_repository_impl.dart';
import 'features/random_quotes/domain/repositories/quote_repository.dart';
import 'features/random_quotes/domain/usecases/get_random_quote.dart';
import 'features/random_quotes/presentation/cubit/random_quote_cubit.dart';
import 'features/splash/data/datasource/lang_local_data_source.dart';
import 'features/splash/data/repositories/lang_repository_impl.dart';
import 'features/splash/domain/repositories/lang_repository.dart';
import 'features/splash/domain/usecases/change_lang.dart';
import 'features/splash/domain/usecases/get_saved_lang.dart';
import 'features/splash/presentation/cubit/locale_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features

  // Blocs
  sl.registerFactory<RandomQuoteCubit>(
          () => RandomQuoteCubit(getRandomQuoteUseCase: sl()));
  sl.registerFactory<LocaleCubit>(
          () => LocaleCubit(getSavedLangUseCase: sl(), changeLangUseCase: sl()));

  // Use cases
  sl.registerLazySingleton<GetRandomQuote>(
          () => GetRandomQuote(quoteRepository: sl()));
  sl.registerLazySingleton<GetSavedLangUseCase>(
          () => GetSavedLangUseCase(langRepository: sl()));
  sl.registerLazySingleton<ChangeLangUseCase>(
          () => ChangeLangUseCase(langRepository: sl()));

  // Repository
  sl.registerLazySingleton<QuoteRepository>(() => QuoteRepositoryImpl(
      networkInfo: sl(),
      randomQuoteRemoteDataSource: sl(),
      randomQuoteLocalDataSource: sl()));
  sl.registerLazySingleton<LangRepository>(
          () => LangRepositoryImpl(langLocalDataSource: sl()));

  // Data Sources
  sl.registerLazySingleton<RandomQuoteLocalDataSource>(
          () => RandomQuoteLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<RandomQuoteRemoteDataSource>(
          () => RandomQuoteRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<LangLocalDataSource>(
          () => LangLocalDataSourceImpl(sharedPreferences: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => AppIntercepters());
  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
}