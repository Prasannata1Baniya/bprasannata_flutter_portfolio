
import 'package:flutter/material.dart';

class AppColors {
  static const Color scaffoldBg = Color(0xff0A0A0C);
  static const Color cardBg = Color(0xff141416);

  // Neon Accents
  static const Color accentNeon = Color(0xff00E5FF);
  static const Color textMuted = Color(0xff9E9EAF); //soft gray

  // Gradients
  static const Gradient primaryGradient = LinearGradient(
    colors: [Color(0xff00E5FF), Color(0xff7209B7)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}