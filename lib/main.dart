import 'dart:async';

import 'package:barberz/controllers/bindings/binds.dart';
import 'package:barberz/presentation/theme.dart';
import 'package:barberz/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runZonedGuarded(() {
    runApp(GetMaterialApp(
        initialRoute: Routes.root,
        initialBinding: Binds(),
        locale: Locale('pt', 'PT'),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          SfGlobalLocalizations.delegate,
        ],
        supportedLocales: [Locale('en'), Locale('pt')],
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(
                primarySwatch: CustomTheme.primaryBlack)),
        defaultTransition: Transition.fade,
        getPages: Routes.routes));
  }, FirebaseCrashlytics.instance.recordError);
}
