import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:reusable_components/responsive.dart';
import 'package:reusable_components/styles.dart';

import 'bloc_observer.dart';
import 'cache_helper.dart';
import 'localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyLocalization.localizationSetup();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(LocalizedApp(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: translator.delegates,
      // Android + iOS Delegates
      locale: translator.activeLocale,
      // Active locale
      supportedLocales: translator.locals(),
      // Locals list
      theme: mainTheme,
      builder: (context, widget) => MyResponsive.responsiveSetup(widget),
    );
  }
}
