import 'package:Maravillas360/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './/main.dart'; // Asegúrate de importar main.dart para acceder a MyApp

class LanguagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.current.planguage,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          LanguageTile(language: 'Español', flagPath: 'assets/images/flags/spain.jpg', locale: Locale('es', 'ES')),
          LanguageTile(language: 'English', flagPath: 'assets/images/flags/uk.jpg', locale: Locale('en', 'US')),
          LanguageTile(language: 'Français', flagPath: 'assets/images/flags/france.jpg', locale: Locale('fr', 'FR')),
          LanguageTile(language: 'Deutsch', flagPath: 'assets/images/flags/germany.jpg', locale: Locale('de', 'DE')),
          LanguageTile(language: 'Italiano', flagPath: 'assets/images/flags/italy.jpg', locale: Locale('it', 'IT')),
          LanguageTile(language: '中文', flagPath: 'assets/images/flags/china.jpg', locale: Locale('zh', 'CN')),
        ],
      ),
    );
  }
}

class LanguageTile extends StatelessWidget {
  final String language;
  final String flagPath;
  final Locale locale;

  const LanguageTile({required this.language, required this.flagPath, required this.locale});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Image.asset(flagPath, width: 40, height: 30),
        title: Text(
          language,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Idioma cambiado a $language')),
          );
          // Cambiar el idioma utilizando MyApp.setLocale
          MyApp.setLocale(context, locale);
        },
      ),
    );
  }
}
