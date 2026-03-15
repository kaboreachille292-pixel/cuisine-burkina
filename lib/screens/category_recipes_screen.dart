import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/recipe.dart';
import '../models/recipe_data.dart';
import '../providers/app_provider.dart';
import '../widgets/shared_widgets.dart';
import 'recipe_detail_screen.dart';

class CategoryRecipesScreen extends StatelessWidget {
  final Category category;
  const CategoryRecipesScreen({super.key, required this.category});

  Color _hex(String h) => Color(int.parse('FF$h', radix: 16));

  @override
  Widget build(BuildContext context) {
    final app = context.watch<AppProvider>();
    final recipes = RecipeData.getRecipesByCategory(category.id);
    final color = _hex(category.color);

    return Scaffold(
      backgroundColor: app.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150,
            pinned: true,
            backgroundColor: color,
            leading: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: Colors.black26, shape: BoxShape.circle),
                child: const Icon(Icons.arrow_back,
                    color: Colors.white, size: 20),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(category.localName(app.isEnglish),
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [color, color.withOpacity(0.7)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Text(category.icon,
                      style: const TextStyle(fontSize: 60)),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                '${recipes.length} ${app.t("recette(s)", "recipe(s)")}',
                style: TextStyle(
                    color: app.textSecondary, fontSize: 13),
              ),
            ),
          ),

          recipes.isEmpty
              ? SliverFillRemaining(
                  child: Center(
                    child: Text(
                      app.t('Aucune recette.', 'No recipes.'),
                      style: TextStyle(
                          color: app.textSecondary, fontSize: 16),
                    ),
                  ),
                )
              : SliverPadding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.75,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (ctx, i) => _GridCard(
                          recipe: recipes[i],
                          accentColor: color,
                          app: app),
                      childCount: recipes.length,
                    ),
                  ),
                ),

          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}

class _GridCard extends StatelessWidget {
  final Recipe recipe;
  final Color accentColor;
  final AppProvider app;
  const _GridCard(
      {required this.recipe,
      required this.accentColor,
      required this.app});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) =>
                    RecipeDetailScreen(recipe: recipe))),
        child: Container(
          decoration: BoxDecoration(
            color: app.surface,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                  color: app.shadowColor, blurRadius: 10)
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16)),
                  child: recipeImage(
                      recipe.imagePath, double.infinity, null),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
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
                      const Spacer(),
                      Row(
                        children: [
                          diffBadge(recipe.difficulty),
                          const Spacer(),
                          Icon(Icons.local_fire_department,
                              size: 12, color: accentColor),
                          const SizedBox(width: 2),
                          Text('${recipe.nutrition.calories}',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: accentColor,
                                  fontWeight: FontWeight.bold)),
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
