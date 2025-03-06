import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perplexity_clone/theme/colors.dart';
import 'package:perplexity_clone/widgets/search_bar_button.dart';

import '../pages/chat_page.dart';
import '../services/chat_web_service.dart';

// 搜索部分Widget，包含搜索框和按钮
class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

// 搜索部分状态类
class _SearchSectionState extends State<SearchSection> {
  // 搜索输入控制器
  final queryController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    // 释放控制器资源
    queryController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 标题文本
        Text("Where knowledge begins",
            style: GoogleFonts.ibmPlexMono(
              fontSize: 40,
              fontWeight: FontWeight.w400,
              letterSpacing: -0.5,
            )),
        const SizedBox(
          height: 32,
        ),
        // 搜索框容器
        Container(
            width: 700,
            decoration: BoxDecoration(
                color: AppColors.searchBar,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.searchBarBorder,
                    width: 1.5)),
            child: Column(
              children: [
                // 搜索输入框
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextField(
                    controller: queryController,
                    decoration: InputDecoration(
                      hintText: "Search anything...",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: AppColors.textGrey,
                        fontSize: 16,
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                // 底部按钮栏
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      // Focus按钮
                      const SearchBarButton(
                        icon: Icons.auto_awesome_outlined,
                        text: 'Focus',
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      // Attach按钮
                      const SearchBarButton(
                        icon: Icons.add_circle_outline_outlined,
                        text: 'Attach',
                      ),
                      const Spacer(),
                      // 提交按钮
                      GestureDetector(
                        onTap: (){
                          // 发送查询并导航到聊天页面
                          ChatWebService().chat(queryController.text.trim());
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context)=>ChatPage(question: queryController.text.trim(),),)
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(9),
                          decoration: BoxDecoration(
                            color: AppColors.submitButton,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: const Icon(Icons.arrow_forward,
                              color: AppColors.background),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }
}

