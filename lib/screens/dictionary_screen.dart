// ════════════════════════════════════════════════════════════════════
//  FICHIER : lib/screens/dictionary_screen.dart
//  ACTION  : Copiez ce fichier dans  lib/screens/  de votre projet
// ════════════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ✅ CORRECT (remplacez par)
import '../providers/app_provider.dart';

// ── Modèle ───────────────────────────────────────────────────────────
class DictWord {
  final String french;
  final String english;
  final String moore;
  final String dioula;
  final String fulfulde;
  final String emoji;
  final String category;
  const DictWord({
    required this.french, required this.english,
    required this.moore,  required this.dioula,
    required this.fulfulde, required this.emoji,
    required this.category,
  });
}

// ── Données ───────────────────────────────────────────────────────────
const List<DictWord> _mots = [

  // ── Politesse ────────────────────────────────────────────────────
  DictWord(french:'Merci',          english:'Thank you',       moore:'Barka',         dioula:'I ni ce',        fulfulde:'A jaraama',     emoji:'🙏', category:'politesse'),
  DictWord(french:'Bonjour',        english:'Good morning',    moore:'Ned yibeego',       dioula:'I ni sogoma',    fulfulde:'Jam waali',     emoji:'☀️', category:'politesse'),
  DictWord(french:'Bon appétit',    english:'Enjoy your meal', moore:'wenna riilg laffi', dioula:'Dumuni ka di',   fulfulde:'Nyaama e jam',  emoji:'😋', category:'politesse'),
  DictWord(french:'C\'est délicieux',english:'It\'s delicious',moore:'Ad nooma',       dioula:'A di kosɛbɛ',    fulfulde:'O nyaamii jam', emoji:'🤤', category:'politesse'),
  DictWord(french:'S\'il vous plaît',english:'Please',         moore:'i gafare',         dioula:'I ni baara',     fulfulde:'Tiinaade',     emoji:'🤲', category:'politesse'),

  // ── Aliments ─────────────────────────────────────────────────────
  DictWord(french:'Mil',            english:'Millet',      moore:'kiÏ',       dioula:'Toñon',      fulfulde:'Gawri',         emoji:'🌾', category:'aliment'),
  DictWord(french:'Sorgho',         english:'Sorghum',     moore:'ka zinga',      dioula:'Tiô',        fulfulde:'Maaro',         emoji:'🌾', category:'aliment'),
  DictWord(french:'Riz',            english:'Rice',        moore:'mouille',     dioula:'Malo',       fulfulde:'Maaro ñiiwa',   emoji:'🍚', category:'aliment'),
  DictWord(french:'Haricots',       english:'Beans',       moore:'Bengaã',      dioula:'Sɔ',         fulfulde:'Nyiiri',        emoji:'🫘', category:'aliment'),
  DictWord(french:'Gombo',          english:'Okra',        moore:'mãande',      dioula:'Gnagnan',    fulfulde:'Kanyaari',      emoji:'🌿', category:'aliment'),
  DictWord(french:'Arachide',       english:'Peanut',      moore:'naagouri',       dioula:'Tiga',       fulfulde:'Tiiga',         emoji:'🥜', category:'aliment'),
  DictWord(french:'Poulet',         english:'Chicken',     moore:'Naoga',       dioula:'Kono',       fulfulde:'Gertogel',      emoji:'🐔', category:'aliment'),
  DictWord(french:'Poisson',        english:'Fish',        moore:'Ziim',      dioula:'Jege',       fulfulde:'Liingu',        emoji:'🐟', category:'aliment'),
  DictWord(french:'Eau',            english:'Water',       moore:'Koom',       dioula:'Ji',         fulfulde:'Ndiyam',        emoji:'💧', category:'aliment'),
  DictWord(french:'Lait',           english:'Milk',        moore:'binsim',       dioula:'Nono',       fulfulde:'Kosam',         emoji:'🥛', category:'aliment'),
  DictWord(french:'Beurre de karite', english:'Palm oil',    moore:'kamoaga',      dioula:'Sì',         fulfulde:'Nebam nagge',   emoji:'🛢️', category:'aliment'),
  DictWord(french:'Sel',            english:'Salt',        moore:'yamsum',      dioula:'Sira',       fulfulde:'Gauri',         emoji:'🧂', category:'aliment'),
  DictWord(french:'Piment',         english:'Chili',       moore:'Tipare',       dioula:'Foronto',    fulfulde:'Kaani',         emoji:'🌶️', category:'aliment'),
  DictWord(french:'Tamarin',        english:'Tamarind',    moore:'Pusga',      dioula:'Tomi',       fulfulde:'Jabi',          emoji:'🟤', category:'aliment'),
  DictWord(french:'Bissap (Hibiscus)',english:'Hibiscus',  moore:'Vɛɛnga',     dioula:'Dabileni',   fulfulde:'Kooseam',       emoji:'🌺', category:'aliment'),
  DictWord(french:'Moringa',        english:'Moringa',     moore:'Arzan tiga',dioula:'Guiliguili', fulfulde:'Gawri-haaleehi',emoji:'🌿', category:'aliment'),
  DictWord(french:'Gingembre',      english:'Ginger',      moore:'yammaku',   dioula:'Jinja',      fulfulde:'Cinnali',       emoji:'🫚', category:'aliment'),
  DictWord(french:'Sésame',         english:'Sesame',      moore:'siilla',     dioula:'Kènkèni',    fulfulde:'Nyiiri-naari',  emoji:'⚪', category:'aliment'),
  DictWord(french:'Baobab',         english:'Baobab',      moore:'Toéga',      dioula:'Siguida',    fulfulde:'Bokkhi',        emoji:'🌳', category:'aliment'),

  // ── Ustensiles ───────────────────────────────────────────────────
  DictWord(french:'Marmite',        english:'Cooking pot',  moore:'roukâ', dioula:'Canari',    fulfulde:'Mburndi',        emoji:'🪣', category:'ustensile'),
  DictWord(french:'Calebasse',      english:'Gourd / Bowl', moore:'wamdee',      dioula:'Koro',      fulfulde:'Koloore',        emoji:'🥣', category:'ustensile'),
  DictWord(french:'Mortier',        english:'Mortar',       moore:'toret',     dioula:'Yiri-do',   fulfulde:'Toɓɓere',       emoji:'🪨', category:'ustensile'),
  DictWord(french:'Pilon',          english:'Pestle',       moore:'tor-bila',  dioula:'Yiri-da',   fulfulde:'Hoore-toɓɓere', emoji:'🔨', category:'ustensile'),
  DictWord(french:'Feu de bois',    english:'Firewood',     moore:'Bɩgsala',     dioula:'bougm salla',    fulfulde:'Yiite-lɗi',     emoji:'🔥', category:'ustensile'),
  DictWord(french:'Tamis',          english:'Sieve',        moore:'Koaga',      dioula:'Sɛgɛ',      fulfulde:'Masilorde',      emoji:'🧺', category:'ustensile'),

  // ── Actions ──────────────────────────────────────────────────────
  DictWord(french:'Cuire',          english:'To cook',     moore:'sũn',  dioula:'Tɛ',     fulfulde:'Hookude',  emoji:'👨‍🍳', category:'action'),
  DictWord(french:'Manger',         english:'To eat',      moore:'Di',     dioula:'Dumu',   fulfulde:'Nyaama',   emoji:'🍽️', category:'action'),
  DictWord(french:'Boire',          english:'To drink',    moore:'Yũm',    dioula:'Min',    fulfulde:'Yarna',    emoji:'🥤', category:'action'),
  DictWord(french:'Piler',          english:'To pound',    moore:'Zoe',    dioula:'Fen',    fulfulde:'Tottude',  emoji:'💪', category:'action'),
  DictWord(french:'Mélanger',       english:'To stir',     moore:'Yɩɩgd',  dioula:'Bɔlɔ',  fulfulde:'Wullude',  emoji:'🥄', category:'action'),
  DictWord(french:'Laver',          english:'To wash',     moore:'peke',   dioula:'Fari',   fulfulde:'Fuɗude',   emoji:'🚿', category:'action'),
  DictWord(french:'Servir',         english:'To serve',    moore:'Kîssbo',  dioula:'Bò',     fulfulde:'Jaɓɓude',  emoji:'🫱', category:'action'),

  // ── Saveurs ──────────────────────────────────────────────────────
  DictWord(french:'Sucré',          english:'Sweet',   moore:'sikare',   dioula:'Di',         fulfulde:'Miiɗum',    emoji:'🍯', category:'saveur'),
  DictWord(french:'Pimenté',        english:'Spicy',   moore:'tiipare',   dioula:'Farin',      fulfulde:'Kaaniidum', emoji:'🌶️', category:'saveur'),
  DictWord(french:'Salé',           english:'Salty',   moore:'yamsum', dioula:'Sira-bɛ',   fulfulde:'Gauridum',  emoji:'🧂', category:'saveur'),
  DictWord(french:'Amer',           english:'Bitter',  moore:'toogo',   dioula:'Wɛrɛwɛrɛ',  fulfulde:'Miikidum',  emoji:'😬', category:'saveur'),
  DictWord(french:'Acide / Aigre',  english:'Sour',    moore:'miisga',   dioula:'Jɛni',      fulfulde:'Hiisidum',  emoji:'🍋', category:'saveur'),
];

