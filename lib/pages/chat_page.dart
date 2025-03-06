import 'package:flutter/material.dart';
import 'package:perplexity_clone/theme/colors.dart';

import '../widgets/answer_section.dart';
import '../widgets/side_bar.dart';
import '../widgets/sources_section.dart';

// 聊天页面Widget，显示问题、来源和回答
class ChatPage extends StatelessWidget {
  // 存储用户输入的问题
  final String question;
  const ChatPage({super.key, required this.question});

  // StreamBuilder(
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // 侧边导航栏
          const SideBar(),
          const SizedBox(width: 100),
          // 主要内容区域，使用SingleChildScrollView使内容可滚动
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 显示用户问题
                    Text(
                      question,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
              
                    // 来源部分，使用独立Widget以优化性能
                    // 当WebSocket数据更新时只重建这部分UI
                    SourcesSection(),
              
                    SizedBox(
                      height: 24,
                    ),
              
                    // 回答部分，同样使用独立Widget
                    AnswerSection(),
                  ],
                ),
              ),
            ),
          ),
          // 占位Widget，用于保持布局平衡
          Placeholder(
            strokeWidth: 0,
            color:AppColors.background,
          ),
        ],
      ),
    );
  }
}
// 使用Skeletonizer实现加载时的骨架屏效果
// 在数据加载过程中显示shimmer效果提升用户体验