// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:cuisine_burkina/main.dart';
import 'package:cuisine_burkina/providers/app_provider.dart';

void main() {
  testWidgets('Test de chargement CuisineApp', (WidgetTester tester) async {
    // On doit envelopper l'app dans un Provider comme dans le main.dart
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => AppProvider(),
        child: const CuisineApp(),
      ),
    );

    // On attend que le SplashScreen ou la page d'accueil se charge
    await tester.pump();

    // Vérifie que l'application a bien démarré
    expect(find.byType(CuisineApp), findsOneWidget);
  });
}