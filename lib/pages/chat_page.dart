import 'package:flutter/material.dart';
import 'package:perplexity_clone/theme/colors.dart';

import '../widgets/answer_section.dart';
import '../widgets/side_bar.dart';
import '../widgets/sources_section.dart';

//stateful widget since we are going to listen to streams- i will be going to do that in init state
class ChatPage extends StatelessWidget {
  final String question;
  const ChatPage({super.key, required this.question});

  // StreamBuilder(
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          //side navbar
          const SideBar(),
          const SizedBox(width: 100),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
              
                    //list of sources-create this in diff widgets because when we are try to get all the sources we are going to get this dynamically from our websocket,so i will be updating only that particular widget and not the rest of the scaffold
                    //why are we doing this? because we are going to listen to the stream and as soon as the stream changes,we are going to update the widget
                    //what if not done?then we will have to call init state ,we will be listening to the stream and whenever we get our data ,we will call set state,that means it will build the entire build fxn again,all those components including ans section will rebuild,which is not required
                    //so we will call init state only in the source section widget,so that only that particular widget rebuilds
                    //so we can convert this pg into stless widget
                    SourcesSection(),
              
                    SizedBox(
                      height: 24,
                    ),
              
                    //answer section-for the same reasons as above,we are going to create a new widget for this
                    AnswerSection(),
                  ],
                ),
              ),
            ),
          ),
          Placeholder(
            strokeWidth: 0,
            color:AppColors.background,
          ),
        ],
      ),
    );
  }
}
//i want a ui skelationizer when the data is being loaded and processing since the ui looks empty
//skelaton loader->shimmer effect before the data comes
//documentation->wrap our layout with skealtionizer widget and give it a tag of enabled