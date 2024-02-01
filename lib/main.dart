import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 170, 45, 45),
);

var kColorSchemeDark = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 75, 75, 75)
);

void main() {
	runApp(
	  MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kColorSchemeDark,
        cardTheme: const CardTheme().copyWith(
          color: kColorSchemeDark.onTertiary,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10)
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorSchemeDark.secondaryContainer,
            foregroundColor: kColorSchemeDark.onSecondaryContainer
          )
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          centerTitle: true,
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.onTertiary,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10)
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.onSecondaryContainer,
            foregroundColor: const Color.fromARGB(255, 255, 255, 255)
          )
        ),
        textTheme: const TextTheme().copyWith(
          titleLarge: const TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 255, 255, 255)
          ),
          titleMedium: const TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 31, 31, 31)
          ),
          bodyLarge:  const TextStyle(
            color: Color.fromARGB(255, 31, 31, 31)
          ),
          bodyMedium:  const TextStyle(
            color: Color.fromARGB(255, 31, 31, 31)
          ),
          bodySmall: const TextStyle(
            color: Color.fromARGB(255, 31, 31, 31)
          )
        ),
        
      ),
			home: const Expenses(),
		)
	);
}