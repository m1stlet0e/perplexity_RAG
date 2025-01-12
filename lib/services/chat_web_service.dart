//in this class i aim to achieve 2 methods
//1.connect->connect to the backend server(setting up the connection)
//2.chat->to perform search operation on the backend server
import 'package:web_socket_client/web_socket_client.dart';
import 'dart:convert';

class ChatWebService{
    WebSocket? _socket;//making it a private variable
    void connect(){
        //in this i will connect to the backend and start listening to the particular websocket port so that whenever the server start sending message
        //to us,we listen to them and store them with us

        _socket=WebSocket(Uri.parse("ws://localhost:8000/ws/chat"));//u can also store the data in dotenv file and the retrieve here
        //socket is connected now we need to listen to the messages
        _socket!.messages.listen((message){//!->since it is no longer nullable

        final data =json.decode(message);//decode will convert the json string to map
            print(data['type']);//every msg that i send has a type
        });
        //since i already k that message will be in json or map so i can convert it to json format or map and then use it(we have send_json in main.py)
    }
    void chat(String query){
        //basically tells the server that hey listen the sent button was clicked ,so send the query over to the websocket and then our connect fxn is anyways listening to all the data
        //whenever the user clicks the send button,we will send the query to the server

        _socket!.send({'query':query});//socket is not null since we assume that connect is always called before chat is called
        //but still i posiibilty exists that chat is called before connect is called so we can use assert to check that
    }
  
}