//in this class i aim to achieve 2 methods
//1.connect->connect to the backend server(setting up the connection)
//2.chat->to perform search operation on the backend server
// WebSocket聊天服务类，负责与后端服务器的通信
import 'package:web_socket_client/web_socket_client.dart';
import 'dart:convert';
import 'dart:async';

// 单例模式实现的聊天服务类
class ChatWebService {
  // 私有静态实例，确保全局只有一个ChatWebService实例
  static final _instance = ChatWebService._internal(); 
  // WebSocket连接对象，可为空
  WebSocket? _socket;

  // 工厂构造函数，返回单例实例
  factory ChatWebService() => _instance;

  // 私有构造函数，防止外部直接创建实例
  ChatWebService._internal();

  // 搜索结果的流控制器，用于存储和传递搜索结果
  final _searchResultController = StreamController<Map<String,dynamic>>();
  // 内容流控制器，用于存储和传递Gemini生成的内容
  final _contentController = StreamController<Map<String,dynamic>>();

  // 公开的搜索结果流，供外部监听
  Stream<Map<String,dynamic>> get searchResultStream => _searchResultController.stream;
  // 公开的内容流，供外部监听
  Stream<Map<String,dynamic>> get contentStream => _contentController.stream;

  // 连接到WebSocket服务器
  void connect() {
    // 创建WebSocket连接
    _socket = WebSocket(Uri.parse("ws://localhost:8000/ws/chat"));
    
    // 监听WebSocket消息
    _socket!.messages.listen((message) {
      // 解析JSON消息
      final data = json.decode(message);

      // 根据消息类型分发到不同的流
      if(data['type'] == 'search_result') {
        _searchResultController.add(data);
      }
      else if(data['type'] == 'content') {
        _contentController.add(data);
      }
    });
  }

  // 发送聊天查询
  void chat(String query) {
    // 发送查询到服务器
    _socket!.send(json.encode({'query': query}));
  }
}