import 'Message.dart';

abstract class MessageCenterDelegate {
  /// 原生调用dart时的代理对象
  ///
  /// arguments must be jsonString
  ///
  /// 使用[MessageCenterDelegate]抛至业务
  ///
  /// [Dart]接受数据格式为[Message]
  ///
  /// 处理完[Native]对[Dart]的调用后，需要使用[Future][Message]回调至原生
  ///
  Future<Message> called(String method, Message messgae);
}
