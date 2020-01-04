import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//import 'package:componentes/src/pages/home_temp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,

      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('es', 'ES')
      ],
      
      
      //home: HomePage(),
      initialRoute: '/',
      routes: getAplicationRoutes(),
      onGenerateRoute: (RouteSettings settings){
        return MaterialPageRoute(
          builder: (BuildContext context) => AlertPage()
        );
      },
    );
  }
}