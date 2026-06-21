import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constant/colors.dart';
import 'package:flutter_portfolio/constant/nav_title.dart';

class DrawerPage extends StatelessWidget {
  final void Function(int index) onNavTap;
  const DrawerPage({super.key, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.scaffoldBg,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              color: Colors.white.withValues(alpha: 0.03),
              width: 1,
            ),
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close, color: Colors.white, size: 28),
                  hoverColor: AppColors.accentNeon.withValues(alpha: 0.1),
                  splashColor: Colors.transparent,
                ),
              ),
              const SizedBox(height: 16),

              // Navigation Links List
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: iconsData.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                        hoverColor: AppColors.cardBg,
                        leading: Icon(
                          iconsData[i],
                          color: AppColors.textMuted,
                          size: 22,
                        ),
                        title: Text(
                          navigationTitle[i],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.3,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white.withValues(alpha: 0.15),
                          size: 12,
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          onNavTap(i);
                        },
                      ),
                    );
                  },
                ),
              ),

              // Premium branding signature at the bottom
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  "PB . PORTFOLIO",
                  style: TextStyle(
                    color: AppColors.textMuted.withValues(alpha: 0.4),
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