// ── Catégories ────────────────────────────────────────────────────────
const _cats = [
  {'id':'all',       'fr':'Tout',       'en':'All',        'emoji':'📚', 'hex':0xFF607D8B},
  {'id':'politesse', 'fr':'Politesse',  'en':'Politeness', 'emoji':'🙏', 'hex':0xFF8E24AA},
  {'id':'aliment',   'fr':'Aliments',   'en':'Foods',      'emoji':'🥘', 'hex':0xFFBF4A0A},
  {'id':'ustensile', 'fr':'Ustensiles', 'en':'Utensils',   'emoji':'🍳', 'hex':0xFF1565C0},
  {'id':'action',    'fr':'Actions',    'en':'Actions',    'emoji':'👨‍🍳','hex':0xFF2E7D32},
  {'id':'saveur',    'fr':'Saveurs',    'en':'Flavors',    'emoji':'😋', 'hex':0xFFF57F17},
];

// ════════════════════════════════════════════════════════════════════
class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({super.key});
  @override
  State<DictionaryScreen> createState() => _DictionaryState();
}

class _DictionaryState extends State<DictionaryScreen> {
  String _cat = 'all';
  String _q   = '';
  final _ctrl = TextEditingController();

  @override
  void dispose() { _ctrl.dispose(); super.dispose(); }

