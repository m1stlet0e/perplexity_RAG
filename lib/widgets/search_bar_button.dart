import 'package:flutter/material.dart';
import 'package:perplexity_clone/theme/colors.dart';

// 搜索栏按钮组件，用于显示带有图标和文本的可交互按钮
class SearchBarButton extends StatefulWidget {
  // 按钮图标
  final IconData icon;
  // 按钮文本
  final String text;
  const SearchBarButton({super.key, required this.icon, required this.text});

  @override
  State<SearchBarButton> createState() => _SearchBarButtonState();
}

// 搜索栏按钮状态类
class _SearchBarButtonState extends State<SearchBarButton> {
  // 鼠标悬停状态标志
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      // 鼠标进入时更新悬停状态
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });
      },
      // 鼠标离开时更新悬停状态
      onExit: (event) => setState(() {
        isHovered = false;
      }),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        // 根据悬停状态改变按钮背景色
        decoration: BoxDecoration(
          color: isHovered ? AppColors.proButton : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            // 按钮图标
            Icon(
              widget.icon,
              color: AppColors.iconGrey,
              size: 20,
            ),
            const SizedBox(width: 8),
            // 按钮文本
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
