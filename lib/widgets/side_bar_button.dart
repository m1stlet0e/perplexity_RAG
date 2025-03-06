import 'package:flutter/material.dart';
import 'package:perplexity_clone/theme/colors.dart';

// 侧边栏按钮组件，用于显示导航菜单项
class SideBarButton extends StatelessWidget {
  // 控制按钮是否处于折叠状态
  final bool isCollapsed;
  // 按钮图标
  final IconData icon;
  // 按钮文本
  final String text;

  const SideBarButton({
    super.key,
    required this.isCollapsed,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      // 根据折叠状态调整按钮内容的对齐方式
      mainAxisAlignment:
          isCollapsed ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        // 按钮图标容器
        Container(
          margin: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
          child: Icon(
            icon,
            color: AppColors.iconGrey,
            size: 24,
          ),
        ),
        // 根据折叠状态显示或隐藏按钮文本
        isCollapsed
            ? const SizedBox()
            : Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ],
    );
  }
}