  List<DictWord> get _filtered => _mots.where((w) {
    final matchCat = _cat == 'all' || w.category == _cat;
    final ql = _q.toLowerCase();
    final matchQ  = ql.isEmpty ||
        w.french.toLowerCase().contains(ql) ||
        w.english.toLowerCase().contains(ql) ||
        w.moore.toLowerCase().contains(ql)   ||
        w.dioula.toLowerCase().contains(ql)  ||
        w.fulfulde.toLowerCase().contains(ql);
    return matchCat && matchQ;
  }).toList();

  @override
  Widget build(BuildContext context) {
    final app   = context.watch<AppProvider>();
    final words = _filtered;

    return Scaffold(
      backgroundColor: app.background,
      body: Column(children: [

        // ── Header ──────────────────────────────────────────────────
        Container(
          color: app.appBarBg,
          child: SafeArea(bottom: false, child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                const Text('📖', style: TextStyle(fontSize: 26)),
                const SizedBox(width: 10),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(app.t('Dictionnaire de Cuisine', 'Culinary Dictionary'),
                      style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(app.t('Moore · Dioula · Fulfuldé', 'Mooré · Dioula · Fulfuldé'),
                      style: TextStyle(color: Colors.white.withOpacity(0.75), fontSize: 12)),
                ])),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text('${words.length} ${app.t("mots","words")}',
                      style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                ),
              ]),
              const SizedBox(height: 12),
              // Barre de recherche
              TextField(
                controller: _ctrl,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                onChanged: (v) => setState(() => _q = v),
                decoration: InputDecoration(
                  hintText: app.t('Chercher un mot...', 'Search a word...'),
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                  prefixIcon: const Icon(Icons.search, color: Colors.white70),
                  suffixIcon: _ctrl.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear, color: Colors.white70),
                          onPressed: () { _ctrl.clear(); setState(() => _q = ''); })
                      : null,
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.15),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ]),
          )),
        ),

        // ── Filtres catégorie ────────────────────────────────────────
        Container(
          color: app.surface,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: _cats.map((c) {
              final sel   = _cat == c['id'];
              final color = Color(c['hex'] as int);
              return GestureDetector(
                onTap: () => setState(() => _cat = c['id'] as String),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: sel ? color : color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: sel ? color : color.withOpacity(0.35), width: 1.5),
                  ),
                  child: Text(
                    '${c['emoji']} ${app.isEnglish ? c['en'] : c['fr']}',
                    style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w700,
                      color: sel ? Colors.white : color,
                    ),
                  ),
                ),
              );
            }).toList()),
          ),
        ),

        // ── En-têtes colonnes ────────────────────────────────────────
        Container(
          color: app.isDark ? const Color(0xFF1A0800) : const Color(0xFFF5E8D8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
          child: Row(children: [
            const SizedBox(width: 34),
            Expanded(flex: 3, child: Text(
              app.t('Français','French'),
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: app.accent))),
            Expanded(flex: 2, child: Text('Mooré',
                style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: Color(0xFF8E24AA)))),
            Expanded(flex: 2, child: Text('Dioula',
                style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: Color(0xFF1565C0)))),
            Expanded(flex: 2, child: Text('Fulfuldé',
                style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: Color(0xFF2E7D32)))),
            const SizedBox(width: 18),
          ]),
        ),

        // ── Liste ────────────────────────────────────────────────────
        Expanded(
          child: words.isEmpty
              ? Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text('🔍', style: TextStyle(fontSize: 50)),
                  const SizedBox(height: 12),
                  Text(app.t('Aucun mot trouvé.','No word found.'),
                      style: TextStyle(color: app.textSecondary, fontSize: 15)),
                ]))
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  itemCount: words.length,
                  itemBuilder: (ctx, i) => _WordCard(word: words[i], app: app),
                ),
        ),
      ]),
    );
  }
}

