import 'package:flutter/material.dart';
import 'home.dart'; // Asegúrate de importar la clase Home

class LanguagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Seleccionar Idioma',
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
            // Regresa a la pantalla anterior sin crear una nueva instancia de Home
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          LanguageTile(language: 'Español', flagPath: 'assets/images/flags/spain.jpg'),
          LanguageTile(language: 'English', flagPath: 'assets/images/flags/uk.jpg'),
          LanguageTile(language: 'Français', flagPath: 'assets/images/flags/france.jpg'),
          LanguageTile(language: 'Deutsch', flagPath: 'assets/images/flags/germany.jpg'),
          LanguageTile(language: 'Italiano', flagPath: 'assets/images/flags/italy.jpg'),
          LanguageTile(language: '中文', flagPath: 'assets/images/flags/china.jpg'),
        ],
      ),
    );
  }
}

class LanguageTile extends StatelessWidget {
  final String language;
  final String flagPath;

  const LanguageTile({required this.language, required this.flagPath});

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
        },
      ),
    );
  }
}
