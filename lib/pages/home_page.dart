import 'package:flutter/material.dart';
import 'package:perplexity_clone/theme/colors.dart';
import 'package:perplexity_clone/widgets/search_section.dart';
import 'package:perplexity_clone/widgets/side_bar.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Row(
        children: [
          //side navbar
          const SideBar(),


          //column containg 3 things-text,search bar and footer
          Expanded(//by using expanded,we are telling the column to take as much space as it can, that is take the entire height
          //when we use this widget in a row, it will take the entire width
            child: Column(
              children: [
                //text
                const Expanded(child: SearchSection()),
                //search bar
                Container(
                  height: 20,
                ),
                //footer
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  //we used wrap instead of row because wrap will automatically wrap the children to the next line if the width is not enough
                  child: const Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal:12),
                        child:Text("Pro",style:TextStyle(
                          color:AppColors.footerGrey,
                          fontSize: 16,)),
                        ),
                        Padding(
                        padding: EdgeInsets.symmetric(horizontal:12),
                        child:Text("Enterprise",style:TextStyle(
                          color:AppColors.footerGrey,
                          fontSize: 16,)),
                        ),
                        Padding(
                        padding: EdgeInsets.symmetric(horizontal:12),
                        child:Text("Store",style:TextStyle(
                          color:AppColors.footerGrey,
                          fontSize: 16,)),
                        ),
                        Padding(
                        padding: EdgeInsets.symmetric(horizontal:12),
                        child:Text("Blog",style:TextStyle(
                          color:AppColors.footerGrey,
                          fontSize: 16,)),
                        ),
                        Padding(
                        padding: EdgeInsets.symmetric(horizontal:12),
                        child:Text("Careers",style:TextStyle(
                          color:AppColors.footerGrey,
                          fontSize: 16,)),
                        ),
                        Padding(
                        padding: EdgeInsets.symmetric(horizontal:12),
                        child:Text("English(English)",style:TextStyle(
                          color:AppColors.footerGrey,
                          fontSize: 16,)),
                        )

                    ],),
                ),
                
              ],
            ),
          ),
        ],
      )
    );
  }
}