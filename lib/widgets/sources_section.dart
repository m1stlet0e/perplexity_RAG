

import 'package:flutter/material.dart';
import 'package:perplexity_clone/services/chat_web_service.dart';
import 'package:perplexity_clone/theme/colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SourcesSection extends StatefulWidget {
  const SourcesSection({super.key});

  @override
  State<SourcesSection> createState() => _SourcesSectionState();
}

class _SourcesSectionState extends State<SourcesSection> {
  bool isLoading = true;
  // List searchResults = [];//in debug console ,we find that it was of the type JSarray,so we dropped map<string,dynamic>>
  //dummy data
  List searchResults = [
    {
      'title': 'Ind vs Aus Live Score 4th Test',
      'url':
          'https://www.moneycontrol.com/sports/cricket/ind-vs-aus-live-score-4th-test-shubman-gill-dropped-australia-win-toss-opt-to-bat-liveblog-12897631.html',
    },
    {
      'title': 'Ind vs Aus Live Boxing Day Test',
      'url':
          'https://timesofindia.indiatimes.com/sports/cricket/india-vs-australia-live-score-boxing-day-test-2024-ind-vs-aus-4th-test-day-1-live-streaming-online/liveblog/116663401.cms',
    },
    {
      'title': 'Ind vs Aus - 4 Australian Batters Score Half Centuries',
      'url':
          'https://economictimes.indiatimes.com/news/sports/ind-vs-aus-four-australian-batters-score-half-centuries-in-boxing-day-test-jasprit-bumrah-leads-indias-fightback/articleshow/116674365.cms',
    },
  ];
  @override
  void initState() {
    super.initState();
    ChatWebService().searchResultStream.listen((data) {
      setState(() {
        // searchResults.add(data['data']);//we are adding list of search results to the search results list->we don't want
        //main.py file is sending data in the form of a dictionary,so we are adding that data to the search results(sorted_results)
      //coz sorted results contains 2 thing->title and url

      searchResults = data['data'];
      isLoading = false;
      });
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.source_outlined,
              color: Colors.white70,
            ),
            SizedBox(width: 8),
            Text(
              "Sources",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        SizedBox(height: 16),
        //why wrap?coz if the sources card extend the width of how much width is available,we want to move to the next line
        Skeletonizer(
          enabled: isLoading,
          child: Wrap(
            spacing: 16,//how much space bw the mainaxis
            runSpacing: 16,//how much space bw the crossaxis
            children: searchResults.map((res){
              //for every search result,we are going to return a source card
              //it is a container that has 2 elements vertically laid out,i.e column
              return Container(
                width: 150,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      res['title'] ?? 'No title',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      res['url'] ?? 'No URL',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,//.... if we run out of space
                    ),
                  ],
                ),
              );
            }).toList(),//mapping thru every search result,and whenever we get a serach result we are returning a widget from there(creating a list of widgets based on these results)
          ),
        ),
      ],
    );
  }
}