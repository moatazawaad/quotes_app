import 'dart:convert';

import 'package:quotes_clean_arch/core/error/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/quote_model.dart';


abstract class RandomQuoteLocalDataSource {
  Future<QuoteModel> getLastRandomQuote();
  Future<void> cacheQuote(QuoteModel quote);
}

class RandomQuoteLocalDataSourceImpl implements RandomQuoteLocalDataSource {
  final SharedPreferences sharedPreferences;

  RandomQuoteLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<QuoteModel> getLastRandomQuote() {
    final jsonString =
    sharedPreferences.getString('cached');
    if (jsonString != null) {
      final cacheRandomQuote =
      Future.value(QuoteModel.fromJson(json.decode(jsonString)));
      return cacheRandomQuote;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheQuote(QuoteModel quote) {
    return sharedPreferences.setString(
        'cached', json.encode(quote));
  }
}