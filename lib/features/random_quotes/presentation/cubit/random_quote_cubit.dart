import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:quotes_clean_arch/core/usecases/usecase.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/quote.dart';
import '../../domain/usecases/get_random_quote.dart';
part 'random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  final GetRandomQuote getRandomQuoteUseCase;
  RandomQuoteCubit({required this.getRandomQuoteUseCase})
      : super(RandomQuoteInitial());

  Future<void> getRandomQuote() async {
    emit(RandomQuoteIsLoading());
    Either<Failure, Quote> response = await getRandomQuoteUseCase(NoParams());
    emit(response.fold(
            (failure) => RandomQuoteError(msg: _mapFailureToMsg(failure)),
            (quote) => RandomQuoteLoaded(quote: quote)));
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'server failure';
      case CacheFailure:
        return 'cache failure';

      default:
        return 'unexpected error';
    }
  }
}
