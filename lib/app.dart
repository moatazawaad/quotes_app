import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_clean_arch/config/locale/app_localizations_setup.dart';
import 'package:quotes_clean_arch/features/splash/presentation/cubit/locale_cubit.dart';
import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'injector.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<LocaleCubit>()),
        ],
        child: BlocBuilder<LocaleCubit, LocaleState>(
          buildWhen: (previousState, currentState) {
            return previousState != currentState;
          },
          builder: (context, state) {
            return MaterialApp(
              title: AppStrings.appName,
              locale: state.locale,
              debugShowCheckedModeBanner: false,
              theme: appTheme(),
              onGenerateRoute: AppRoutes.onGenerateRoute,
              //routes: routes,
              // home: const QuoteScreen(),
              supportedLocales: AppLocalizationsSetup.supportedLocales,
              localeResolutionCallback:
              AppLocalizationsSetup.localeResolutionCallback,
              localizationsDelegates:
              AppLocalizationsSetup.localizationsDelegates,
            );
          },
        ));
  }
}
