import '../../domain/entities/quote.dart';

class QuoteModel extends Quote {
  const QuoteModel(
      {required String quote, required String author, required String content})
      : super(quote: quote, author: author, content: content);

  factory QuoteModel.fromJson(Map<String, dynamic> json) =>
      QuoteModel(quote: json['q'], author: json['a'], content: json['h']);

  // Map<String, dynamic> toJson() => {
  //       'q': quote,
  //       'a': author,
  //       'h': content,
  //     };
}

// class QuoteModel extends Quote {
//   const QuoteModel(
//       {required String quote,
//       required String author,
//       required int id,
//       required String permalink})
//       : super(quote: quote, author: author, id: id, permalink: permalink);
//
//   factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
//         quote: json['quote'],
//         author: json['author'],
//         id: json['id'],
//         permalink: json['permalink'],
//       );
//
//   Map<String, dynamic> toJson() => {
//         'author': author,
//         'quote': quote,
//         'id': id,
//         'permalink': permalink,
//       };
// }