// ── Carte extensible ──────────────────────────────────────────────────────
class _WordCard extends StatefulWidget {
  final DictWord word;
  final AppProvider app;
  const _WordCard({required this.word, required this.app});
  @override
  State<_WordCard> createState() => _WordCardState();
}

class _WordCardState extends State<_WordCard> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    final w = widget.word;
    final app = widget.app;

    return GestureDetector(
      onTap: () => setState(() => _open = !_open),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: app.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: _open ? app.accent.withOpacity(0.5) : app.cardBorder,
            width: _open ? 1.5 : 1,
          ),
          boxShadow: _open
              ? [BoxShadow(color: app.accent.withOpacity(0.12), blurRadius: 10, offset: const Offset(0, 4))]
              : [],
        ),
        child: Column(children: [
          // Ligne compacte
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(children: [
              Text(w.emoji, style: const TextStyle(fontSize: 20)),
              const SizedBox(width: 8),
              // Français
              Expanded(flex: 3, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(w.french,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: app.textPrimary)),
                if (app.isEnglish)
                  Text(w.english,
                      style: TextStyle(fontSize: 10, color: app.textSecondary, fontStyle: FontStyle.italic)),
              ])),
              // Moore
              Expanded(flex: 2, child: Text(w.moore,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF8E24AA)))),
              // Dioula
              Expanded(flex: 2, child: Text(w.dioula,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF1565C0)))),
              // Fulfuldé
              Expanded(flex: 2, child: Text(w.fulfulde,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF2E7D32)))),
              // Flèche
              Icon(_open ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  size: 18, color: app.textSecondary),
            ]),
          ),

          // Zone étendue (prononciation)
          if (_open)
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: app.isDark ? const Color(0xFF2A1800) : const Color(0xFFFFF3E0),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(app.t('📣 Prononciation', '📣 Pronunciation'),
                    style: TextStyle(fontWeight: FontWeight.bold, color: app.accent, fontSize: 12)),
                const SizedBox(height: 10),
                _PronRow('Mooré',    w.moore,    const Color(0xFF8E24AA), app),
                const SizedBox(height: 6),
                _PronRow('Dioula',   w.dioula,   const Color(0xFF1565C0), app),
                const SizedBox(height: 6),
                _PronRow('Fulfuldé', w.fulfulde, const Color(0xFF2E7D32), app),
              ]),
            ),
        ]),
      ),
    );
  }
}

class _PronRow extends StatelessWidget {
  final String lang, word;
  final Color color;
  final AppProvider app;
  const _PronRow(this.lang, this.word, this.color, this.app);

  @override
  Widget build(BuildContext context) => Row(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(lang, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: color)),
        ),
        const SizedBox(width: 10),
        Expanded(child: Text(word,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: app.textPrimary))),
      ]);
}
