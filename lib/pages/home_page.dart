import 'package:flutter/material.dart';
import 'package:perplexity_clone/services/chat_web_service.dart';
import 'package:perplexity_clone/theme/colors.dart';
import 'package:perplexity_clone/widgets/search_section.dart';
import 'package:perplexity_clone/widgets/side_bar.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String fullResponse = "";


  @override
  void initState() {
    // TODO: implement initState
    
    super.initState();
    ChatWebService().connect();//this will connect to the backend server
  }
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
                Expanded(child: SearchSection()),
                //search bar
                Container(
                  height: 20,
                ),



                // StreamBuilder(
                //   stream: ChatWebService().contentStream, 
                //   builder: (context,snapshot){
                //     if(snapshot.connectionState==ConnectionState.waiting){
                //       return const Center(child:CircularProgressIndicator());
                //     }

                //     fullResponse = snapshot.data?['data']??'';//hey this data can be null,but if it is null then  we are going to treat it as an empty string,otherwise just append this data
                //     return Text(fullResponse);
                //     // return Text(snapshot.data()['content']);
                //   }),//as soon as the content stream changes,the data is going to get updated,so that content will be changed
                
                  //india vs australia->X
                  //india,then india will be replaced by australia                
                  //it's not the entire text that has already been given to us in the past,it is just reflection of what data gemini is sending to us

                  //but when we use the fullresponse string it will be india vs australia full text(past+latest stream data)

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