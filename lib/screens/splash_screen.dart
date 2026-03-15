import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import 'main_navigation.dart';
import 'settings_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _fade;
  late Animation<double> _slide;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1100));
    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeIn);
    _slide = Tween<double>(begin: 40, end: 0)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));
    _scale = Tween<double>(begin: 0.65, end: 1)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.elasticOut));
    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _enter() => Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (_, __, ___) => const MainNavigation(),
          transitionsBuilder: (_, anim, __, child) =>
              FadeTransition(opacity: anim, child: child),
        ),
      );

  void _settings() => Navigator.push(
      context, MaterialPageRoute(builder: (_) => const SettingsScreen()));

  @override
  Widget build(BuildContext context) {
    final app = context.watch<AppProvider>();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: app.isDark
                ? [const Color(0xFF2A1000), const Color(0xFF121212)]
                : [const Color(0xFFBF4A0A), const Color(0xFFE8A030)],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Décoration flottante
              Positioned(
                top: -40,
                right: -50,
                child: Opacity(
                  opacity: 0.07,
                  child: Text('🍲',
                      style: TextStyle(fontSize: size.width * 0.65)),
                ),
              ),
              Positioned(
                bottom: 100,
                left: -40,
                child: Opacity(
                  opacity: 0.06,
                  child: Text('🥘',
                      style: TextStyle(fontSize: size.width * 0.45)),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.1),

                    // ── Logo animé ───────────────────────────
                    AnimatedBuilder(
                      animation: _ctrl,
                      builder: (_, __) => Transform.scale(
                        scale: _scale.value,
                        child: FadeTransition(
                          opacity: _fade,
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.4),
                                  width: 2),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 30,
                                    offset: const Offset(0, 10)),
                              ],
                            ),
                            child: const Center(
                                child: Text('🍽️',
                                    style: TextStyle(fontSize: 56))),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * 0.04),

                    // ── Titre ────────────────────────────────
                    AnimatedBuilder(
                      animation: _ctrl,
                      builder: (_, __) => FadeTransition(
                        opacity: _fade,
                        child: Transform.translate(
                          offset: Offset(0, _slide.value),
                          child: Column(
                            children: [
                              Text(
                                app.t('Cuisine Burkinabè',
                                    'Burkinabe Cuisine'),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 34,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 0.4,
                                    height: 1.1),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                app.t(
                                  'Découvrez les saveurs\nauthentiques du Faso 🇧🇫',
                                  'Discover the authentic\nflavors of Burkina Faso 🇧🇫',
                                ),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.85),
                                    fontSize: 16,
                                    height: 1.5),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * 0.04),

                    // ── Badges catégories ────────────────────
                    AnimatedBuilder(
                      animation: _ctrl,
                      builder: (_, __) => FadeTransition(
                        opacity: _fade,
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 10,
                          runSpacing: 8,
                          children: [
                            app.t('🥗 Entrées', '🥗 Starters'),
                            app.t('🍲 Plats', '🍲 Mains'),
                            app.t('🍮 Desserts', '🍮 Desserts'),
                            app.t('🍜 Soupes', '🍜 Soups'),
                            app.t('🥤 Boissons', '🥤 Drinks'),
                          ]
                              .map((label) => Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 8),
                                    decoration: BoxDecoration(
                                      color:
                                          Colors.white.withOpacity(0.15),
                                      borderRadius:
                                          BorderRadius.circular(20),
                                      border: Border.all(
                                          color: Colors.white
                                              .withOpacity(0.3)),
                                    ),
                                    child: Text(label,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight:
                                                FontWeight.w600)),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),

                    const Spacer(),

                    // ── Boutons ──────────────────────────────
                    AnimatedBuilder(
                      animation: _ctrl,
                      builder: (_, __) => FadeTransition(
                        opacity: _fade,
                        child: Column(
                          children: [
                            // Bouton principal
                            SizedBox(
                              width: double.infinity,
                              height: 58,
                              child: ElevatedButton(
                                onPressed: _enter,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor:
                                      const Color(0xFFBF4A0A),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(18)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      app.t('Commencer à cuisiner',
                                          'Start Cooking'),
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(width: 8),
                                    const Icon(
                                        Icons.arrow_forward_rounded,
                                        size: 20),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(height: 14),

                            // Bouton paramètres
                            SizedBox(
                              width: double.infinity,
                              height: 52,
                              child: OutlinedButton(
                                onPressed: _settings,
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  side: BorderSide(
                                      color:
                                          Colors.white.withOpacity(0.65),
                                      width: 1.5),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(18)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                        Icons.settings_outlined,
                                        size: 20),
                                    const SizedBox(width: 8),
                                    Text(
                                      app.t('Paramètres', 'Settings'),
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(height: 32),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
