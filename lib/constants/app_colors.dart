import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primaryGold = Color(0xFFFFC15E);
  static const Color primaryBrown = Color(0xFF91573D);

  // Neutral Colors
  static const Color background = Color(0xFFFAFAFA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color darkGray = Color(0xFF333333);
  static const Color mediumGray = Color(0xFF666666);
  static const Color lightGray = Color(0xFF999999);
  static const Color border = Color(0xFFF0F0F0);
  static const Color cardBackground = Color(0xFFF8F8F8);
  static const Color divider = Color(0xFFDDDDDD);

  // Social Colors
  static const Color linkedIn = Color(0xFF74D1EA);
  static const Color github = Color(0xFF333333);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryGold, primaryBrown],
  );

  // Shadows
  static List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.05),
      blurRadius: 15,
      offset: const Offset(0, 5),
    ),
  ];

  static List<BoxShadow> hoverShadow = [
    BoxShadow(
      color: primaryGold.withValues(alpha: 0.3),
      blurRadius: 15,
      offset: const Offset(0, 5),
    ),
  ];

  // Helper methods for opacity
  static Color withOpacity(Color color, double opacity) {
    return color.withValues(alpha: opacity);
  }
}
