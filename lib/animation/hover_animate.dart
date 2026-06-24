import 'package:flutter/material.dart';
class HoverProjectCard extends StatefulWidget {
  final Widget child;

  const HoverProjectCard({super.key, required this.child});

  @override
  State<HoverProjectCard> createState() => _HoverProjectCardState();
}

class _HoverProjectCardState extends State<HoverProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutQuad,
        transform: Matrix4.diagonal3Values(
            isHovered ? 1.05 : 1.0,
            isHovered ? 1.05 : 1.0,
            1.0
        ),
        transformAlignment: Alignment.center,
        decoration: BoxDecoration(
          boxShadow: isHovered
              ? [BoxShadow(color: Colors.black.withValues(alpha: 0.3), blurRadius: 20, offset: const Offset(0, 10))]
              : [],
        ),
        child: widget.child,
      ),
    );
  }
}
