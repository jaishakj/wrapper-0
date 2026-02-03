import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.dark);

class WrapperTheme {
  static ThemeData dark() {
    const primary = Color(0xFF7C3AED);
    const accent = Color(0xFF22D3EE);
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        brightness: Brightness.dark,
      ).copyWith(
        secondary: accent,
        surface: const Color(0xFF0B0B10),
      ),
      scaffoldBackgroundColor: const Color(0xFF0B0B10),
      useMaterial3: true,
      textTheme: _textTheme,
      cardTheme: const CardTheme(
        color: Color(0xFF12121A),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }

  static ThemeData light() {
    const primary = Color(0xFF7C3AED);
    const accent = Color(0xFF22D3EE);
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        brightness: Brightness.light,
      ).copyWith(secondary: accent),
      useMaterial3: true,
      textTheme: _textTheme,
      cardTheme: const CardTheme(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }

  static const TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(fontWeight: FontWeight.w700),
    displayMedium: TextStyle(fontWeight: FontWeight.w700),
    displaySmall: TextStyle(fontWeight: FontWeight.w700),
    headlineMedium: TextStyle(fontWeight: FontWeight.w600),
    headlineSmall: TextStyle(fontWeight: FontWeight.w600),
    titleLarge: TextStyle(fontWeight: FontWeight.w600),
  );
}
