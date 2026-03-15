// ════════════════════════════════════════════════════════════════════
//  FICHIER : lib/screens/main_navigation.dart
//  ACTION  : Remplacez ENTIÈREMENT votre fichier main_navigation.dart
//            par ce contenu (ajoute l'onglet 📖 Dictionnaire)
// ════════════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import 'home_screen.dart';
import 'search_screen.dart';
import 'nutrition_screen.dart';
import 'dictionary_screen.dart';
import 'settings_screen.dart';
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});
  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _idx = 0;

  static const _pages = [
    HomeScreen(),
    SearchScreen(),
    NutritionScreen(),
    DictionaryScreen(),             // ← NOUVEAU (index 3)
  ];

  @override
  Widget build(BuildContext context) {
    final app = context.watch<AppProvider>();

    return Scaffold(
      body: IndexedStack(index: _idx, children: _pages),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: app.surface,
          boxShadow: [BoxShadow(color: app.shadowColor, blurRadius: 20, offset: const Offset(0, -4))],
        ),
        child: SafeArea(
          child: SizedBox(
            height: 64,
            child: Row(children: [
              _NavItem(icon: Icons.home_rounded,         label: app.t('Accueil','Home'),       idx: 0, cur: _idx, set: (i) => setState(()=>_idx=i), app: app),
              _NavItem(icon: Icons.search_rounded,       label: app.t('Recherche','Search'),   idx: 1, cur: _idx, set: (i) => setState(()=>_idx=i), app: app),
              _NavItem(icon: Icons.monitor_heart_outlined,label: app.t('Nutrition','Nutrition'),idx: 2, cur: _idx, set: (i) => setState(()=>_idx=i), app: app),
              _NavItem(icon: Icons.menu_book_rounded,    label: app.t('Dico','Dictionary'),    idx: 3, cur: _idx, set: (i) => setState(()=>_idx=i), app: app),
              // Paramètres (ouvre une nouvelle page, pas dans IndexedStack)
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen())),
                  behavior: HitTestBehavior.opaque,
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Icon(Icons.settings_outlined, size: 21, color: app.textSecondary),
                    const SizedBox(height: 2),
                    Text(app.t('Réglages','Settings'),
                        style: TextStyle(fontSize: 8.5, fontWeight: FontWeight.w400, color: app.textSecondary)),
                  ]),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int idx, cur;
  final void Function(int) set;
  final AppProvider app;
  const _NavItem({required this.icon, required this.label, required this.idx, required this.cur, required this.set, required this.app});

  @override
  Widget build(BuildContext context) {
    final sel = idx == cur;
    return Expanded(
      child: GestureDetector(
        onTap: () => set(idx),
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 6),
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: sel ? app.accent.withOpacity(0.12) : Colors.transparent,
            borderRadius: BorderRadius.circular(11),
          ),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(icon, size: 21, color: sel ? app.accent : app.textSecondary),
            const SizedBox(height: 2),
            Text(label, style: TextStyle(
                fontSize: 8.5,
                fontWeight: sel ? FontWeight.w800 : FontWeight.w400,
                color: sel ? app.accent : app.textSecondary)),
          ]),
        ),
      ),
    );
  }
}
