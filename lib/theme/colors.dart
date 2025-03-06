// 导入Material Design颜色系统
import 'package:flutter/material.dart';

// 应用程序的颜色主题类
class AppColors {
  // 应用主背景色
  static const background = Color.fromRGBO(25, 26, 26, 1);
  // 侧边导航栏背景色
  static const sideNav = Color.fromRGBO(32, 34, 34, 1);
  // 搜索栏背景色
  static const searchBar = Color.fromRGBO(32, 34, 34, 1);
  // 搜索栏边框色
  static const searchBarBorder = Color.fromRGBO(60, 63, 64, 1);
  // 图标灰色
  static const iconGrey = Color(0xFF909090);
  // 文本灰色
  static const textGrey = Color(0xFFAAAAAA);
  // 页脚文本灰色
  static const footerGrey = Color(0xFF737373);
  // Pro按钮背景色
  static const proButton = Color.fromRGBO(47, 48, 47, 1);
  // 卡片背景色
  static const cardColor = Color(0xFF262626);
  // 提交按钮背景色
  static const submitButton = Color.fromRGBO(27, 185, 206, 1);
  // 白色
  static const whiteColor = Colors.white;
}

// 所有颜色都被定义为静态常量，可以直接通过类名访问
// 无需创建AppColors实例即可使用这些颜色值
// 例如：AppColors.background 而不是 AppColors().background