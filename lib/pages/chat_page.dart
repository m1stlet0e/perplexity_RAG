import 'package:flutter/material.dart';
//staeful widget since we are going to listen to streams- i will be going to do that in init state
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // StreamBuilder(
  //                 stream: ChatWebService().contentStream, 
  //                 builder: (context,snapshot){
  //                   if(snapshot.connectionState==ConnectionState.waiting){
  //                     return const Center(child:CircularProgressIndicator());
  //                   }

  //                   fullResponse = snapshot.data?['data']??'';//hey this data can be null,but if it is null then  we are going to treat it as an empty string,otherwise just append this data
  //                   return Text(fullResponse);
  //                   // return Text(snapshot.data()['content']);
  //                 }),//as soon as the content stream changes,the data is going to get updated,so that content will be changed
                
  //                 //india vs australia->X
  //                 //india,then india will be replaced by australia                
  //                 //it's not the entire text that has already been given to us in the past,it is just reflection of what data gemini is sending to us

  //                 //but when we use the fullresponse string it will be india vs australia full text(past+latest stream data)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}