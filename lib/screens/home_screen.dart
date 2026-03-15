import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/recipe.dart';
import '../models/recipe_data.dart';
import '../providers/app_provider.dart';
import '../widgets/shared_widgets.dart';
import 'category_recipes_screen.dart';
import 'recipe_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Color _hex(String h) => Color(int.parse('FF$h', radix: 16));

  @override
  Widget build(BuildContext context) {
    final app = context.watch<AppProvider>();
    final cats = RecipeData.getCategories();
    final featured = RecipeData.getFeatured();

    return Scaffold(
      backgroundColor: app.background,
      body: CustomScrollView(
        slivers: [
          // ── App Bar ─────────────────────────────────────
          SliverAppBar(
            expandedHeight: 195,
            floating: false,
            pinned: true,
            automaticallyImplyLeading: false,
            backgroundColor: app.appBarBg,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 16, bottom: 14),
              title: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    app.t('Cuisine Burkinabè', 'Burkinabe Cuisine'),
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 19),
                  ),
                  Text(
                    app.t('Saveurs du Faso 🇧🇫',
                        'Flavors of Faso 🇧🇫'),
                    style: const TextStyle(
                        color: Colors.white70, fontSize: 11),
                  ),
                ],
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: app.isDark
                        ? [
                            const Color(0xFF3A1A00),
                            const Color(0xFF1A0A00)
                          ]
                        : [app.accent, app.accentLight],
                  ),
                ),
                child: Stack(children: [
                  Positioned(
                    right: -20,
                    top: 10,
                    child: Opacity(
                        opacity: 0.1,
                        child: const Text('🍲',
                            style: TextStyle(fontSize: 140))),
                  ),
                ]),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Catégories ──────────────────────────────
                _SectionTitle(app.t('Catégories', 'Categories'), app),
                SizedBox(
                  height: 105,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: cats.length,
                    itemBuilder: (ctx, i) {
                      final c = cats[i];
                      final col = _hex(c.color);
                      return _CatChip(
                        label: c.localName(app.isEnglish),
                        icon: c.icon,
                        color: col,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                CategoryRecipesScreen(category: c),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // ── À la une ────────────────────────────────
                _SectionTitle(
                    app.t('À la une', 'Featured'), app),
                SizedBox(
                  height: 225,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: featured.length,
                    itemBuilder: (ctx, i) => _FeaturedCard(
                        recipe: featured[i], app: app),
                  ),
                ),

                // ── Par difficulté ───────────────────────────
                _SectionTitle(
                    app.t('Par difficulté', 'By Difficulty'), app),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 4),
                  child: Row(
                    children: [
                      _DiffBtn(
                        label: app.t('Facile', 'Easy'),
                        key_: 'Facile',
                        emoji: '🟢',
                        color: const Color(0xFF2E7D32),
                        app: app,
                      ),
                      const SizedBox(width: 10),
                      _DiffBtn(
                        label: app.t('Moyen', 'Medium'),
                        key_: 'Moyen',
                        emoji: '🟡',
                        color: const Color(0xFFF57F17),
                        app: app,
                      ),
                      const SizedBox(width: 10),
                      _DiffBtn(
                        label: app.t('Difficile', 'Hard'),
                        key_: 'Difficile',
                        emoji: '🔴',
                        color: const Color(0xFFC62828),
                        app: app,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _SectionTitle(String t, AppProvider app) => Padding(
      padding: const EdgeInsets.fromLTRB(16, 22, 16, 10),
      child: Text(t,
          style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: app.textPrimary)),
    );

class _CatChip extends StatelessWidget {
  final String label, icon;
  final Color color;
  final VoidCallback onTap;
  const _CatChip(
      {required this.label,
      required this.icon,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          width: 82,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: color.withOpacity(0.14),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color.withOpacity(0.35), width: 1.5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(icon, style: const TextStyle(fontSize: 30)),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(label,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: color)),
              ),
            ],
          ),
        ),
      );
}

