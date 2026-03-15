# 🇧🇫 Cuisine Burkinabè — Application Flutter

> Application mobile de recettes de cuisine traditionnelle burkinabè avec mode sombre, traduction FR/EN et informations nutritionnelles.

---

## 📱 Aperçu de l'application

```
┌─────────────────────┐   ┌─────────────────────┐   ┌─────────────────────┐
│   Page d'accueil    │   │   Accueil principal  │   │   Détail recette    │
│                     │   │                     │   │                     │
│   🍽️ Cuisine        │   │  Catégories →       │   │  [Photo recette]    │
│   Burkinabè         │   │  À la une →         │   │  Recette │ Ingr. │  │
│                     │   │  Par difficulté →   │   │  Nutrition          │
│ [Commencer]         │   │  🟢 🟡 🔴           │   │  🔥 420 kcal        │
│ [Paramètres]        │   │                     │   │  Vitamines & Sels   │
└─────────────────────┘   └─────────────────────┘   └─────────────────────┘

┌─────────────────────┐   ┌─────────────────────┐   ┌─────────────────────┐
│     Recherche       │   │  Paramètres         │   │    Nutrition        │
│                     │   │                     │   │                     │
│ 🔍 [Rechercher...]  │   │  🌙 Mode sombre     │   │  Toutes les recettes│
│                     │   │  🌐 Langue FR/EN    │   │  triées par kcal    │
│ 🍽️All 🟢Facile     │   │  ℹ️  À propos       │   │  barres macros      │
│ 🟡Moyen 🔴Difficile │   │  Aperçu du thème   │   │  vitamines badges   │
└─────────────────────┘   └─────────────────────┘   └─────────────────────┘
```

---

## ✨ Fonctionnalités

| Écran | Description |
|---|---|
| 🎬 **Splash Screen** | Page d'accueil animée avec boutons Commencer et Paramètres |
| 🏠 **Accueil** | Catégories, recettes à la une, filtres par difficulté |
| 🔍 **Recherche** | Barre de recherche + filtre Facile / Moyen / Difficile |
| 📖 **Détail Recette** | 3 onglets : Recette · Ingrédients · Nutrition |
| 📊 **Nutrition** | Toutes les recettes avec macros, vitamines, tri personnalisé |
| ⚙️ **Paramètres** | Mode sombre, langue FR↔EN, aperçu du thème |

---

## 🍽️ Recettes disponibles (17 recettes burkinabèes)

### 🥗 Entrées
- **Koosé** — Beignets de haricots blancs frits
- **Salade Avocat-Gombo** — Salade fraîche sauce citron-piment
- **Galettes de Mil Grillées** — Galettes à la poêle sèche

### 🍲 Plats Principaux
- **Tô de Mil au Gombo** — Le plat national burkinabè
- **Riz au Gras Burkinabè** — Riz à l'huile de palme avec mouton
- **Poulet Braisé au Charbon** — Poulet fermier du maquis de Ouaga
- **Sauce Arachide au Poulet** — Sauce onctueuse à la pâte d'arachide
- **Haricots Niébé en Sauce** — Haricots sauce tomate épicée
- **Babenda** — Feuilles de baobab, haricots et poisson fumé

### 🍮 Desserts
- **Koko** — Bouillie de mil sucrée au gingembre
- **Alloco** — Banane plantain frite caramélisée
- **Gâteau de Niébé au Miel** — Gâteau moelleux nappé de miel

### 🍜 Soupes & Sauces
- **Soupe au Moringa** — Soupe légère aux légumes et feuilles de moringa
- **Sauce Gombo au Poisson Fumé** — Sauce onctueuse et filante

### 🥤 Boissons
- **Jus de Tamarin** — Boisson aigre-douce rafraîchissante
- **Bissap Rouge** — Infusion d'hibiscus à la menthe
- **Dolo** — Bière de sorgho traditionnelle

---

## 🚀 Installation et lancement

### Prérequis

