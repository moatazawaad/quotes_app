import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_clean_arch/features/splash/presentation/screens/splash_screen.dart';
import '../../features/random_quotes/presentation/cubit/random_quote_cubit.dart';
import '../../features/random_quotes/presentation/screens/quote_screen.dart';
import '../../injector.dart';

class Routes {
  static const String initialRoute = '/';
  static const String favoriteQuoteScreen = '/favoriteQuote';
  static const String randomQuoteScreen = '/randomQuote';
}


/// on generate route better for all projects specially for big one
class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
      // return MaterialPageRoute(builder: (context) => const QuoteScreen());
        return MaterialPageRoute(builder: (context) {
          return const SplashScreen();
        });

      case Routes.randomQuoteScreen:
        return MaterialPageRoute(builder: ((context) {
          return BlocProvider(
            create: ((context) => sl<RandomQuoteCubit>()),
            child: const QuoteScreen(),
          );
        }));
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
          body: Center(
            child: Text('no route found'),
          ),
        )));
  }
}

// final routes = {
//   // '/': (context) => const QuoteScreen(),
//   // '/favoriteQuote': (context) => const FavoriteQuotesScreen(),
//
//   /// this is named route for small n medium projects
//   /// '/' this means initial route the first screen
//   Routes.initialRoute: (context) => const QuoteScreen(),
//   Routes.favoriteQuoteScreen: (context) => const FavoriteQuotesScreen()
// };
