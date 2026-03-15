import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  bool _isDark = false;
  bool _isEnglish = false;

  bool get isDark => _isDark;
  bool get isEnglish => _isEnglish;

  void toggleDark() {
    _isDark = !_isDark;
    notifyListeners();
  }

  void toggleLanguage() {
    _isEnglish = !_isEnglish;
    notifyListeners();
  }

  // ── Traductions ────────────────────────────────────
  String t(String fr, String en) => _isEnglish ? en : fr;

  // ── Couleurs adaptées au thème ─────────────────────
  Color get background => _isDark ? const Color(0xFF121212) : const Color(0xFFFDF6F0);
  Color get surface => _isDark ? const Color(0xFF1E1E1E) : Colors.white;
  Color get surfaceVariant => _isDark ? const Color(0xFF2A2A2A) : const Color(0xFFF5EBE0);
  Color get textPrimary => _isDark ? const Color(0xFFF0F0F0) : const Color(0xFF1A1A1A);
  Color get textSecondary => _isDark ? const Color(0xFF9E9E9E) : const Color(0xFF757575);
  Color get cardBorder => _isDark ? const Color(0xFF3A3A3A) : const Color(0xFFEFDDD3);
  Color get dividerColor => _isDark ? const Color(0xFF333333) : const Color(0xFFEEEEEE);
  Color get accent => const Color(0xFFBF4A0A);
  Color get accentLight => const Color(0xFFE8861A);
  Color get shadowColor => _isDark ? Colors.black.withOpacity(0.5) : Colors.black.withOpacity(0.08);
  Color get appBarBg => _isDark ? const Color(0xFF1A0A00) : const Color(0xFFBF4A0A);

  ThemeData get theme => _isDark ? _darkTheme : _lightTheme;

  ThemeData get _lightTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFBF4A0A), brightness: Brightness.light),
        scaffoldBackgroundColor: const Color(0xFFFDF6F0),
        cardColor: Colors.white,
      );

  ThemeData get _darkTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFBF4A0A), brightness: Brightness.dark),
        scaffoldBackgroundColor: const Color(0xFF121212),
        cardColor: const Color(0xFF1E1E1E),
      );
}