- [Flutter SDK](https://docs.flutter.dev/get-started/install) ≥ 3.0.0
- Dart ≥ 3.0.0
- Android Studio ou VS Code
- Un émulateur Android/iOS ou un téléphone physique

### Étapes

```bash
# 1. Cloner ou décompresser le projet
cd app_v3

# 2. Vérifier l'environnement Flutter
flutter doctor

# 3. Installer les dépendances
flutter pub get

# 4. Lancer l'application
flutter run

# 5. Build APK Android (release)
flutter build apk --release
# → Le fichier APK sera dans : build/app/outputs/flutter-apk/app-release.apk

# 6. Build iOS (Mac requis)
flutter build ios --release
```

---

## 🖼️ Ajouter vos propres photos

### Étape 1 — Placez vos images dans le dossier `assets/images/`

```
app_v3/
└── assets/
    └── images/
        ├── koose.jpg               ← Beignets de haricots
        ├── salade_avocat_gombo.jpg ← Salade avocat-gombo
        ├── galettes_mil.jpg        ← Galettes de mil
        ├── to_mil_gombo.jpg        ← Tô de mil au gombo
        ├── riz_gras.jpg            ← Riz au gras
        ├── poulet_braise.jpg       ← Poulet braisé
        ├── sauce_arachide.jpg      ← Sauce arachide
        ├── haricots_sauce.jpg      ← Haricots niébé
        ├── babenda.jpg             ← Babenda
        ├── koko.jpg                ← Bouillie koko
        ├── alloco.jpg              ← Alloco
        ├── gateau_niebe.jpg        ← Gâteau de niébé
        ├── soupe_moringa.jpg       ← Soupe moringa
        ├── sauce_gombo.jpg         ← Sauce gombo
        ├── jus_tamarin.jpg         ← Jus de tamarin
        ├── bissap.jpg              ← Bissap rouge
        └── dolo.jpg                ← Dolo
```

> ✅ **Si une image est absente**, l'application affiche automatiquement une icône de remplacement — aucune erreur, aucun crash.

### Conseils pour les photos

| Critère | Recommandation |
|---|---|
| Format | JPG ou PNG |
| Taille | 800×600 px minimum |
| Ratio | 4:3 ou 16:9 |
| Poids | < 500 Ko par image (pour les performances) |

---

## ➕ Ajouter une nouvelle recette

Dans `lib/models/recipe_data.dart`, ajoutez un objet `Recipe` dans la liste `_recipes` :

```dart
Recipe(
  id: 'p7',                                    // ID unique
  category: 'plats',                           // entrees | plats | desserts | soupes | boissons
  name: 'Mon Nouveau Plat',                    // Nom en français
  nameEn: 'My New Dish',                       // Nom en anglais
  description: 'Description en français...',
  descriptionEn: 'Description in English...',
  imagePath: 'assets/images/mon_plat.jpg',
  prepTime: 20,                                // minutes
  cookTime: 45,                                // minutes
  servings: 4,
  difficulty: 'Moyen',                         // Facile | Moyen | Difficile
  ingredients: ['500 g viande', '2 oignons'],
  ingredientsEn: ['500 g meat', '2 onions'],
  steps: ['Étape 1 : ...', 'Étape 2 : ...'],
  stepsEn: ['Step 1: ...', 'Step 2: ...'],
  nutrition: NutritionInfo(
    calories: 350,
    proteines: 20.0,
    glucides: 45.0,
    lipides: 10.0,
    fibres: 5.0,
    vitamines: {'Vitamine C': '30 mg', 'Fer': '3 mg'},
  ),
),
```

---

## ➕ Ajouter une nouvelle catégorie

Dans `lib/models/recipe_data.dart`, dans la liste `categories` :

```dart
Category(
  id: 'grillades',
  name: 'Grillades',
  nameEn: 'Grills',
  icon: '🔥',
  color: 'FF6F00',   // Couleur hex SANS le #
),
```

---

## 🌙 Mode sombre

Le mode sombre est géré par `AppProvider` et s'adapte automatiquement à tous les écrans. Les couleurs utilisées :

| Élément | Mode clair | Mode sombre |
|---|---|---|
| Fond principal | `#FDF6F0` | `#121212` |
| Cartes | `#FFFFFF` | `#1E1E1E` |
| Texte principal | `#1A1A1A` | `#F0F0F0` |
| Texte secondaire | `#757575` | `#9E9E9E` |
| Accent | `#BF4A0A` | `#BF4A0A` |
| AppBar sombre | — | `#1A0A00` |

---

## 🌐 Traduction FR / EN

Chaque texte de l'interface utilise la méthode `app.t('Français', 'English')`.  
Les recettes ont des champs bilingues (`name`/`nameEn`, `description`/`descriptionEn`, etc.).

Pour ajouter un texte traduit dans un nouveau widget :

```dart
final app = context.watch<AppProvider>();
Text(app.t('Votre texte FR', 'Your EN text'))
```

---

## 🗂️ Structure du projet

```
app_v3/
├── lib/
│   ├── main.dart                          # Point d'entrée
│   ├── models/
│   │   ├── recipe.dart                    # Modèles Recipe, Category, NutritionInfo
│   │   └── recipe_data.dart               # Toutes les données des recettes
│   ├── providers/
│   │   └── app_provider.dart              # État global : thème + langue
│   ├── screens/
│   │   ├── splash_screen.dart             # Page d'accueil animée
│   │   ├── main_navigation.dart           # Barre de navigation bottom
│   │   ├── home_screen.dart               # Accueil + écran difficulté
│   │   ├── search_screen.dart             # Recherche + filtre difficulté
│   │   ├── nutrition_screen.dart          # Tableau nutritionnel global
│   │   ├── category_recipes_screen.dart   # Recettes par catégorie
│   │   ├── recipe_detail_screen.dart      # Détail avec 3 onglets
│   │   └── settings_screen.dart           # Paramètres (thème + langue)
│   └── widgets/
│       └── shared_widgets.dart            # recipeImage() + diffBadge()
├── assets/
│   └── images/                            # Vos photos de recettes ici
└── pubspec.yaml
```

---

## 📦 Dépendances

| Package | Version | Usage |
|---|---|---|
| `flutter` | SDK | Framework principal |
| `provider` | ^6.1.1 | Gestion d'état (thème, langue) |

> **Aucune dépendance externe lourde** — l'application fonctionne entièrement hors-ligne.

---

## 🛠️ Dépannage

### L'application ne compile pas
```bash
flutter clean
flutter pub get
flutter run
```

### Les images n'apparaissent pas
- Vérifiez que le nom du fichier est **exactement** identique à `imagePath` dans `recipe_data.dart`
- Les noms de fichiers sont **sensibles à la casse** sur Android/iOS
- Le dossier `assets/images/` doit exister même vide

### Erreur "provider not found"
- Assurez-vous que `ChangeNotifierProvider` est bien au-dessus de `MaterialApp` dans `main.dart`

---

## 📄 Licence

Projet éducatif — Libre d'utilisation et de modification.

---

*Développé avec ❤️ pour valoriser la gastronomie burkinabè 🇧🇫*


final featured = RecipeData.getRecipes().take(4).toList();