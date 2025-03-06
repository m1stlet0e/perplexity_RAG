import 'package:flutter/material.dart';
import 'package:perplexity_clone/services/chat_web_service.dart';
import 'package:perplexity_clone/theme/colors.dart';
import 'package:perplexity_clone/widgets/search_section.dart';
import 'package:perplexity_clone/widgets/side_bar.dart';



// 首页Widget，使用StatefulWidget以管理WebSocket连接状态
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// 首页状态类
class _HomePageState extends State<HomePage> {
  // 存储完整的响应文本
  String fullResponse = "";

  @override
  void initState() {
    super.initState();
    // 初始化时连接到WebSocket服务器
    ChatWebService().connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // 侧边导航栏
          const SideBar(),

          // 主要内容区域，包含搜索部分和页脚
          Expanded(
            child: Column(
              children: [
                // 搜索部分，使用Expanded使其占据剩余空间
                Expanded(child: SearchSection()),
                
                // 间隔
                Container(height: 20),

                // 页脚部分
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  // 使用Wrap自动换行显示页脚链接
                  child: const Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text("Pro", style: TextStyle(
                          color: AppColors.footerGrey,
                          fontSize: 16,
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text("Enterprise", style: TextStyle(
                          color: AppColors.footerGrey,
                          fontSize: 16,
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text("Store", style: TextStyle(
                          color: AppColors.footerGrey,
                          fontSize: 16,
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text("Blog", style: TextStyle(
                          color: AppColors.footerGrey,
                          fontSize: 16,
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text("Careers", style: TextStyle(
                          color: AppColors.footerGrey,
                          fontSize: 16,
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text("English(English)", style: TextStyle(
                          color: AppColors.footerGrey,
                          fontSize: 16,
                        )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}