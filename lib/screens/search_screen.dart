import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/recipe.dart';
import '../models/recipe_data.dart';
import '../providers/app_provider.dart';
import '../widgets/shared_widgets.dart';
import 'recipe_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _ctrl = TextEditingController();
  String _query = '';
  String? _diff; // null = tous
  List<Recipe> _results = [];

  @override
  void initState() {
    super.initState();
    _results = RecipeData.getRecipes();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _search(AppProvider app) {
    setState(() {
      _results = RecipeData.search(_query, _diff, app.isEnglish);
    });
  }

  @override
  Widget build(BuildContext context) {
    final app = context.watch<AppProvider>();

    return Scaffold(
      backgroundColor: app.background,
      body: Column(
        children: [
          // ── Header orange ─────────────────────────────────
          Container(
            color: app.appBarBg,
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(app.t('Recherche', 'Search'),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),

                    // ── Barre de recherche texte ──────────────
                    TextField(
                      controller: _ctrl,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      onChanged: (v) {
                        _query = v;
                        _search(app);
                      },
                      decoration: InputDecoration(
                        hintText: app.t(
                            'Plat, ingrédient, recette...',
                            'Dish, ingredient, recipe...'),
                        hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.6)),
                        prefixIcon: const Icon(Icons.search,
                            color: Colors.white70),
                        suffixIcon: _ctrl.text.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear,
                                    color: Colors.white70),
                                onPressed: () {
                                  _ctrl.clear();
                                  _query = '';
                                  _search(app);
                                },
                              )
                            : null,
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.18),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ── Filtre difficulté ─────────────────────────────
          Container(
            color: app.surface,
            padding: const EdgeInsets.symmetric(
                horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(app.t('Filtrer par difficulté', 'Filter by difficulty'),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: app.textSecondary)),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _FilterChip(
                        label: app.t('Tous', 'All'),
                        emoji: '🍽️',
                        isSelected: _diff == null,
                        color: const Color(0xFF607D8B),
                        onTap: () {
                          _diff = null;
                          _search(app);
                        },
                      ),
                      const SizedBox(width: 8),
                      _FilterChip(
                        label: app.t('Facile', 'Easy'),
                        emoji: '🟢',
                        isSelected: _diff == 'Facile',
                        color: const Color(0xFF2E7D32),
                        onTap: () {
                          _diff = 'Facile';
                          _search(app);
                        },
                      ),
                      const SizedBox(width: 8),
                      _FilterChip(
                        label: app.t('Moyen', 'Medium'),
                        emoji: '🟡',
                        isSelected: _diff == 'Moyen',
                        color: const Color(0xFFF57F17),
                        onTap: () {
                          _diff = 'Moyen';
                          _search(app);
                        },
                      ),
                      const SizedBox(width: 8),
                      _FilterChip(
                        label: app.t('Difficile', 'Hard'),
                        emoji: '🔴',
                        isSelected: _diff == 'Difficile',
                        color: const Color(0xFFC62828),
                        onTap: () {
                          _diff = 'Difficile';
                          _search(app);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Divider(height: 1, color: app.dividerColor),

          // ── Résultats ─────────────────────────────────────
          Expanded(
            child: _results.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('🔍',
                            style: TextStyle(fontSize: 56)),
                        const SizedBox(height: 12),
                        Text(
                          app.t('Aucun résultat.',
                              'No results found.'),
                          style: TextStyle(
                              color: app.textSecondary,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Text(
                              '${_results.length} ${app.t("recette(s)", "recipe(s)")}',
                              style: TextStyle(
                                  color: app.textSecondary,
                                  fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16),
                          itemCount: _results.length,
                          itemBuilder: (ctx, i) =>
                              _ResultCard(
                                  recipe: _results[i], app: app),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label, emoji;
  final bool isSelected;
  final Color color;
  final VoidCallback onTap;
  const _FilterChip(
      {required this.label,
      required this.emoji,
      required this.isSelected,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color:
                isSelected ? color : color.withOpacity(0.08),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: isSelected
                    ? color
                    : color.withOpacity(0.3),
                width: 1.5),
          ),
          child: Text(
            '$emoji $label',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color:
                    isSelected ? Colors.white : color),
          ),
        ),
      );
}

class _ResultCard extends StatelessWidget {
  final Recipe recipe;
  final AppProvider app;
  const _ResultCard({required this.recipe, required this.app});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => Navigator.push(
            context,
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
                child: recipeImage(recipe.imagePath, 90, 90),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                                recipe.localName(app.isEnglish),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: app.textPrimary)),
                          ),
                          diffBadge(recipe.difficulty),
                        ],
                      ),
                      const SizedBox(height: 3),
                      Text(recipe.localDesc(app.isEnglish),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: app.textSecondary,
                              fontSize: 11)),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(Icons.timer_outlined,
                              size: 12,
                              color: app.accent),
                          const SizedBox(width: 3),
                          Text(
                              '${recipe.prepTime + recipe.cookTime} min',
                              style: TextStyle(
                                  fontSize: 11,
                                  color: app.accent)),
                          const SizedBox(width: 10),
                          Icon(Icons.local_fire_department,
                              size: 12,
                              color: app.accent),
                          const SizedBox(width: 3),
                          Text(
                              '${recipe.nutrition.calories} kcal',
                              style: TextStyle(
                                  fontSize: 11,
                                  color: app.accent)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Icon(Icons.chevron_right,
                    color: app.textSecondary),
              ),
            ],
          ),
        ),
      );
}
