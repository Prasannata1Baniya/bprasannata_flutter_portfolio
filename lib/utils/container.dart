import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constant/colors.dart';

Widget textBlack(String data, {double fontSize = 24}) {
  return Text(
    data,
    style: TextStyle(
      color: Colors.black,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget textWhite(String data, {double fontSize = 24}) {
  return Text(
    data,
    style: TextStyle(
      color: Colors.white,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    ),
  );
}

// PREMIUM DESKTOP SKILLS CARD
Widget skillsForContainer(String text, String imageData, double fontSize) {
  return Container(
    width: 120,
    height: 145,
    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: AppColors.cardBg,
      border: Border.all(
        color: Colors.white.withValues(alpha: 0.06),
        width: 1.5,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.4),
          blurRadius: 16,
          offset: const Offset(0, 8),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize > 16 ? 14 : fontSize,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 12),
        Expanded(
          child: Image.asset(
            imageData,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => const Icon(
              Icons.code,
              size: 30,
              color: AppColors.accentNeon,
            ),
          ),
        ),
      ],
    ),
  );
}

//Project Container
Widget containerForProjects({
  required VoidCallback onTap,
  required String title,
  required String subTitle,
  required String image,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        constraints: const BoxConstraints(
          maxWidth: 580,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: AppColors.cardBg,
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.05),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.accentNeon.withValues(alpha: 0.1),
                      blurRadius: 8,
                    )
                  ]
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  image,
                  height: 90,
                  width: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey.shade900,
                    width: 120,
                    height: 90,
                    child: const Icon(Icons.broken_image, color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20.0),

            // Flexible Details Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.3,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subTitle,
                    style: const TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 13,
                      height: 1.45,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.textMuted),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget containerForContacts(IconData? iconData, VoidCallback launchUrl) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: IconButton(
      onPressed: launchUrl,
      hoverColor: AppColors.accentNeon.withValues(alpha: 0.1),
      icon: Icon(
        iconData ?? Icons.error,
        size: 36,
        color: Colors.white,
      ),
    ),
  );
}

