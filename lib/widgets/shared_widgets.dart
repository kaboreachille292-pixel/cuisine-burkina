import 'package:flutter/material.dart';

// ── Image de recette avec fallback ────────────────────────────────────────
Widget recipeImage(String path, double? w, double? h,
    {BoxFit fit = BoxFit.cover}) {
  return Image.asset(
    path,
    width: w,
    height: h,
    fit: fit,
    errorBuilder: (_, __, ___) => Container(
      width: w,
      height: h,
      color: const Color(0xFFF5E6D8),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.restaurant, size: 36, color: Color(0xFFBF4A0A)),
          SizedBox(height: 4),
          Text('Photo', textAlign: TextAlign.center,
              style: TextStyle(fontSize: 9, color: Color(0xFFBF4A0A))),
        ],
      ),
    ),
  );
}

// ── Badge de difficulté ───────────────────────────────────────────────────
Widget diffBadge(String diff) {
  final map = {
    'Facile':    [const Color(0xFF2E7D32), const Color(0xFFE8F5E9)],
    'Moyen':     [const Color(0xFFF57F17), const Color(0xFFFFFDE7)],
    'Difficile': [const Color(0xFFC62828), const Color(0xFFFFEBEE)],
    'Easy':      [const Color(0xFF2E7D32), const Color(0xFFE8F5E9)],
    'Medium':    [const Color(0xFFF57F17), const Color(0xFFFFFDE7)],
    'Hard':      [const Color(0xFFC62828), const Color(0xFFFFEBEE)],
  };
  final colors = map[diff] ?? [Colors.grey, Colors.grey.shade100];
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
    decoration: BoxDecoration(
      color: colors[1] as Color,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(diff,
        style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w700,
            color: colors[0] as Color)),
  );
}
