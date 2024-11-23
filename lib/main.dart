import 'package:Maravillas360/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // Importar para usar la localización
import 'screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  // Método estático para cambiar el idioma globalmente
  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(locale);
  }
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;
  Locale _locale = Locale('es', 'ES'); // Idioma predeterminado: español

  void toggleTheme(bool? value) {
    setState(() {
      isDarkMode = value ?? false;
    });
  }

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maravillas 360',
      debugShowCheckedModeBanner: false,
      theme: _buildThemeData(),
      locale: _locale, // Aplicar el idioma actual
      home: SplashScreen(toggleTheme: toggleTheme),

      // Agregar las delegaciones de localización
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }

  ThemeData _buildThemeData() {
    return isDarkMode
        ? ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Colors.black,
            appBarTheme: AppBarTheme(color: Colors.grey[850]),
          )
        : ThemeData(
            primaryColor: Colors.white,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          );
  }
}

class SplashScreen extends StatefulWidget {
  final Function(bool?) toggleTheme;

  SplashScreen({required this.toggleTheme});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.of(context).pushReplacement(_createRoute());
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          Home(toggleTheme: widget.toggleTheme),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return _buildSlideTransition(animation, child);
      },
      transitionDuration: Duration(milliseconds: 500),
    );
  }

  SlideTransition _buildSlideTransition(
      Animation<double> animation, Widget child) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.easeInOut;

    var tween = Tween<Offset>(begin: begin, end: end)
        .chain(CurveTween(curve: curve));
    var offsetAnimation = animation.drive(tween);

    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.pink],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Image.asset('assets/logo.png'),
        ),
      ),
    );
  }
}
