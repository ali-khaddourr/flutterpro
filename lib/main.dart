import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:job_search/view/screens/home/JSHomeScreen.dart';
import 'package:job_search/view/screens/profile/JSProfileScreen.dart';
import 'package:job_search/view/screens/splash/JSSplashScreen.dart';
import 'package:job_search/store/AppStore.dart';
import 'package:job_search/core/utils/AppTheme.dart';
import 'package:nb_utils/nb_utils.dart';

import 'core/multi_provider.dart';
import 'di_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initialize();
  serviceLocatorInit();
  runApp(multiProvider(child: const MyApp()));
}

AppStore appStore = AppStore();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        scrollBehavior: SBehavior(),
        navigatorKey: navigatorKey,
        title: 'Jobaaty',
        debugShowCheckedModeBanner: false,
        theme: AppThemeData.lightTheme,
        darkTheme: AppThemeData.darkTheme,
        themeMode: appStore.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        home: JSProfileScreen(),
        // supportedLocales: LanguageDataModel.languageLocales(),
/*        localizationsDelegates: [
          AppLocalizations(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) => locale,
        locale: Locale(appStore.selectedLanguage.validate(value: AppConstant.defaultLanguage)),*/
      ),
    );
  }
}
