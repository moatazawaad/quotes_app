import 'package:dartz/dartz.dart';

import 'package:quotes_clean_arch/core/error/failure.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/quote.dart';
import '../repositories/quote_repository.dart';

class GetRandomQuote implements UseCase<Quote, NoParams> {
  final QuoteRepository quoteRepository;

  GetRandomQuote({required this.quoteRepository});
  @override
  Future<Either<Failure, Quote>> call(NoParams params) =>
      quoteRepository.getRandomQuote();
// return quoteRepository.get(params.username);

}

// class LoginParams extends Equatable {
//   final String username;
//   final String password;
//
//   const LoginParams({required this.username, required this.password});
//
//   @override
//   List<Object?> get props => [username, password];
// }
