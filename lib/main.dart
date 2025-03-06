import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perplexity_clone/pages/chat_page.dart';
import 'package:perplexity_clone/pages/home_page.dart';
import 'package:perplexity_clone/theme/colors.dart';

// 应用程序的入口点
void main() {
  runApp(const MyApp());
}

// 应用程序的根Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // 构建应用程序的UI结构
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // 配置应用程序的主题
      theme: ThemeData(
       // 设置应用背景色
       scaffoldBackgroundColor:  AppColors.background,
       // 设置颜色主题
       colorScheme: ColorScheme.fromSeed(seedColor:AppColors.submitButton),
       // 配置文本主题，使用Google Fonts的Inter字体
       textTheme:GoogleFonts.interTextTheme(
        // 使用深色主题的文本样式并进行自定义
        ThemeData.dark().textTheme.copyWith(
          bodyMedium:const TextStyle(
            fontSize: 15,
            color:AppColors.whiteColor,
            ), 
        ),
       ),
      ),
      // 移除debug标签
      debugShowCheckedModeBanner: false,
      // 设置首页
      home: const HomePage(),
    );
  }
}

