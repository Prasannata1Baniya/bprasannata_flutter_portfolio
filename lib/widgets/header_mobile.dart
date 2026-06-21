import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constant/colors.dart';
import 'package:flutter_portfolio/widgets/pb.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({
    super.key,
    this.onLogoTab,
    this.menuTab,
  });

  final VoidCallback? onLogoTab;
  final VoidCallback? menuTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 56,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColors.cardBg.withValues(alpha:0.6),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.white.withValues(alpha:0.04),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:0.2),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          LogoPage(onTap: onLogoTab),
          const Spacer(),
          IconButton(
            onPressed: menuTab,
            hoverColor: AppColors.accentNeon.withValues(alpha:0.1),
            splashColor: Colors.transparent,
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
