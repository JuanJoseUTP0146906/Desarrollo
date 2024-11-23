// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Maravillas 360`
  String get tittleapp {
    return Intl.message(
      'Maravillas 360',
      name: 'tittleapp',
      desc: '',
      args: [],
    );
  }

  /// `¿A dónde Vamos?`
  String get subtitleapp {
    return Intl.message(
      '¿A dónde Vamos?',
      name: 'subtitleapp',
      desc: '',
      args: [],
    );
  }

  /// `Busca tu maravilla favorita...`
  String get search {
    return Intl.message(
      'Busca tu maravilla favorita...',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Categorías`
  String get category {
    return Intl.message(
      'Categorías',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Comidas`
  String get restaurant {
    return Intl.message(
      'Comidas',
      name: 'restaurant',
      desc: '',
      args: [],
    );
  }

  /// `Hospedajes`
  String get hotel {
    return Intl.message(
      'Hospedajes',
      name: 'hotel',
      desc: '',
      args: [],
    );
  }

  /// `Bebidas`
  String get bar {
    return Intl.message(
      'Bebidas',
      name: 'bar',
      desc: '',
      args: [],
    );
  }

  /// `Diversión`
  String get festival {
    return Intl.message(
      'Diversión',
      name: 'festival',
      desc: '',
      args: [],
    );
  }

  /// `Nadar`
  String get pool {
    return Intl.message(
      'Nadar',
      name: 'pool',
      desc: '',
      args: [],
    );
  }

  /// `Familiar`
  String get family {
    return Intl.message(
      'Familiar',
      name: 'family',
      desc: '',
      args: [],
    );
  }

  /// `Lo más popular`
  String get popular {
    return Intl.message(
      'Lo más popular',
      name: 'popular',
      desc: '',
      args: [],
    );
  }

  /// `Menú`
  String get menu {
    return Intl.message(
      'Menú',
      name: 'menu',
      desc: '',
      args: [],
    );
  }

  /// `Perfil`
  String get perfil {
    return Intl.message(
      'Perfil',
      name: 'perfil',
      desc: '',
      args: [],
    );
  }

  /// `Configuración`
  String get config {
    return Intl.message(
      'Configuración',
      name: 'config',
      desc: '',
      args: [],
    );
  }

  /// `Foro`
  String get foro {
    return Intl.message(
      'Foro',
      name: 'foro',
      desc: '',
      args: [],
    );
  }

  /// `Idiomas`
  String get language {
    return Intl.message(
      'Idiomas',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Modo oscuro`
  String get dark {
    return Intl.message(
      'Modo oscuro',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `Iniciar Sesión`
  String get sesion {
    return Intl.message(
      'Iniciar Sesión',
      name: 'sesion',
      desc: '',
      args: [],
    );
  }

  /// `Seleccionar Idioma`
  String get planguage {
    return Intl.message(
      'Seleccionar Idioma',
      name: 'planguage',
      desc: '',
      args: [],
    );
  }

  /// `Español`
  String get espanol {
    return Intl.message(
      'Español',
      name: 'espanol',
      desc: '',
      args: [],
    );
  }

  /// `Inglés`
  String get ingles {
    return Intl.message(
      'Inglés',
      name: 'ingles',
      desc: '',
      args: [],
    );
  }

  /// `Alemán`
  String get aleman {
    return Intl.message(
      'Alemán',
      name: 'aleman',
      desc: '',
      args: [],
    );
  }

  /// `Francés`
  String get frances {
    return Intl.message(
      'Francés',
      name: 'frances',
      desc: '',
      args: [],
    );
  }

  /// `Italiano`
  String get italiano {
    return Intl.message(
      'Italiano',
      name: 'italiano',
      desc: '',
      args: [],
    );
  }

  /// `Chino`
  String get chino {
    return Intl.message(
      'Chino',
      name: 'chino',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'it'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
