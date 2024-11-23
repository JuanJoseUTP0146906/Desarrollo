import 'dart:ui';

enum Language { english, spanish, german, french, italian, chinese }

extension LanguageExtension on Language {
  String get locale {
    switch (this) {
      case Language.english:
        return 'en';
      case Language.spanish:
        return 'es';
      case Language.german:
        return 'de';
      case Language.french:
        return 'fr';
      case Language.italian:
        return 'it';
      case Language.chinese:
        return 'zh';
      default:
        return 'en';
    }
  }

  String get name {
    switch (this) {
      case Language.english:
        return 'English';
      case Language.spanish:
        return 'Español';
      case Language.german:
        return 'Deutsch';
      case Language.french:
        return 'Français';
      case Language.italian:
        return 'Italiano';
      case Language.chinese:
        return '中文';
      default:
        return 'English';
    }
  }

  String get flag {
    switch (this) {
      case Language.english:
        return '🇺🇸';
      case Language.spanish:
        return '🇪🇸';
      case Language.german:
        return '🇩🇪';
      case Language.french:
        return '🇫🇷';
      case Language.italian:
        return '🇮🇹';
      case Language.chinese:
        return '🇨🇳';
      default:
        return '🇺🇸';
    }
  }

  Locale get localeValue {
    switch (this) {
      case Language.english:
        return const Locale('en', "US");
      case Language.spanish:
        return const Locale('es', "ES");
      case Language.german:
        return const Locale('de', "DE");
      case Language.french:
        return const Locale('fr', "FR");
      case Language.italian:
        return const Locale('it', "IT");
      case Language.chinese:
        return const Locale('zh', "CN");
      default:
        return const Locale('en', "US");
    }
  }
}