class _FeaturedCard extends StatelessWidget {
  final Recipe recipe;
  final AppProvider app;
  const _FeaturedCard({required this.recipe, required this.app});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) =>
                    RecipeDetailScreen(recipe: recipe))),
        child: Container(
          width: 170,
          margin: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: app.surface,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                  color: app.shadowColor,
                  blurRadius: 12,
                  offset: const Offset(0, 4))
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(18)),
                child: recipeImage(recipe.imagePath, 170, 115),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(recipe.localName(app.isEnglish),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: app.textPrimary)),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        diffBadge(recipe.difficulty),
                        const Spacer(),
                        Icon(Icons.local_fire_department,
                            size: 13, color: app.accent),
                        const SizedBox(width: 2),
                        Text('${recipe.nutrition.calories}',
                            style: TextStyle(
                                fontSize: 10,
                                color: app.accent,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

class _DiffBtn extends StatelessWidget {
  final String label, key_, emoji;
  final Color color;
  final AppProvider app;
  const _DiffBtn(
      {required this.label,
      required this.key_,
      required this.emoji,
      required this.color,
      required this.app});

  @override
  Widget build(BuildContext context) => Expanded(
        child: GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) =>
                      DifficultyScreen(difficulty: key_))),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: color.withOpacity(app.isDark ? 0.2 : 0.1),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: color.withOpacity(0.4)),
            ),
            child: Column(
              children: [
                Text(emoji, style: const TextStyle(fontSize: 22)),
                const SizedBox(height: 4),
                Text(label,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: color)),
              ],
            ),
          ),
        ),
      );
}

// ── Difficulty Screen ─────────────────────────────────────────────────────
class DifficultyScreen extends StatelessWidget {
  final String difficulty;
  const DifficultyScreen({super.key, required this.difficulty});

  Color get _color {
    switch (difficulty) {
      case 'Facile':
        return const Color(0xFF2E7D32);
      case 'Moyen':
        return const Color(0xFFF57F17);
      default:
        return const Color(0xFFC62828);
    }
  }

  @override
  Widget build(BuildContext context) {
    final app = context.watch<AppProvider>();
    final recipes = RecipeData.getRecipesByDifficulty(difficulty);

    return Scaffold(
      backgroundColor: app.background,
      appBar: AppBar(
        backgroundColor: _color,
        title: Text(
          '${app.t("Recettes", "Recipes")} $difficulty',
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: recipes.isEmpty
          ? Center(
              child: Text(app.t('Aucune recette.', 'No recipes found.'),
                  style: TextStyle(color: app.textSecondary)))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: recipes.length,
              itemBuilder: (ctx, i) => _RecipeTile(
                  recipe: recipes[i], color: _color, app: app),
            ),
    );
  }
}

class _RecipeTile extends StatelessWidget {
  final Recipe recipe;
  final Color color;
  final AppProvider app;
  const _RecipeTile(
      {required this.recipe, required this.color, required this.app});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(
                builder: (_) =>
                    RecipeDetailScreen(recipe: recipe))),
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: app.surface,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(color: app.shadowColor, blurRadius: 8)
            ],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(14)),
                child: recipeImage(recipe.imagePath, 100, 100),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(recipe.localName(app.isEnglish),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: app.textPrimary)),
                      const SizedBox(height: 4),
                      Text(recipe.localDesc(app.isEnglish),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: app.textSecondary,
                              fontSize: 12)),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(Icons.timer_outlined,
                              size: 12, color: color),
                          const SizedBox(width: 3),
                          Text(
                              '${recipe.prepTime + recipe.cookTime} min',
                              style: TextStyle(
                                  fontSize: 11, color: color)),
                          const SizedBox(width: 12),
                          Icon(Icons.local_fire_department,
                              size: 12, color: color),
                          const SizedBox(width: 3),
                          Text(
                              '${recipe.nutrition.calories} kcal',
                              style: TextStyle(
                                  fontSize: 11, color: color)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
