import 'package:dartz/dartz.dart';
import 'package:quotes_clean_arch/core/error/exceptions.dart';
import 'package:quotes_clean_arch/core/error/failure.dart';
import 'package:quotes_clean_arch/core/network/network_info.dart';
import 'package:quotes_clean_arch/features/random_quotes/data/datasource/random_quote_local_datasource.dart';
import 'package:quotes_clean_arch/features/random_quotes/data/datasource/random_quote_remote_datasource.dart';
import 'package:quotes_clean_arch/features/random_quotes/domain/entities/quote.dart';
import '../../domain/repositories/quote_repository.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final NetworkInfo networkInfo;
  final RandomQuoteRemoteDataSource randomQuoteRemoteDataSource;
  final RandomQuoteLocalDataSource randomQuoteLocalDataSource;

  QuoteRepositoryImpl(
      {required this.networkInfo,
        required this.randomQuoteRemoteDataSource,
        required this.randomQuoteLocalDataSource});

  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    // if (await networkInfo.isConnected) {
    try {
      final remoteRandomQuote =
      await randomQuoteRemoteDataSource.getRandomQuote();
      randomQuoteLocalDataSource.cacheQuote(remoteRandomQuote);
      return Right(remoteRandomQuote);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
//   else {
//     try {
//       final cacheRandomQuote =
//           await randomQuoteLocalDataSource.getLastRandomQuote();
//       return Right(cacheRandomQuote);
//     } on CacheException {
//       return Left(CacheFailure());
//     }
//   }
// }
}
