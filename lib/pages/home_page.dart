import 'package:flutter/material.dart';
import 'package:perplexity_clone/widgets/side_bar.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Row(
        children: [
          //side navbar
          SideBar(),


          //column containg 3 things-text,search bar and footer
          Column(
            children: [
              //text
              
              //search bar
              
              //footer
              
            ],
          ),
        ],
      )
    );
  }
}