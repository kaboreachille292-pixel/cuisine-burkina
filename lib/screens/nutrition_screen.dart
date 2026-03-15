import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/recipe.dart';
import '../models/recipe_data.dart';
import '../providers/app_provider.dart';
import '../widgets/shared_widgets.dart';
import 'recipe_detail_screen.dart';

class NutritionScreen extends StatefulWidget {
  const NutritionScreen({super.key});
  @override
  State<NutritionScreen> createState() => _NutritionScreenState();
}

class _NutritionScreenState extends State<NutritionScreen> {
  String _sort = 'cal_asc';

  List<Recipe> _sorted() {
    final all = List<Recipe>.from(RecipeData.getRecipes());
    switch (_sort) {
      case 'cal_asc':
        all.sort((a, b) =>
            a.nutrition.calories.compareTo(b.nutrition.calories));
      case 'cal_desc':
        all.sort((a, b) =>
            b.nutrition.calories.compareTo(a.nutrition.calories));
      case 'prot':
        all.sort((a, b) =>
            b.nutrition.proteines.compareTo(a.nutrition.proteines));
      case 'fibres':
        all.sort((a, b) =>
            b.nutrition.fibres.compareTo(a.nutrition.fibres));
    }
    return all;
  }

  @override
  Widget build(BuildContext context) {
    final app = context.watch<AppProvider>();
    final recipes = _sorted();

    return Scaffold(
      backgroundColor: app.background,
      body: Column(
        children: [
          // ── Header ──────────────────────────────────────
          Container(
            color: app.appBarBg,
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        app.t('Informations Nutritionnelles',
                            'Nutritional Information'),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    PopupMenuButton<String>(
                      icon: const Icon(Icons.sort, color: Colors.white),
                      tooltip: app.t('Trier', 'Sort'),
                      onSelected: (v) => setState(() => _sort = v),
                      itemBuilder: (_) => [
                        PopupMenuItem(
                            value: 'cal_asc',
                            child: Text(
                                app.t('Calories ↑', 'Calories ↑'))),
                        PopupMenuItem(
                            value: 'cal_desc',
                            child: Text(
                                app.t('Calories ↓', 'Calories ↓'))),
                        PopupMenuItem(
                            value: 'prot',
                            child: Text(app.t(
                                '+ Protéines', '+ Proteins'))),
                        PopupMenuItem(
                            value: 'fibres',
                            child: Text(
                                app.t('+ Fibres', '+ Fibers'))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ── Légende ─────────────────────────────────────
          Container(
            color: app.surface,
            padding: const EdgeInsets.symmetric(
                horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _Legend(
                    const Color(0xFF1565C0),
                    app.t('Prot.', 'Prot.')),
                _Legend(
                    const Color(0xFF2E7D32),
                    app.t('Gluc.', 'Carbs')),
                _Legend(
                    const Color(0xFFF57F17),
                    app.t('Lipides', 'Fat')),
                _Legend(
                    const Color(0xFF6A1B9A),
                    app.t('Fibres', 'Fiber')),
              ],
            ),
          ),

          Divider(height: 1, color: app.dividerColor),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: recipes.length,
              itemBuilder: (ctx, i) =>
                  _NutrCard(recipe: recipes[i], app: app),
            ),
          ),
        ],
      ),
    );
  }
}

class _Legend extends StatelessWidget {
  final Color color;
  final String label;
  const _Legend(this.color, this.label);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  color: color, shape: BoxShape.circle)),
          const SizedBox(width: 4),
          Text(label, style: const TextStyle(fontSize: 11)),
        ],
      );
}

class _NutrCard extends StatelessWidget {
  final Recipe recipe;
  final AppProvider app;
  const _NutrCard({required this.recipe, required this.app});

  @override
  Widget build(BuildContext context) {
    final n = recipe.nutrition;
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) =>
                  RecipeDetailScreen(recipe: recipe))),
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          color: app.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: app.shadowColor, blurRadius: 8)
          ],
        ),
        child: Column(
          children: [
            // Header
            Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16)),
                  child: recipeImage(recipe.imagePath, 80, 80),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(recipe.localName(app.isEnglish),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: app.textPrimary)),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.local_fire_department,
                                size: 14, color: app.accent),
                            const SizedBox(width: 3),
                            Text(
                                '${n.calories} kcal/${app.t("portion", "serving")}',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: app.accent)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(Icons.chevron_right,
                        color: app.textSecondary)),
              ],
            ),
            // Barres macros
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 4, 12, 10),
              child: Column(
                children: [
                  _MBar(app.t('Protéines', 'Proteins'), n.proteines,
                      50, const Color(0xFF1565C0)),
                  const SizedBox(height: 4),
                  _MBar(app.t('Glucides', 'Carbs'), n.glucides, 300,
                      const Color(0xFF2E7D32)),
                  const SizedBox(height: 4),
                  _MBar(app.t('Lipides', 'Fat'), n.lipides, 65,
                      const Color(0xFFF57F17)),
                  const SizedBox(height: 4),
                  _MBar(app.t('Fibres', 'Fiber'), n.fibres, 30,
                      const Color(0xFF6A1B9A)),
                ],
              ),
            ),
            // Vitamines
            if (n.vitamines.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: app.isDark
                      ? const Color(0xFF2A1800)
                      : const Color(0xFFFFF8F0),
                  borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(16)),
                ),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: n.vitamines.entries
                      .map((e) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: app.accent.withOpacity(0.12),
                              borderRadius:
                                  BorderRadius.circular(10),
                            ),
                            child: Text('${e.key}: ${e.value}',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: app.accent,
                                    fontWeight:
                                        FontWeight.w600)),
                          ))
                      .toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _MBar extends StatelessWidget {
  final String label;
  final double value, max;
  final Color color;
  const _MBar(this.label, this.value, this.max, this.color);

  @override
  Widget build(BuildContext context) {
    final pct = (value / max).clamp(0.0, 1.0);
    return Row(
      children: [
        SizedBox(
            width: 65,
            child: Text(label,
                style: const TextStyle(
                    fontSize: 10, color: Colors.grey))),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: LinearProgressIndicator(
              value: pct,
              minHeight: 6,
              backgroundColor: color.withOpacity(0.15),
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 42,
          child: Text('${value.toStringAsFixed(1)}g',
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: color)),
        ),
      ],
    );
  }
}
