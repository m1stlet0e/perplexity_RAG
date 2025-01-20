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

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  final queryController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    queryController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Where knowledge begins",
            style: GoogleFonts.ibmPlexMono(
              fontSize: 40,
              fontWeight: FontWeight.w400,
              letterSpacing: -0.5,
            )),
        const SizedBox(
          height: 32,
        ),
        Container(
            width: 700,
            decoration: BoxDecoration(
                color: AppColors.searchBar,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.searchBarBorder,
                    width: 1.5)),
            child: Column(
              children: [
                //textfield and not a text form field because i am not validating anything
                //it is just a form where i can put enter
                 Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextField(
                    controller: queryController,
                    decoration: InputDecoration(
                      hintText: "Search anything...",
                      border: InputBorder.none,
                      // prefixIcon: Icon(Icons.search),
                      hintStyle: TextStyle(
                        color: AppColors.textGrey,
                        fontSize: 16,
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.zero,//compresses the padding
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      const SearchBarButton(
                        icon: Icons.auto_awesome_outlined,
                        text: 'Focus',
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      const SearchBarButton(
                        icon: Icons.add_circle_outline_outlined,
                        text: 'Attach',
                      ),
                      const Spacer(),
                      //a button which searches the content when we clicks on it-submit button
                      GestureDetector(
                        onTap: (){
                          ChatWebService().chat(queryController.text.trim());//created an instance and called the chat fxn
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context)=>ChatPage(question: queryController.text.trim(),),)
                          );
                        },//u can check other types of validation too to perform but i am just performing a simple framework
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

