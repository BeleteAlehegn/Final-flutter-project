class Language {
  final int id;
  final String name;
  final String flag;
  final String languageCode;
  Language(this.id, this.name, this.flag, this.languageCode);
  static List<Language> languagelist() {
    return <Language>[
      Language(1, '🇪🇹', 'አማርኛ', 'am'),
      Language(2, '🇺🇸', 'English', 'en'),
      Language(3, '🇪🇹', 'Oromiffa', 'hi'),
    ];
  }
}
