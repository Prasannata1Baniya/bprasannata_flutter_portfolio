import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constant/colors.dart';
import 'package:flutter_portfolio/constant/nav_title.dart';
import 'package:flutter_portfolio/widgets/pb.dart';

class HeaderDesktop extends StatelessWidget {
  final void Function(int index) onNavTap;
  const HeaderDesktop({super.key, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      height: 64,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColors.cardBg.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.04),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          LogoPage(onTap: () {}),
          const Spacer(),

          // Clean, modern text links instead of heavy black boxes
          for (int i = 0; i < navigationTitle.length; i++)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextButton(
                key: Key('navigation_$i'),
                onPressed: () => onNavTap(i),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  overlayColor: AppColors.accentNeon.withValues(alpha: 0.08),
                ),
                child: Text(
                  navigationTitle[i],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/*
 "Home",
  "Skills",
  "Project",
  "Blog",
  "Contact",
 */