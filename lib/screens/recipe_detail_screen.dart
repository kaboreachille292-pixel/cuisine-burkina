import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/recipe.dart';
import '../providers/app_provider.dart';
import '../widgets/shared_widgets.dart';

class RecipeDetailScreen extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetailScreen({super.key, required this.recipe});
  @override
  State<RecipeDetailScreen> createState() => _State();
}

class _State extends State<RecipeDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final app = context.watch<AppProvider>();
    final r = widget.recipe;

    return Scaffold(
      backgroundColor: app.background,
      body: NestedScrollView(
        headerSliverBuilder: (ctx, _) => [
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            backgroundColor: app.appBarBg,
            leading: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: Colors.black38, shape: BoxShape.circle),
                child: const Icon(Icons.arrow_back,
                    color: Colors.white, size: 20),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(fit: StackFit.expand, children: [
                recipeImage(r.imagePath, null, null),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.65)
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      diffBadge(r.difficulty),
                      const SizedBox(height: 8),
                      Text(r.localName(app.isEnglish),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              height: 1.2)),
                    ],
                  ),
                ),
              ]),
            ),
            bottom: TabBar(
              controller: _tabs,
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white60,
              labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 13),
              tabs: [
                Tab(text: app.t('Recette', 'Recipe')),
                Tab(text: app.t('Ingrédients', 'Ingredients')),
                Tab(text: '🥗 Nutrition'),
              ],
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabs,
          children: [
            _RecipeTab(recipe: r, app: app),
            _IngredientsTab(recipe: r, app: app),
            _NutritionTab(recipe: r, app: app),
          ],
        ),
      ),
    );
  }
}

// ── Stats bar ─────────────────────────────────────────────────────────────
class _StatsBar extends StatelessWidget {
  final Recipe recipe;
  final AppProvider app;
  const _StatsBar({required this.recipe, required this.app});

  Widget _s(IconData ic, String label, String val) => Column(
        children: [
          Icon(ic, color: app.accent, size: 20),
          const SizedBox(height: 3),
          Text(val,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: app.textPrimary)),
          Text(label,
              style: TextStyle(
                  fontSize: 10, color: app.textSecondary)),
        ],
      );

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.all(16),
        padding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        decoration: BoxDecoration(
          color: app.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: app.shadowColor, blurRadius: 10)
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _s(Icons.access_time,
                app.t('Préparation', 'Prep'),
                '${recipe.prepTime} min'),
            Container(
                width: 1, height: 36, color: app.dividerColor),
            _s(Icons.local_fire_department,
                app.t('Cuisson', 'Cook'),
                '${recipe.cookTime} min'),
            Container(
                width: 1, height: 36, color: app.dividerColor),
            _s(Icons.people_outline,
                app.t('Portions', 'Serves'),
                '${recipe.servings}'),
            Container(
                width: 1, height: 36, color: app.dividerColor),
            _s(Icons.local_fire_department_outlined,
                app.t('Calories', 'Calories'),
                '${recipe.nutrition.calories}'),
          ],
        ),
      );
}

// ── Recipe Tab ────────────────────────────────────────────────────────────
class _RecipeTab extends StatelessWidget {
  final Recipe recipe;
  final AppProvider app;
  const _RecipeTab({required this.recipe, required this.app});

