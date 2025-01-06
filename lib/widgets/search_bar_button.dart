import 'package:flutter/material.dart';
import 'package:perplexity_clone/theme/colors.dart';

class SearchBarButton extends StatefulWidget {
  final IconData icon;
  final String text;
  const SearchBarButton({super.key, required this.icon, required this.text});

  @override
  State<SearchBarButton> createState() => _SearchBarButtonState();
}

class _SearchBarButtonState extends State<SearchBarButton> {
  bool isHovered = false;//will use mouse region to change the size of the button when hovered
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) => setState(() {
        isHovered = false;
      }),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color:isHovered?AppColors.proButton: Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            Icon(
              widget.icon,
              color: AppColors.iconGrey,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              widget.text,
              style: const TextStyle(
                color: AppColors.textGrey,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
