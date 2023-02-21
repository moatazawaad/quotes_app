import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final String quote;
  final String author;
  final String content;

  const Quote({required this.quote, required this.author, required this.content});

  @override
  // TODO: implement props
  List<Object?> get props => [quote, author, content];

}

// class Quote extends Equatable {
//   final String quote;
//   final String author;
//   final int id;
//   final String permalink;
//
//   const Quote({
//     required this.id,
//     required this.permalink,
//     required this.quote,
//     required this.author,
//   });
//
//   @override
//   List<Object?> get props => [
//         quote,
//         author,
//         id,
//         permalink,
//       ];
// }