  @override
  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.zero,
        children: [
          _StatsBar(recipe: recipe, app: app),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(recipe.localDesc(app.isEnglish),
                    style: TextStyle(
                        fontSize: 14,
                        color: app.textSecondary,
                        height: 1.6)),
                const SizedBox(height: 20),
                Text(
                  app.t('👨‍🍳 Étapes de préparation',
                      '👨‍🍳 Preparation Steps'),
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: app.textPrimary),
                ),
                const SizedBox(height: 12),
                ...List.generate(
                  recipe.localSteps(app.isEnglish).length,
                  (i) => Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: app.surface,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                          color: app.cardBorder, width: 1),
                    ),
                    child: Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: app.accent,
                              shape: BoxShape.circle),
                          child: Center(
                            child: Text('${i + 1}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14)),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            recipe.localSteps(app.isEnglish)[i],
                            style: TextStyle(
                                fontSize: 14,
                                height: 1.5,
                                color: app.textPrimary),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}

// ── Ingredients Tab ───────────────────────────────────────────────────────
class _IngredientsTab extends StatelessWidget {
  final Recipe recipe;
  final AppProvider app;
  const _IngredientsTab({required this.recipe, required this.app});

  @override
  Widget build(BuildContext context) {
    final ings = recipe.localIngredients(app.isEnglish);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: app.accent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: app.accent.withOpacity(0.3)),
              ),
              child: Text(
                '${ings.length} ${app.t("ingrédients", "ingredients")}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: app.accent),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...ings.map(
          (ing) => Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.symmetric(
                vertical: 12, horizontal: 14),
            decoration: BoxDecoration(
              color: app.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: app.cardBorder),
            ),
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                      color: app.accent,
                      shape: BoxShape.circle),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(ing,
                      style: TextStyle(
                          fontSize: 14,
                          color: app.textPrimary)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ── Nutrition Tab ─────────────────────────────────────────────────────────
class _NutritionTab extends StatelessWidget {
  final Recipe recipe;
  final AppProvider app;
  const _NutritionTab({required this.recipe, required this.app});

  @override
  Widget build(BuildContext context) {
    final n = recipe.nutrition;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Calories card
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [app.accent, app.accentLight],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              const Text('🔥',
                  style: TextStyle(fontSize: 40)),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${n.calories} kcal',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold)),
                  Text(
                    app.t('par portion', 'per serving'),
                    style: const TextStyle(
                        color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        Text(app.t('Macronutriments', 'Macronutrients'),
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: app.textPrimary)),
        const SizedBox(height: 10),

        _MacroBar(app.t('Protéines', 'Proteins'), n.proteines, 50,
            const Color(0xFF1565C0), app),
        _MacroBar(app.t('Glucides', 'Carbs'), n.glucides, 300,
            const Color(0xFF2E7D32), app),
        _MacroBar(app.t('Lipides', 'Fat'), n.lipides, 65,
            const Color(0xFFF57F17), app),
        _MacroBar(app.t('Fibres', 'Fiber'), n.fibres, 30,
            const Color(0xFF6A1B9A), app),

        const SizedBox(height: 20),

        Text(app.t('Vitamines & Minéraux', 'Vitamins & Minerals'),
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: app.textPrimary)),
        const SizedBox(height: 10),

        ...n.vitamines.entries.map(
          (e) => Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.symmetric(
                vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: app.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: app.cardBorder),
            ),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: app.accent.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                          child: Text('💊',
                              style: TextStyle(fontSize: 16))),
                    ),
                    const SizedBox(width: 10),
                    Text(e.key,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: app.textPrimary)),
                  ],
                ),
                Text(e.value,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: app.accent)),
              ],
            ),
          ),
        ),

        const SizedBox(height: 12),

        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: app.isDark
                ? const Color(0xFF2A2000)
                : const Color(0xFFFFF8E1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: app.isDark
                  ? const Color(0xFF4A3800)
                  : const Color(0xFFFFE082),
            ),
          ),
          child: Text(
            app.t(
              '⚠️ Valeurs estimées par portion. Peuvent varier selon la préparation.',
              '⚠️ Estimated values per serving. May vary based on preparation.',
            ),
            style: TextStyle(
                fontSize: 11,
                color: app.isDark
                    ? const Color(0xFFFFCC80)
                    : const Color(0xFF795548)),
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}

class _MacroBar extends StatelessWidget {
  final String label;
  final double value, max;
  final Color color;
  final AppProvider app;
  const _MacroBar(
      this.label, this.value, this.max, this.color, this.app);

  @override
  Widget build(BuildContext context) {
    final pct = (value / max).clamp(0.0, 1.0);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: app.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: app.cardBorder),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: app.textPrimary)),
              Text('${value.toStringAsFixed(1)} g',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: color)),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: pct,
              minHeight: 7,
              backgroundColor: color.withOpacity(0.15),
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
          const SizedBox(height: 3),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '${(pct * 100).round()}% ${app.t("AJR", "DV")}',
              style: TextStyle(
                  fontSize: 9,
                  color: color.withOpacity(0.7)),
            ),
          ),
        ],
      ),
    );
  }
}
