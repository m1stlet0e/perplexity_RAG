import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:perplexity_clone/services/chat_web_service.dart';
import 'package:skeletonizer/skeletonizer.dart';

// 回答部分Widget，用于显示AI的回答内容
class AnswerSection extends StatefulWidget {
  const AnswerSection({super.key});

  @override
  State<AnswerSection> createState() => _AnswerSectionState();
}

// 回答部分状态类
class _AnswerSectionState extends State<AnswerSection> {
  // 加载状态标志
  bool isLoading = true;
  // 存储完整的回答文本
  String fullResponse = '''
As of the end of Day 1 in the fourth Test match between India and Australia, the score stands at **Australia 311/6**. The match is being held at the Melbourne Cricket Ground (MCG) on December 26, 2024.

## Match Overview
- **Toss**: Australia won the toss and opted to bat first.
- **Top Performers**:
  - **Steve Smith** is currently unbeaten on **68 runs** from **111 balls**.
  - **Sam Konstas**, making his Test debut, scored a significant **60 runs** from **65 balls**, contributing to a strong start for Australia.
  - Other notable contributions include Usman Khawaja and Marnus Labuschagne, both adding valuable runs to the total.

## Session Highlights
- In the first session, Australia reached **112 runs for the loss of one wicket**, with Konstas and Khawaja building an impressive opening partnership of **89 runs** before Konstas was dismissed by Ravindra Jadeja.
- After lunch, Australia maintained their momentum but faced a collapse as Jasprit Bumrah struck back, taking crucial wickets that brought India back into contention. Australia went from a strong position of **223/2** to **263/5** at one point, losing three wickets for just nine runs.

## Bowling Performance
- Indian bowlers had mixed success throughout the day. While Bumrah was effective in the latter stages, picking up key wickets, Jadeja also contributed by taking the first wicket of Konstas.
- Other bowlers like Akash Deep and Washington Sundar chipped in with one wicket each, helping to restrict Australia's scoring after a dominant start.

## Current Situation
As play concluded for the day, Australia stood at **311/6**, with Steve Smith holding firm as India looks to capitalize on their late breakthroughs on Day 2. The match remains finely balanced, with both teams having opportunities to seize control as they progress through this critical Test match in the Border-Gavaskar Trophy series[1][2][3][5].
''';

  @override
  void initState() {
    // 初始化状态
    super.initState();
    // 监听内容流，更新UI显示
    ChatWebService().contentStream.listen((data) {
      if (isLoading) {
        fullResponse = "";//当收到第一条数据时，清空fullResponse
      }
      setState(() {
        fullResponse +=data['data'] ;
        isLoading = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Perplexity',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),


        //we don't want text widget,we want a markdown

        Skeletonizer(
          enabled: isLoading,
          child: Markdown(data: fullResponse,
          shrinkWrap: true,
          //special arrangements u can do with markdown like u can change how a code block looks like
          styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(//theme.of(context) means that go to the material app or the closest themedata u can find in the widget tree ans since we have define it only in the material app,so it will go there
            //h1->#
            //h2->##
            //h3->###
            codeblockDecoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(4),
            ),
            code: const TextStyle(fontSize: 14,fontFamily: 'monospace')
          ),
          ),
        )
      ],
    );
  }
}
