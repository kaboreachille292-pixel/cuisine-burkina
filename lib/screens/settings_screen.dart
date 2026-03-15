import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final app = context.watch<AppProvider>();

    return Scaffold(
      backgroundColor: app.background,
      appBar: AppBar(
        backgroundColor: app.appBarBg,
        title: Text(app.t('Paramètres', 'Settings'),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          // ── Apparence ────────────────────────────────────
          _Section(app.t('APPARENCE', 'APPEARANCE'), app),
          const SizedBox(height: 8),

          _Tile(
            icon: app.isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
            iconColor: app.isDark
                ? const Color(0xFF7986CB)
                : const Color(0xFFFFA726),
            title: app.t('Mode sombre', 'Dark Mode'),
            subtitle: app.t(
              app.isDark ? 'Activé — thème nuit' : 'Désactivé — thème jour',
              app.isDark ? 'Enabled — night theme' : 'Disabled — day theme',
            ),
            trailing: Switch(
              value: app.isDark,
              activeColor: app.accent,
              onChanged: (_) => context.read<AppProvider>().toggleDark(),
            ),
            app: app,
          ),

          const SizedBox(height: 16),

          // ── Langue ───────────────────────────────────────
          _Section(app.t('LANGUE', 'LANGUAGE'), app),
          const SizedBox(height: 8),

          _Tile(
            icon: Icons.translate_rounded,
            iconColor: const Color(0xFF26A69A),
            title: app.t('Langue', 'Language'),
            subtitle: app.isEnglish ? '🇬🇧 English' : '🇫🇷 Français',
            trailing: Switch(
              value: app.isEnglish,
              activeColor: app.accent,
              onChanged: (_) =>
                  context.read<AppProvider>().toggleLanguage(),
            ),
            app: app,
          ),

          const SizedBox(height: 10),

          // Sélecteur rapide de langue
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: app.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: app.cardBorder),
            ),
            child: Row(
              children: [
                Expanded(
                  child: _LangBtn(
                    label: '🇫🇷 Français',
                    isActive: !app.isEnglish,
                    app: app,
                    onTap: () {
                      if (app.isEnglish) {
                        context.read<AppProvider>().toggleLanguage();
                      }
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _LangBtn(
                    label: '🇬🇧 English',
                    isActive: app.isEnglish,
                    app: app,
                    onTap: () {
                      if (!app.isEnglish) {
                        context.read<AppProvider>().toggleLanguage();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // ── À propos ─────────────────────────────────────
          _Section(app.t('À PROPOS', 'ABOUT'), app),
          const SizedBox(height: 8),

          _Tile(
            icon: Icons.info_outline_rounded,
            iconColor: const Color(0xFF42A5F5),
            title: app.t('Version', 'Version'),
            subtitle: '3.0.0',
            app: app,
          ),
          const SizedBox(height: 6),
          _Tile(
            icon: Icons.flag_outlined,
            iconColor: const Color(0xFFEF5350),
            title: app.t('Pays d\'origine', 'Country of origin'),
            subtitle: '🇧🇫 Burkina Faso',
            app: app,
          ),
          const SizedBox(height: 6),
          _Tile(
            icon: Icons.restaurant_menu_rounded,
            iconColor: app.accent,
            title: app.t('Recettes disponibles', 'Available recipes'),
            subtitle: '17',
            app: app,
          ),

          const SizedBox(height: 20),

          // ── Aperçu thème ─────────────────────────────────
          _Section(app.t('APERÇU DU THÈME', 'THEME PREVIEW'), app),
          const SizedBox(height: 8),
          _ThemePreview(app: app),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

// ── Components ─────────────────────────────────────────────────────────────

class _Section extends StatelessWidget {
  final String label;
  final AppProvider app;
  const _Section(this.label, this.app);
  @override
  Widget build(BuildContext context) => Text(label,
      style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.2,
          color: app.accent));
}

class _Tile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final AppProvider app;

  const _Tile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    this.trailing,
    required this.app,
  });

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 4),
        padding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: app.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: app.cardBorder),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: app.textPrimary)),
                  Text(subtitle,
                      style: TextStyle(
                          fontSize: 12, color: app.textSecondary)),
                ],
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
      );
}

class _LangBtn extends StatelessWidget {
  final String label;
  final bool isActive;
  final AppProvider app;
  final VoidCallback onTap;
  const _LangBtn(
      {required this.label,
      required this.isActive,
      required this.app,
      required this.onTap});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isActive ? app.accent : app.surfaceVariant,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: isActive ? app.accent : app.cardBorder),
          ),
          child: Text(label,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: isActive ? Colors.white : app.textSecondary)),
        ),
      );
}

class _ThemePreview extends StatelessWidget {
  final AppProvider app;
  const _ThemePreview({required this.app});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: app.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: app.cardBorder),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [app.accent, app.accentLight]),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                      child: Text('🍲',
                          style: TextStyle(fontSize: 28))),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        app.t('Tô de Mil au Gombo',
                            'Millet Tô with Okra'),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: app.textPrimary,
                            fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        app.t('Plat principal • Moyen',
                            'Main Course • Medium'),
                        style: TextStyle(
                            color: app.textSecondary, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _Chip('⏱ 60 min', app),
                const SizedBox(width: 8),
                _Chip('🔥 420 kcal', app),
                const SizedBox(width: 8),
                _Chip('4 🍽️', app),
              ],
            ),
          ],
        ),
      );
}

class _Chip extends StatelessWidget {
  final String label;
  final AppProvider app;
  const _Chip(this.label, this.app);

  @override
  Widget build(BuildContext context) => Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: app.accent.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: app.accent.withOpacity(0.3)),
        ),
        child: Text(label,
            style: TextStyle(
                fontSize: 11,
                color: app.accent,
                fontWeight: FontWeight.w600)),
      );
}
