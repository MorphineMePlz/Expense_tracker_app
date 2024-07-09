import 'package:expense_tracker_app/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 99, 59, 181));

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: kColorScheme.primaryContainer),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kColorScheme.primaryContainer)),
        textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: kColorScheme.onSecondaryContainer))),
    debugShowCheckedModeBanner: false,
    home: const Expenses(),
  ));
}
