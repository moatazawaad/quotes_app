import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';
import 'bloc_observer.dart';
import 'injector.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  BlocOverrides.runZoned(
        () {
      runApp(const QuoteApp());
    },
    blocObserver: AppBlocObserver(),
  );
}
// /// example of callable class
// class Addition {
//   int call(int a, int b) => a + b;
// }
//
// void main() {
//   /// continue the example of callable class
//   Addition addition = Addition();
//   var result = addition(1, 2);
//   print(result);
//
//   runApp(const QuoteApp());
// }
