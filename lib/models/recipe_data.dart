import 'recipe.dart';

class RecipeData {
  static const List<Category> categories = [
    Category(id: 'entrees',  name: 'Entrées',          nameEn: 'Starters',     icon: '🥗', color: '43A047'),
    Category(id: 'plats',    name: 'Plats Principaux', nameEn: 'Main Courses', icon: '🍲', color: 'BF4A0A'),
    Category(id: 'desserts', name: 'Desserts',          nameEn: 'Desserts',     icon: '🍮', color: 'D81B60'),
    Category(id: 'soupes',   name: 'Soupes & Sauces',  nameEn: 'Soups & Sauces', icon: '🍜', color: 'F57F17'),
    Category(id: 'boissons', name: 'Boissons',          nameEn: 'Drinks',       icon: '🥤', color: '1565C0'),
  ];

  static const List<Recipe> _recipes = [
    // ─── BENGA (Riz-Haricot) ───────────────────────────────────────────
    Recipe(
      id: 'new1', category: 'plats',
      name:        'Benga (Riz-Haricot)',
      nameEn:      'Benga (Rice and Beans)',
      description: 'Plat populaire et nourrissant associant riz et haricots niébé cuits ensemble dans une sauce tomate épicée. Économique et apprécié partout au Burkina Faso.',
      descriptionEn: 'A popular nourishing dish combining rice and black-eyed peas cooked in a spicy tomato sauce. Affordable and enjoyed all across Burkina Faso.',
      imagePath: 'assets/images/benga.jpg',
      prepTime: 15, cookTime: 60, servings: 5, difficulty: 'Facile',
      ingredients: [
        '400 g de riz brisé',
        '250 g de haricots niébé secs',
        '2 tomates fraîches',
        '2 c. soupe concentré de tomate',
        '1 oignon émincé',
        '2 c. soupe huile de palme',
        '1 cube de bouillon',
        '1 piment (selon goût)',
        'Sel, poivre',
        '1,2 litre d\'eau',
      ],
      ingredientsEn: [
        '400 g broken rice',
        '250 g dried black-eyed peas',
        '2 fresh tomatoes',
        '2 tbsp tomato paste',
        '1 sliced onion',
        '2 tbsp palm oil',
        '1 stock cube',
        '1 chili (to taste)',
        'Salt, pepper',
        '1.2 liters water',
      ],
      steps: [
        'Tremper les haricots niébé dans l\'eau froide 4 à 8 h. Égoutter et rincer.',
        'Cuire les haricots à feu moyen dans de l\'eau fraîche 40 min jusqu\'à mi-tendreté.',
        'Faire chauffer l\'huile de palme, faire revenir l\'oignon 5 min.',
        'Ajouter les tomates, le concentré, le piment et le cube. Cuire 10 min.',
        'Verser 1,2 L eau, porter à ébullition, ajouter haricots précuits et riz lavé.',
        'Couvrir, cuire à feu doux 20-25 min jusqu\'à absorption complète. Servir chaud.',
      ],
      stepsEn: [
        'Soak peas in cold water 4-8 h. Drain and rinse.',
        'Cook peas in fresh water over medium heat 40 min until half-tender.',
        'Heat palm oil, fry onion 5 min.',
        'Add tomatoes, paste, chili and stock cube. Cook 10 min.',
        'Pour in 1.2 L water, bring to boil, add pre-cooked peas and washed rice.',
        'Cover, cook on low heat 20-25 min until liquid is absorbed. Serve hot.',
      ],
      nutrition: NutritionInfo(
        calories: 395, proteines: 17.0, glucides: 68.0, lipides: 7.0, fibres: 10.5,
        vitamines: {'Fer': '5,1 mg', 'Folate': '195 µg', 'Potassium': '490 mg'},
      ),
    ),

    // ─── JUS DE GINGEMBRE ──────────────────────────────────────────────
    Recipe(
      id: 'new2', category: 'boissons',
      name:        'Jus de Gingembre Frais',
      nameEn:      'Fresh Ginger Juice',
      description: 'Boisson revigorante et épicée au gingembre frais, citron et miel. Populaire sur les marchés de Ouagadougou, réputée pour ses vertus digestives et anti-inflammatoires.',
      descriptionEn: 'Invigorating spiced drink with fresh ginger, lemon and honey. Popular in Ouagadougou markets, known for its digestive and anti-inflammatory benefits.',
      imagePath: 'assets/images/jus_gingembre.jpg',
      prepTime: 15, cookTime: 10, servings: 6, difficulty: 'Facile',
      ingredients: [
        '200 g gingembre frais pelé',
        '1,5 litre d\'eau',
        '2 citrons verts (jus)',
        '3 c. soupe de miel',
        '1 pincée de sel',
        '3 gousses cardamome (optionnel)',
        'Glaçons',
      ],
      ingredientsEn: [
        '200 g fresh ginger, peeled',
        '1.5 liters water',
        '2 limes (juice)',
        '3 tbsp honey',
        '1 pinch of salt',
        '3 cardamom pods (optional)',
        'Ice cubes',
      ],
      steps: [
        'Peler et couper grossièrement le gingembre.',
        'Mixer le gingembre avec 300 ml d\'eau → purée fine.',
        'Filtrer à travers un tamis fin en pressant bien pour extraire tout le jus.',
        'Mélanger le jus filtré avec 1,2 L d\'eau froide.',
        'Ajouter jus de citron, miel et sel. Bien mélanger.',
        'Ajuster le sucre selon préférence. Servir très frais sur glaçons.',
      ],
      stepsEn: [
        'Peel and roughly chop the ginger.',
        'Blend ginger with 300 ml water → smooth purée.',
        'Strain through a fine sieve, pressing well to extract all juice.',
        'Mix filtered juice with 1.2 L cold water.',
        'Add lime juice, honey and salt. Mix well.',
        'Adjust sweetness to taste. Serve very cold over ice.',
      ],
      nutrition: NutritionInfo(
        calories: 65, proteines: 0.5, glucides: 16.0, lipides: 0.2, fibres: 0.4,
        vitamines: {'Vitamine C': '12 mg', 'Magnésium': '15 mg', 'Gingérol': 'Élevé (anti-inflam.)'},
      ),
    ),

    // ─── SAUCE FEUILLES DE BAOBAB ──────────────────────────────────────
    Recipe(
      id: 'new3', category: 'soupes',
      name:        'Sauce Feuilles de Baobab',
      nameEn:      'Baobab Leaf Sauce',
      description: 'Sauce traditionnelle aux feuilles séchées de baobab, l\'arbre sacré d\'Afrique. Extraordinairement riche en calcium et vitamine C, elle accompagne le tô de mil au Burkina Faso.',
      descriptionEn: 'Traditional sauce with dried baobab leaves from Africa\'s sacred tree. Extraordinarily rich in calcium and vitamin C, it accompanies millet tô across Burkina Faso.',
      imagePath: 'assets/images/sauce_feuilles_baobab.jpg',
      prepTime: 20, cookTime: 35, servings: 4, difficulty: 'Moyen',
      ingredients: [
        '150 g feuilles de baobab séchées',
        '200 g poisson fumé émietté',
        '100 g viande séchée (optionnel)',
        '1 oignon',
        '2 tomates',
        '2 c. soupe huile de palme',
        '1 cube de bouillon',
        '1 c. café bicarbonate de soude',
        'Sel, piment',
        '600 ml eau',
      ],
      ingredientsEn: [
        '150 g dried baobab leaves',
        '200 g flaked smoked fish',
        '100 g dried meat (optional)',
        '1 onion',
        '2 tomatoes',
        '2 tbsp palm oil',
        '1 stock cube',
        '1 tsp baking soda',
        'Salt, chili',
        '600 ml water',
      ],
      steps: [
        'Tremper les feuilles séchées dans de l\'eau tiède + bicarbonate 20 min pour les ramollir.',
        'Rincer abondamment 2-3 fois à l\'eau froide pour éliminer l\'amertume.',
        'Faire revenir l\'oignon dans l\'huile de palme jusqu\'à dorure (5 min).',
        'Ajouter les tomates mixées, cuire 8 min en remuant.',
        'Ajouter poisson fumé, viande séchée, eau, cube et piment.',
        'Incorporer les feuilles égouttées. Mijoter 20 min à feu moyen en remuant souvent.',
        'Ajuster sel et servir chaud avec tô de mil ou riz.',
      ],
      stepsEn: [
        'Soak dried leaves in warm water + baking soda 20 min to soften.',
        'Rinse thoroughly 2-3 times with cold water to remove bitterness.',
        'Fry onion in palm oil until golden (5 min).',
        'Add blended tomatoes, cook 8 min stirring.',
        'Add smoked fish, dried meat, water, stock cube and chili.',
        'Stir in drained leaves. Simmer 20 min on medium heat, stirring often.',
        'Adjust salt and serve hot with millet tô or rice.',
      ],
      nutrition: NutritionInfo(
        calories: 175, proteines: 16.0, glucides: 8.0, lipides: 9.0, fibres: 7.5,
        vitamines: {'Vitamine C': '80 mg', 'Calcium': '310 mg', 'Fer': '7,2 mg'},
      ),
    ),

    // ─── KOURA-KOURA (Biscuits Sésame) ────────────────────────────────
    Recipe(
      id: 'new4', category: 'desserts',
      name:        'Koura-Koura (Biscuits Sésame)',
      nameEn:      'Koura-Koura (Sesame Biscuits)',
      description: 'Petits biscuits croquants au sésame torréfié et à la farine de mil, liés au sucre de canne. En-cas traditionnel vendu sur tous les marchés du Burkina Faso, adoré des enfants.',
      descriptionEn: 'Crispy little biscuits made with toasted sesame and millet flour, bound with cane sugar. A traditional snack sold in all Burkina Faso markets, loved by children.',
      imagePath: 'assets/images/koura_koura.jpg',
      prepTime: 20, cookTime: 25, servings: 20, difficulty: 'Moyen',
      ingredients: [
        '300 g graines de sésame',
        '150 g farine de mil',
        '120 g sucre de canne',
        '50 g beurre de karité',
        '2 c. soupe d\'eau',
        '1 pincée de sel',
        '1 c. café vanille',
        'Huile (pour la plaque)',
      ],
      ingredientsEn: [
        '300 g sesame seeds',
        '150 g millet flour',
        '120 g cane sugar',
        '50 g shea butter',
        '2 tbsp water',
        '1 pinch of salt',
        '1 tsp vanilla',
        'Oil (to grease baking sheet)',
      ],
      steps: [
        'Torréfier le sésame dans une poêle sèche à feu moyen 5-7 min en remuant → légère dorure. Laisser refroidir.',
        'Mélanger sésame, farine, sucre, sel et vanille dans un bol.',
        'Faire fondre le beurre de karité. Verser sur le mélange sec avec 2 c. soupe d\'eau.',
        'Pétrir jusqu\'à obtenir une pâte qui se tient bien.',
        'Préchauffer four à 180 °C. Huiler une plaque.',
        'Former des boules taille noix, aplatir en disques de 5 mm sur la plaque.',
        'Cuire 20-25 min jusqu\'à dorure. Refroidir complètement — ils durcissent en refroidissant.',
      ],
      stepsEn: [
        'Toast sesame in dry pan over medium heat 5-7 min stirring → light golden. Cool.',
        'Mix sesame, flour, sugar, salt and vanilla in a bowl.',
        'Melt shea butter. Pour over dry mixture with 2 tbsp water.',
        'Knead until a firm dough forms.',
        'Preheat oven to 180 °C. Grease a baking sheet.',
        'Shape into walnut-sized balls, flatten into 5 mm discs on the sheet.',
        'Bake 20-25 min until golden. Cool completely — they harden as they cool.',
      ],
      nutrition: NutritionInfo(
        calories: 145, proteines: 4.5, glucides: 14.0, lipides: 8.5, fibres: 2.0,
        vitamines: {'Calcium': '185 mg', 'Magnésium': '45 mg', 'Vitamine E': '0,8 mg'},
      ),
    ),

// ════════════════════════════════════════════════════════════════════════
//  FIN DE LA PARTIE 1
//  ↑ Tout ce qui précède va juste après :  static const List<Recipe> _recipes = [
// ════════════════════════════════════════════════════════════════════════




    // ═══════════ ENTRÉES ═══════════

    Recipe(
      id: 'e1', category: 'entrees',
      name: 'Beignets de Haricots (Koosé)', nameEn: 'Bean Fritters (Koosé)',
      description: 'Beignets dorés et croustillants à base de haricots blancs mixés. Classique du petit-déjeuner burkinabè.',
      descriptionEn: 'Golden crispy fritters made from blended white beans. A classic Burkinabe breakfast.',
      imagePath: 'assets/images/koose.jpg',
      prepTime: 20, cookTime: 20, servings: 6, difficulty: 'Facile',
      ingredients: ['500 g haricots blancs décortiqués', '1 oignon', '1 piment frais', '1 c. café sel', 'Huile de friture'],
      ingredientsEn: ['500 g white beans, peeled', '1 onion', '1 fresh chili', '1 tsp salt', 'Frying oil'],
      steps: [
        'Tremper les haricots 12 h, égoutter et rincer.',
        'Mixer avec l\'oignon, le piment et un peu d\'eau → pâte épaisse.',
        'Saler et battre 5 min pour aérer la pâte.',
        'Frire des cuillerées à 170 °C, 4-5 min, jusqu\'à dorure.',
        'Égoutter sur papier absorbant et servir chaud.',
      ],
      stepsEn: [
        'Soak beans 12 h, drain and rinse.',
        'Blend with onion, chili and a little water → thick batter.',
        'Salt and beat 5 min to aerate.',
        'Fry spoonfuls at 170 °C, 4-5 min, until golden.',
        'Drain on paper towels and serve hot.',
      ],
      nutrition: NutritionInfo(calories: 210, proteines: 11, glucides: 28, lipides: 7, fibres: 5.5,
          vitamines: {'Fer': '3,2 mg', 'Zinc': '1,8 mg', 'Vitamine B1': '0,3 mg'}),
    ),

    Recipe(
      id: 'e2', category: 'entrees',
      name: 'Salade Avocat-Gombo', nameEn: 'Avocado & Okra Salad',
      description: 'Salade fraîche associant avocat crémeux et gombo cuit, sauce citron-piment.',
      descriptionEn: 'Fresh salad combining creamy avocado and cooked okra with a lemon-chili dressing.',
      imagePath: 'assets/images/salade_avocat_gombo.jpg',
      prepTime: 15, cookTime: 10, servings: 4, difficulty: 'Facile',
      ingredients: ['2 avocats mûrs', '200 g gombo', '1 tomate', '½ oignon rouge', 'Jus 1 citron vert', '1 c. soupe huile arachide', 'Sel, piment, coriandre'],
      ingredientsEn: ['2 ripe avocados', '200 g okra', '1 tomato', '½ red onion', 'Juice of 1 lime', '1 tbsp groundnut oil', 'Salt, chili, coriander'],
      steps: [
        'Cuire les gombos entiers 8 min à l\'eau bouillante salée. Refroidir et couper en rondelles.',
        'Couper avocats, tomate, oignon en dés.',
        'Vinaigrette : citron + huile + sel + piment.',
        'Tout mélanger délicatement. Servir frais avec coriandre.',
      ],
      stepsEn: [
        'Cook whole okra 8 min in salted boiling water. Cool and slice.',
        'Dice avocados, tomato, and onion.',
        'Dressing: lime + oil + salt + chili.',
        'Mix gently. Serve fresh with coriander.',
      ],
      nutrition: NutritionInfo(calories: 180, proteines: 3, glucides: 10, lipides: 15, fibres: 6,
          vitamines: {'Vitamine C': '25 mg', 'Vitamine K': '35 µg', 'Folate': '90 µg'}),
    ),

    Recipe(
      id: 'e3', category: 'entrees',
      name: 'Galettes de Mil Grillées', nameEn: 'Grilled Millet Flatbreads',
      description: 'Galettes épaisses de farine de mil cuites à sec, servies avec beurre de karité ou miel.',
      descriptionEn: 'Thick millet flour flatbreads cooked dry, served with shea butter or honey.',
      imagePath: 'assets/images/galettes_mil.jpg',
      prepTime: 30, cookTime: 20, servings: 4, difficulty: 'Moyen',
      ingredients: ['300 g farine de mil', '100 g farine de sorgho', '1 c. café sel', '1 c. café levure chimique', '1 c. soupe sucre', '250 ml eau tiède', 'Beurre de karité / miel'],
      ingredientsEn: ['300 g millet flour', '100 g sorghum flour', '1 tsp salt', '1 tsp baking powder', '1 tbsp sugar', '250 ml warm water', 'Shea butter / honey to serve'],
      steps: [
        'Mélanger les farines, sel, sucre et levure.',
        'Incorporer l\'eau progressivement → pâte souple.',
        'Former des disques épais de 1 cm.',
        'Cuire à la poêle sèche à feu moyen-doux, 6 min / côté.',
        'Servir chaud avec beurre de karité ou miel.',
      ],
      stepsEn: [
        'Mix flours, salt, sugar and baking powder.',
        'Add water gradually → soft dough.',
        'Shape into 1 cm thick discs.',
        'Cook in dry pan over medium-low heat, 6 min per side.',
        'Serve hot with shea butter or honey.',
      ],
      nutrition: NutritionInfo(calories: 245, proteines: 7, glucides: 48, lipides: 3, fibres: 4.5,
          vitamines: {'Fer': '2,8 mg', 'Magnésium': '65 mg', 'Vitamine B3': '2,1 mg'}),
    ),

    // ═══════════ PLATS PRINCIPAUX ═══════════

    Recipe(
      id: 'p1', category: 'plats',
      name: 'Tô de Mil au Gombo', nameEn: 'Millet Tô with Okra Sauce',
      description: 'Le plat national burkinabè. Pâte épaisse de mil servie avec une sauce gombo au poisson fumé.',
      descriptionEn: 'The Burkinabe national dish. Thick millet paste served with smoked fish okra sauce.',
      imagePath: 'assets/images/to_mil_gombo.jpg',
      prepTime: 20, cookTime: 40, servings: 4, difficulty: 'Moyen',
      ingredients: ['500 g farine de mil', '1,5 L eau', 'Sel',
        '— Sauce —', '400 g gombo frais', '150 g poisson fumé', '1 oignon', '2 tomates', '2 c. soupe huile de palme', 'Sel, piment, cube de bouillon'],
      ingredientsEn: ['500 g millet flour', '1.5 L water', 'Salt',
        '— Sauce —', '400 g fresh okra', '150 g smoked fish', '1 onion', '2 tomatoes', '2 tbsp palm oil', 'Salt, chili, stock cube'],
      steps: [
        'Sauce : faire revenir oignon dans huile de palme, ajouter tomates et cuire 10 min.',
        'Ajouter gombo coupé, poisson fumé émietté, eau, piment et cube. Mijoter 20 min.',
        'Tô : délayer farine dans 300 ml eau froide.',
        'Porter 1,2 L eau à ébullition, verser la farine en filet en remuant.',
        'Cuire 15-20 min à feu moyen en remuant vigoureusement → pâte très épaisse.',
        'Mouler en boule. Servir avec la sauce gombo chaude.',
      ],
      stepsEn: [
        'Sauce: fry onion in palm oil, add tomatoes, cook 10 min.',
        'Add sliced okra, flaked smoked fish, water, chili, stock cube. Simmer 20 min.',
        'Tô: dilute flour in 300 ml cold water.',
        'Bring 1.2 L water to boil, pour batter in while stirring.',
        'Cook 15-20 min over medium heat, stirring vigorously → very thick paste.',
        'Shape into a ball. Serve with warm okra sauce.',
      ],
      nutrition: NutritionInfo(calories: 420, proteines: 18, glucides: 65, lipides: 9, fibres: 7,
          vitamines: {'Fer': '5,5 mg', 'Vitamine C': '18 mg', 'Calcium': '85 mg'}),
    ),

    Recipe(
      id: 'p2', category: 'plats',
      name: 'Riz au Gras Burkinabè', nameEn: 'Burkinabe Fatty Rice',
      description: 'Riz cuit dans une sauce tomate à l\'huile de palme avec mouton et légumes. Plat de fête.',
      descriptionEn: 'Rice cooked in a palm oil tomato sauce with mutton and vegetables. A festive dish.',
      imagePath: 'assets/images/riz_gras.jpg',
      prepTime: 30, cookTime: 60, servings: 6, difficulty: 'Moyen',
      ingredients: ['600 g riz brisé', '500 g mouton en morceaux', '4 c. soupe concentré de tomate', '2 tomates fraîches', '2 oignons', '2 carottes', '2 c. soupe huile de palme', 'Ail, gingembre, sel, piment, bouillon'],
      ingredientsEn: ['600 g broken rice', '500 g mutton pieces', '4 tbsp tomato paste', '2 fresh tomatoes', '2 onions', '2 carrots', '2 tbsp palm oil', 'Garlic, ginger, salt, chili, stock'],
      steps: [
        'Faire dorer le mouton dans l\'huile. Réserver.',
        'Faire revenir oignons, ail, gingembre. Ajouter concentré + tomates. Cuire 15 min.',
        'Ajouter viande, 1,2 L eau, bouillon. Mijoter 30 min.',
        'Retirer viande. Mesurer bouillon (900 ml) et y cuire le riz.',
        'Poser carottes et viande par-dessus. Cuire couvert 25 min à feu doux.',
        'Mélanger délicatement avant de servir.',
      ],
      stepsEn: [
        'Brown mutton in oil. Set aside.',
        'Fry onions, garlic, ginger. Add paste + tomatoes. Cook 15 min.',
        'Add meat, 1.2 L water, stock. Simmer 30 min.',
        'Remove meat. Use 900 ml broth to cook the rice.',
        'Place carrots and meat on top. Cook covered 25 min on low heat.',
        'Stir gently before serving.',
      ],
      nutrition: NutritionInfo(calories: 510, proteines: 28, glucides: 72, lipides: 12, fibres: 3.5,
          vitamines: {'Zinc': '4,5 mg', 'Vitamine B12': '1,8 µg', 'Fer': '4,2 mg'}),
    ),

    Recipe(
      id: 'p3', category: 'plats',
      name: 'Poulet Braisé au Charbon', nameEn: 'Charcoal Grilled Chicken',
      description: 'Poulet fermier mariné aux épices locales et grillé au charbon. La fierté des maquis de Ouagadougou.',
      descriptionEn: 'Free-range chicken marinated in local spices and grilled over charcoal. Pride of Ouaga\'s maquis.',
      imagePath: 'assets/images/poulet_braise.jpg',
      prepTime: 40, cookTime: 45, servings: 4, difficulty: 'Moyen',
      ingredients: ['1 poulet fermier (1,2 kg)', '3 gousses ail', '1 morceau gingembre râpé', '1 c. café cumin', '1 c. café paprika', '1 piment rouge haché', '2 c. soupe huile', 'Jus 1 citron', 'Sel, poivre'],
      ingredientsEn: ['1 free-range chicken (1.2 kg)', '3 garlic cloves', '1 piece grated ginger', '1 tsp cumin', '1 tsp paprika', '1 chopped red chili', '2 tbsp oil', 'Juice of 1 lemon', 'Salt, pepper'],
      steps: [
        'Couper le poulet en deux dans la longueur.',
        'Mixer ail, gingembre, épices, huile, citron, sel → marinade.',
        'Inciser la chair et frotter la marinade. Mariner 2 h.',
        'Griller sur braises grises 20-25 min / côté en arrosant souvent.',
        'Servir avec tomates fraîches, oignons et pain.',
      ],
      stepsEn: [
        'Cut chicken in half lengthwise.',
        'Blend garlic, ginger, spices, oil, lemon, salt → marinade.',
        'Score the flesh and rub marinade in. Marinate 2 h.',
        'Grill over grey coals 20-25 min per side, basting often.',
        'Serve with fresh tomatoes, onions and bread.',
      ],
      nutrition: NutritionInfo(calories: 380, proteines: 42, glucides: 5, lipides: 21, fibres: 1,
          vitamines: {'Vitamine B6': '0,9 mg', 'Sélénium': '28 µg', 'Phosphore': '310 mg'}),
    ),

    Recipe(
      id: 'p4', category: 'plats',
      name: 'Sauce Arachide au Poulet', nameEn: 'Chicken Peanut Sauce',
      description: 'Sauce onctueuse à la pâte d\'arachide avec du poulet. Incontournable de la gastronomie burkinabè.',
      descriptionEn: 'Creamy peanut sauce with chicken. A cornerstone of Burkinabe gastronomy.',
      imagePath: 'assets/images/sauce_arachide.jpg',
      prepTime: 20, cookTime: 55, servings: 5, difficulty: 'Moyen',
      ingredients: ['1 poulet coupé en morceaux', '250 g pâte d\'arachide', '2 tomates fraîches mixées', '1 oignon', '2 gousses ail', '1 cube bouillon', '2 c. soupe huile', 'Sel, piment, laurier', '800 ml eau'],
      ingredientsEn: ['1 chicken, cut into pieces', '250 g peanut butter', '2 blended fresh tomatoes', '1 onion', '2 garlic cloves', '1 stock cube', '2 tbsp oil', 'Salt, chili, bay leaf', '800 ml water'],
      steps: [
        'Faire dorer le poulet dans l\'huile. Réserver.',
        'Faire revenir oignon et ail. Ajouter tomates mixées, cuire 10 min.',
        'Délayer pâte d\'arachide dans 500 ml eau tiède → crème lisse.',
        'Ajouter crème d\'arachide, reste d\'eau, cube, laurier.',
        'Remettre le poulet, mijoter 40 min à feu doux en remuant souvent.',
        'La sauce est prête quand l\'huile remonte. Ajuster sel et piment.',
      ],
      stepsEn: [
        'Brown chicken in oil. Set aside.',
        'Fry onion and garlic. Add blended tomatoes, cook 10 min.',
        'Dilute peanut butter in 500 ml warm water → smooth cream.',
        'Add peanut cream, remaining water, stock cube, bay leaf.',
        'Return chicken, simmer 40 min on low heat, stirring often.',
        'Sauce is ready when oil rises to surface. Adjust seasoning.',
      ],
      nutrition: NutritionInfo(calories: 490, proteines: 35, glucides: 14, lipides: 34, fibres: 3.5,
          vitamines: {'Vitamine E': '5,2 mg', 'Magnésium': '88 mg', 'Vitamine B3': '12 mg'}),
    ),

    Recipe(
      id: 'p5', category: 'plats',
      name: 'Haricots Niébé en Sauce', nameEn: 'Black-eyed Peas in Sauce',
      description: 'Haricots niébé mijotés dans une sauce tomate épicée. Plat économique et très nourrissant.',
      descriptionEn: 'Black-eyed peas simmered in a spicy tomato sauce. An affordable and nourishing dish.',
      imagePath: 'assets/images/haricots_sauce.jpg',
      prepTime: 15, cookTime: 90, servings: 4, difficulty: 'Facile',
      ingredients: ['400 g haricots niébé secs', '2 tomates fraîches', '1 oignon', '2 c. soupe huile de palme', '1 piment', '1 cube bouillon', 'Sel'],
      ingredientsEn: ['400 g dried black-eyed peas', '2 fresh tomatoes', '1 onion', '2 tbsp palm oil', '1 chili', '1 stock cube', 'Salt'],
      steps: [
        'Tremper les haricots 8 h. Égoutter et rincer.',
        'Cuire dans 1 L eau jusqu\'à tendreté (60-70 min).',
        'Faire revenir oignon dans huile de palme, ajouter tomates et piment. Cuire 15 min.',
        'Incorporer haricots égouttés et cube. Écraser légèrement pour épaissir.',
        'Mijoter encore 15 min. Servir avec riz ou galettes de mil.',
      ],
      stepsEn: [
        'Soak peas 8 h. Drain and rinse.',
        'Cook in 1 L water until tender (60-70 min).',
        'Fry onion in palm oil, add tomatoes and chili. Cook 15 min.',
        'Add drained peas and stock cube. Lightly mash to thicken.',
        'Simmer 15 min more. Serve with rice or millet flatbreads.',
      ],
      nutrition: NutritionInfo(calories: 290, proteines: 16, glucides: 48, lipides: 5, fibres: 12,
          vitamines: {'Folate': '220 µg', 'Fer': '4,8 mg', 'Potassium': '580 mg'}),
    ),

    Recipe(
      id: 'p6', category: 'plats',
      name: 'Babenda (Feuilles & Haricots)', nameEn: 'Babenda (Leaves & Beans)',
      description: 'Plat traditionnel aux feuilles de baobab séchées, haricots et poisson fumé. Très nutritif.',
      descriptionEn: 'Traditional dish with dried baobab leaves, beans and smoked fish. Highly nutritious.',
      imagePath: 'assets/images/babenda.jpg',
      prepTime: 25, cookTime: 60, servings: 4, difficulty: 'Difficile',
      ingredients: ['200 g feuilles de baobab séchées', '300 g haricots niébé cuits', '200 g poisson fumé', '2 c. soupe huile de palme', '1 oignon', '1 cube bouillon', 'Piment, sel', 'Bicarbonate'],
      ingredientsEn: ['200 g dried baobab leaves', '300 g cooked black-eyed peas', '200 g smoked fish', '2 tbsp palm oil', '1 onion', '1 stock cube', 'Chili, salt', 'Baking soda'],
      steps: [
        'Tremper feuilles 30 min dans eau + bicarbonate. Rincer abondamment.',
        'Faire revenir oignon dans huile de palme. Ajouter feuilles 5 min.',
        'Ajouter 500 ml eau, poisson émietté, cube, piment. Mijoter 30 min.',
        'Ajouter haricots cuits et poursuivre 15 min.',
        'Servir avec tô de mil ou riz.',
      ],
      stepsEn: [
        'Soak leaves 30 min in water + baking soda. Rinse thoroughly.',
        'Fry onion in palm oil. Add leaves, cook 5 min.',
        'Add 500 ml water, flaked fish, stock cube, chili. Simmer 30 min.',
        'Add cooked beans, cook 15 min more.',
        'Serve with millet tô or rice.',
      ],
      nutrition: NutritionInfo(calories: 320, proteines: 22, glucides: 35, lipides: 9, fibres: 9,
          vitamines: {'Vitamine C': '55 mg', 'Calcium': '210 mg', 'Fer': '6,8 mg'}),
    ),

    // ═══════════ DESSERTS ═══════════

    Recipe(
      id: 'd1', category: 'desserts',
      name: 'Bouillie de Mil (Koko)', nameEn: 'Millet Porridge (Koko)',
      description: 'Bouillie onctueuse de farine de mil fermentée, sucrée et parfumée au gingembre. Petit-déjeuner traditionnel.',
      descriptionEn: 'Smooth porridge of fermented millet flour, sweetened and flavored with ginger. Traditional breakfast.',
      imagePath: 'assets/images/koko.jpg',
      prepTime: 10, cookTime: 20, servings: 4, difficulty: 'Facile',
      ingredients: ['300 g farine de mil fermentée', '1 L eau', '100 g sucre de canne', '1 c. café gingembre en poudre', '½ c. café vanille', 'Lait concentré sucré (optionnel)'],
      ingredientsEn: ['300 g fermented millet flour', '1 L water', '100 g cane sugar', '1 tsp ground ginger', '½ tsp vanilla', 'Sweetened condensed milk (optional)'],
      steps: [
        'Délayer la farine dans 300 ml eau froide → pâte lisse.',
        'Porter les 700 ml restants à ébullition.',
        'Verser la pâte en filet dans l\'eau bouillante en remuant.',
        'Ajouter sucre, gingembre et vanille.',
        'Cuire 15 min à feu doux en remuant. Servir chaud.',
      ],
      stepsEn: [
        'Dilute flour in 300 ml cold water → smooth paste.',
        'Bring remaining 700 ml to a boil.',
        'Pour batter in a stream into boiling water, stirring.',
        'Add sugar, ginger and vanilla.',
        'Cook 15 min on low heat, stirring. Serve hot.',
      ],
      nutrition: NutritionInfo(calories: 190, proteines: 4.5, glucides: 40, lipides: 1.5, fibres: 3,
          vitamines: {'Fer': '2,1 mg', 'Vitamine B1': '0,2 mg', 'Magnésium': '50 mg'}),
    ),

    Recipe(
      id: 'd2', category: 'desserts',
      name: 'Alloco (Banane Plantain Frite)', nameEn: 'Alloco (Fried Plantain)',
      description: 'Tranches de banane plantain mûre frites dans l\'huile, caramélisées. Goûter populaire des marchés.',
      descriptionEn: 'Ripe plantain slices fried in oil until caramelized. A popular market snack.',
      imagePath: 'assets/images/alloco.jpg',
      prepTime: 10, cookTime: 15, servings: 4, difficulty: 'Facile',
      ingredients: ['3 bananes plantain très mûres (peau noire)', 'Huile de friture', '1 pincée de sel', 'Sucre glace ou piment (optionnel)'],
      ingredientsEn: ['3 very ripe plantains (black skin)', 'Frying oil', '1 pinch of salt', 'Powdered sugar or chili (optional)'],
      steps: [
        'Éplucher les plantains et couper en diagonale (1 cm).',
        'Chauffer huile à 175 °C.',
        'Frire par petites quantités 2-3 min / côté jusqu\'à dorure.',
        'Égoutter sur papier absorbant. Saler légèrement.',
        'Servir chaud, nature, sucré ou pimenté.',
      ],
      stepsEn: [
        'Peel plantains and cut diagonally (1 cm thick).',
        'Heat oil to 175 °C.',
        'Fry in batches 2-3 min per side until golden.',
        'Drain on paper towels. Season with a pinch of salt.',
        'Serve hot, plain, sweet or spicy.',
      ],
      nutrition: NutritionInfo(calories: 230, proteines: 1.5, glucides: 42, lipides: 7, fibres: 3,
          vitamines: {'Vitamine B6': '0,4 mg', 'Potassium': '420 mg', 'Vitamine C': '12 mg'}),
    ),

    Recipe(
      id: 'd3', category: 'desserts',
      name: 'Gâteau de Niébé au Miel', nameEn: 'Black-eyed Pea Honey Cake',
      description: 'Gâteau moelleux à base de farine de niébé, nappé de miel du Burkina. Original et protéiné.',
      descriptionEn: 'Moist cake made with black-eyed pea flour, drizzled with Burkina honey. Unique and protein-rich.',
      imagePath: 'assets/images/gateau_niebe.jpg',
      prepTime: 25, cookTime: 35, servings: 8, difficulty: 'Difficile',
      ingredients: ['250 g farine de niébé', '150 g sucre', '3 œufs', '100 ml huile végétale', '100 ml lait', '1 sachet levure chimique', '1 c. café vanille', 'Sel', '3 c. soupe miel du Burkina'],
      ingredientsEn: ['250 g black-eyed pea flour', '150 g sugar', '3 eggs', '100 ml vegetable oil', '100 ml milk', '1 tsp baking powder', '1 tsp vanilla', 'Salt', '3 tbsp Burkina honey'],
      steps: [
        'Préchauffer four à 180 °C. Beurrer un moule.',
        'Battre œufs + sucre jusqu\'à blanchiment (5 min).',
        'Incorporer huile et lait.',
        'Tamiser farine, levure et sel. Incorporer délicatement avec la vanille.',
        'Verser dans le moule. Enfourner 35 min.',
        'Sortir chaud, napper de miel. Refroidir avant de démouler.',
      ],
      stepsEn: [
        'Preheat oven to 180 °C. Grease a pan.',
        'Beat eggs + sugar until pale (5 min).',
        'Mix in oil and milk.',
        'Sift flour, baking powder and salt. Fold in gently with vanilla.',
        'Pour into pan. Bake 35 min.',
        'Remove warm, drizzle honey. Cool before unmoulding.',
      ],
      nutrition: NutritionInfo(calories: 280, proteines: 9, glucides: 38, lipides: 11, fibres: 3.5,
          vitamines: {'Folate': '85 µg', 'Vitamine B1': '0,15 mg', 'Fer': '2,5 mg'}),
    ),

    // ═══════════ SOUPES & SAUCES ═══════════

    Recipe(
      id: 's1', category: 'soupes',
      name: 'Soupe de Légumes au Moringa', nameEn: 'Moringa Vegetable Soup',
      description: 'Soupe légère aux feuilles de moringa, riche en nutriments. Consommée dans les villages burkinabè.',
      descriptionEn: 'Light soup with moringa leaves, rich in nutrients. Consumed in Burkinabe villages.',
      imagePath: 'assets/images/soupe_moringa.jpg',
      prepTime: 15, cookTime: 25, servings: 4, difficulty: 'Facile',
      ingredients: ['2 poignées feuilles de moringa', '2 carottes', '2 pommes de terre', '1 oignon', '1 tomate', '1 cube bouillon', '1 c. soupe huile', 'Sel, piment', '1 L eau'],
      ingredientsEn: ['2 handfuls moringa leaves', '2 carrots', '2 potatoes', '1 onion', '1 tomato', '1 stock cube', '1 tbsp oil', 'Salt, chili', '1 L water'],
      steps: [
        'Éplucher et couper tous les légumes.',
        'Faire revenir oignon dans l\'huile. Ajouter tomate, cuire 5 min.',
        'Verser eau, ajouter carottes, pommes de terre et cube. Cuire 15 min.',
        'Ajouter feuilles de moringa. Cuire encore 5 min.',
        'Ne pas trop cuire le moringa pour conserver les vitamines.',
      ],
      stepsEn: [
        'Peel and chop all vegetables.',
        'Fry onion in oil. Add tomato, cook 5 min.',
        'Add water, carrots, potatoes and stock cube. Cook 15 min.',
        'Add moringa leaves. Cook 5 min more.',
        'Do not overcook moringa to preserve vitamins.',
      ],
      nutrition: NutritionInfo(calories: 130, proteines: 5.5, glucides: 22, lipides: 3.5, fibres: 4.5,
          vitamines: {'Vitamine A': '380 µg', 'Vitamine C': '60 mg', 'Calcium': '145 mg'}),
    ),

    Recipe(
      id: 's2', category: 'soupes',
      name: 'Sauce Gombo au Poisson Fumé', nameEn: 'Smoked Fish Okra Sauce',
      description: 'Sauce onctueuse et filante au gombo avec poisson fumé et viande séchée. Accompagnement du tô.',
      descriptionEn: 'Thick, stringy okra sauce with smoked fish and dried meat. Traditional tô accompaniment.',
      imagePath: 'assets/images/sauce_gombo.jpg',
      prepTime: 20, cookTime: 35, servings: 5, difficulty: 'Moyen',
      ingredients: ['500 g gombo frais', '200 g poisson fumé', '100 g viande séchée', '1 oignon', '2 tomates', '2 c. soupe huile de palme', '1 c. soupe bicarbonate', 'Sel, piment, cube', '600 ml eau'],
      ingredientsEn: ['500 g fresh okra', '200 g smoked fish', '100 g dried meat', '1 onion', '2 tomatoes', '2 tbsp palm oil', '1 tbsp baking soda', 'Salt, chili, stock', '600 ml water'],
      steps: [
        'Mixer les gombos crus → purée filante.',
        'Faire revenir oignon et tomates dans l\'huile de palme 10 min.',
        'Ajouter poisson, viande séchée, bicarbonate, eau et cube.',
        'Incorporer la purée de gombo. Mijoter 20 min en remuant.',
        'Sauce prête quand elle épaissit et devient très filante.',
      ],
      stepsEn: [
        'Blend raw okra → stringy purée.',
        'Fry onion and tomatoes in palm oil 10 min.',
        'Add fish, dried meat, baking soda, water and stock cube.',
        'Stir in okra purée. Simmer 20 min, stirring.',
        'Sauce ready when thick and stringy.',
      ],
      nutrition: NutritionInfo(calories: 195, proteines: 18, glucides: 12, lipides: 8.5, fibres: 5.5,
          vitamines: {'Vitamine C': '22 mg', 'Fer': '3,5 mg', 'Calcium': '95 mg'}),
    ),

    // ═══════════ BOISSONS ═══════════

    Recipe(
      id: 'b1', category: 'boissons',
      name: 'Jus de Tamarin Frais', nameEn: 'Fresh Tamarind Juice',
      description: 'Boisson aigre-douce rafraîchissante à la pulpe de tamarin. Très populaire dans toute la région.',
      descriptionEn: 'Refreshing sweet-sour drink made from tamarind pulp. Very popular across the region.',
      imagePath: 'assets/images/jus_tamarin.jpg',
      prepTime: 15, cookTime: 5, servings: 6, difficulty: 'Facile',
      ingredients: ['200 g pulpe de tamarin', '1,2 L eau', '120 g sucre', '1 pincée sel', '½ c. café gingembre', 'Glaçons'],
      ingredientsEn: ['200 g tamarind pulp', '1.2 L water', '120 g sugar', '1 pinch salt', '½ tsp ginger', 'Ice cubes'],
      steps: [
        'Tremper tamarin dans 400 ml eau tiède 15 min.',
        'Pétrir et filtrer soigneusement pour extraire tout le jus.',
        'Dissoudre sucre et sel dans le jus filtré.',
        'Ajouter 800 ml eau restants et gingembre. Bien mélanger.',
        'Servir très frais sur glaçons.',
      ],
      stepsEn: [
        'Soak tamarind in 400 ml warm water for 15 min.',
        'Knead and strain carefully to extract all juice.',
        'Dissolve sugar and salt in the strained juice.',
        'Add remaining 800 ml water and ginger. Mix well.',
        'Serve very cold over ice.',
      ],
      nutrition: NutritionInfo(calories: 110, proteines: 0.5, glucides: 28, lipides: 0.2, fibres: 0.6,
          vitamines: {'Vitamine C': '3 mg', 'Potassium': '225 mg', 'Magnésium': '18 mg'}),
    ),

    Recipe(
      id: 'b2', category: 'boissons',
      name: 'Bissap Rouge (Hibiscus)', nameEn: 'Red Bissap (Hibiscus)',
      description: 'Infusion rouge vif de fleurs d\'hibiscus séchées, sucrée et parfumée à la menthe. Incontournable du Burkina.',
      descriptionEn: 'Bright red dried hibiscus flower infusion, sweetened and flavored with mint. A Burkina staple.',
      imagePath: 'assets/images/bissap.jpg',
      prepTime: 10, cookTime: 15, servings: 8, difficulty: 'Facile',
      ingredients: ['100 g fleurs d\'hibiscus séchées', '1,5 L eau', '150 g sucre', '10 feuilles menthe fraîche', '1 c. café vanille', 'Glaçons'],
      ingredientsEn: ['100 g dried hibiscus flowers', '1.5 L water', '150 g sugar', '10 fresh mint leaves', '1 tsp vanilla', 'Ice cubes'],
      steps: [
        'Porter eau à ébullition. Plonger les fleurs et infuser 15 min.',
        'Filtrer les fleurs. Ajouter sucre et remuer jusqu\'à dissolution.',
        'Ajouter vanille et feuilles de menthe.',
        'Refroidir puis réfrigérer. Se conserve 3-4 jours.',
        'Servir sur glaçons.',
      ],
      stepsEn: [
        'Bring water to boil. Add flowers and steep 15 min.',
        'Strain flowers. Add sugar and stir until dissolved.',
        'Add vanilla and mint leaves.',
        'Cool then refrigerate. Keeps 3-4 days.',
        'Serve over ice.',
      ],
      nutrition: NutritionInfo(calories: 80, proteines: 0.2, glucides: 20, lipides: 0, fibres: 0.3,
          vitamines: {'Vitamine C': '8 mg', 'Fer': '0,5 mg', 'Antioxydants': 'Élevés'}),
    ),

    Recipe(
      id: 'b3', category: 'boissons',
      name: 'Dolo (Bière de Sorgho)', nameEn: 'Dolo (Sorghum Beer)',
      description: 'Bière fermentée traditionnelle au sorgho rouge, préparée par les dolo-mèmes. Accompagne cérémonies et fêtes.',
      descriptionEn: 'Traditional fermented red sorghum beer, prepared by dolo-mèmes. Accompanies ceremonies and celebrations.',
      imagePath: 'assets/images/dolo.jpg',
      prepTime: 30, cookTime: 180, servings: 10, difficulty: 'Difficile',
      ingredients: ['2 kg sorgho rouge malté', '5 L eau', '100 g sorgho non malté', 'Levure naturelle (d\'une fournée précédente)'],
      ingredientsEn: ['2 kg malted red sorghum', '5 L water', '100 g unmalted sorghum', 'Natural yeast (from a previous batch)'],
      steps: [
        'Faire germer le sorgho 3 jours humide, sécher au soleil. Moudre grossièrement.',
        'Délayer farine de malt dans eau froide. Laisser reposer 2 h.',
        'Porter à ébullition en remuant constamment 1 h.',
        'Filtrer le liquide chaud. Laisser refroidir.',
        'Ajouter levure naturelle. Fermenter 12-24 h.',
        'Prêt quand légèrement mousseux.',
      ],
      stepsEn: [
        'Sprout sorghum 3 days moist, sun-dry. Coarsely grind.',
        'Mix malt flour with cold water. Rest 2 h.',
        'Bring to boil, stirring constantly for 1 h.',
        'Strain hot liquid. Let cool.',
        'Add natural yeast. Ferment 12-24 h.',
        'Ready when slightly frothy.',
      ],
      nutrition: NutritionInfo(calories: 95, proteines: 1.5, glucides: 18, lipides: 0.5, fibres: 0.8,
          vitamines: {'Vitamine B2': '0,08 mg', 'Vitamine B3': '1,2 mg', 'Fer': '0,8 mg'}),
    ),
  ];

  static List<Category> getCategories() => categories;
  static List<Recipe> getRecipes() => _recipes;
  static List<Recipe> getFeatured() {
    const ids = ['new1', 'new2', 'new3', 'new4'];
    final list = _recipes.where((r) => ids.contains(r.id)).toList();
    list.sort((a, b) => ids.indexOf(a.id).compareTo(ids.indexOf(b.id)));
    return list;
  }
  static List<Recipe> getRecipesByCategory(String id) =>
      _recipes.where((r) => r.category == id).toList();
  static List<Recipe> getRecipesByDifficulty(String d) =>
      _recipes.where((r) => r.difficulty == d).toList();
  static List<Recipe> search(String q, String? difficulty, bool en) {
    final ql = q.toLowerCase().trim();
    return _recipes.where((r) {
      if (difficulty != null && r.difficulty != difficulty) return false;
      if (ql.isEmpty) return true;
      return r.localName(en).toLowerCase().contains(ql) ||
          r.localDesc(en).toLowerCase().contains(ql) ||
          r.localIngredients(en).any((i) => i.toLowerCase().contains(ql));
    }).toList();
  }
}
