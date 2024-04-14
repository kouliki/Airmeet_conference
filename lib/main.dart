import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_conferencing/navbar_pages/language.dart';
import 'package:video_conferencing/pages/Home_Page.dart';
import 'package:video_conferencing/landing_page.dart';
import 'package:video_conferencing/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  runApp(
      MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // final localeProvider = Provider.of<LocaleProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // locale: localeProvider.locale,
      // localizationsDelegates: [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   // Add other localization delegates if needed
      // ],
      // supportedLocales: L10n.all,
      home: const SplashScreen(),
    );
  }
}

