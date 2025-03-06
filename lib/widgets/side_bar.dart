import 'package:flutter/material.dart';
import 'package:perplexity_clone/theme/colors.dart';
import 'package:perplexity_clone/widgets/side_bar_button.dart';

// 侧边栏Widget，可折叠展开的导航菜单
class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

// 侧边栏状态类
class _SideBarState extends State<SideBar> {
  // 控制侧边栏是否折叠的状态
  bool isCollapsed = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      // 设置动画持续时间
      duration: const Duration(milliseconds: 300),
      // 根据折叠状态动态调整宽度
      width: isCollapsed ? 64 : 150,
      color: AppColors.sideNav,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          // 顶部Logo图标
          Icon(
            Icons.auto_awesome_mosaic_rounded,
            color: AppColors.whiteColor,
            size: isCollapsed ? 30 : 60,
          ),
          // 导航按钮列表区域
          Expanded(
            child: Column(
              crossAxisAlignment:
                  isCollapsed ? CrossAxisAlignment.center : CrossAxisAlignment.start,
              children: [
                
                const SizedBox(
                  height: 30,
                ),
                // 各个导航按钮
                SideBarButton(
                    isCollapsed: isCollapsed, icon: Icons.add, text: "Home"),
                SideBarButton(
                    isCollapsed: isCollapsed, icon: Icons.search, text: "Search"),
                SideBarButton(
                    isCollapsed: isCollapsed, icon: Icons.language, text: "Spaces"),
                SideBarButton(
                    isCollapsed: isCollapsed, icon: Icons.auto_awesome, text: "Discover"),
                SideBarButton(
                    isCollapsed: isCollapsed, icon: Icons.cloud_outlined, text: "Library"),
                const Spacer(),
                
              ],
            ),
          ),
          // 底部折叠/展开按钮
          GestureDetector(
                  onTap: () {
                    setState(() {
                      isCollapsed = !isCollapsed;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                    child: Icon(
                      isCollapsed
                          ? Icons.keyboard_arrow_right_outlined
                          : Icons.keyboard_arrow_left_outlined,
                      color: AppColors.iconGrey,
                      size: 24,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
        ],
      ),
    );
  }
}
