import 'dart:convert';
import 'package:flutter/material.dart';
import 'Message.dart';
import 'package:flutter/services.dart';

import 'MessageCenterDelegate.dart';

/*
 - 各端请注册 FlutterMethodChannels.kBaseMethodChannel 方法通道
 - 各端方法调用、回调和【FlutterMethods】一致
 - [Dart] 调用 [Native]: call(method:message)
 - [Native] 调用 [Dart]: called(method:arguments)
 */

const _kBaseMethodChannel = "com.dy.base.methodChannel"; // 基础方法通道

class MessageCenter {
  static MethodChannel _baseMethodChannel;

  static MessageCenterDelegate _delegate;

  static void engine(MessageCenterDelegate delegate) {
    if (_delegate == null) _delegate = delegate;
    if (_baseMethodChannel == null) {
      _baseMethodChannel = MethodChannel(_kBaseMethodChannel);
      _baseMethodChannel.setMethodCallHandler((MethodCall call) async {
        return await _called(call.method, call.arguments);
      });
    }
  }

  /// [Dart] 调用 [Native]
  ///
  /// 使用[Message]入参
  ///
  static Future<Message> call(String method, [Message message]) async {
    var jsonObjectOfMessage;
    try {
      jsonObjectOfMessage = message.toJson();
    } catch (error) {
      debugPrint(
          "native call dart, arguments message cast to json object failed, error = $error");
    }

    debugPrint('>>> '
        'dart call native | '
        '\nmethod = $method, \narguments = $jsonObjectOfMessage <<<\n\n');

    var jsonStringOfMessage;
    try {
      jsonStringOfMessage = jsonEncode(jsonObjectOfMessage);
    } catch (error) {
      debugPrint('>>>【ERROR in MessageCenter】 '
          'dart call native | '
          'arguments json object cast to json string failed, error = $error'
          '\nmethod = $method, \narguments = $jsonObjectOfMessage <<<\n\n');
    }

    var jsonStringOfResult;
    try {
      jsonStringOfResult =
          await _baseMethodChannel.invokeMethod(method, jsonStringOfMessage);
    } on Exception catch (error) {
      debugPrint('>>>【ERROR in MessageCenter】'
          'dart call native | '
          'method maybe not implementation, please ignore, error = $error'
          '\nmethod = $method, \narguments = $jsonObjectOfMessage <<< \n\n');
    }

    var jsonObjectOfResult;
    try {
      jsonObjectOfResult = jsonDecode(jsonStringOfResult);
    } catch (error) {
      debugPrint('>>>【ERROR in MessageCenter】'
          'dart call native | '
          'result json string cast to json object failed, error = $error'
          '\nmethod = $method, \narguments = $jsonObjectOfMessage <<<\n\n');
      return null;
    }

    debugPrint('>>>'
        'dart call native result | '
        '\nmethod = $method, \narguments = $jsonObjectOfMessage, \nresult json object = $jsonObjectOfResult <<< \n\n');

    var messageOfResult;
    try {
      messageOfResult = Message.fromJson(jsonObjectOfResult);
    } catch (error) {
      debugPrint('>>>【ERROR in MessageCenter】'
          'dart call native | '
          'result json object cast to message failed, error = $error'
          '\nmethod = $method, \narguments = $jsonObjectOfMessage <<<\n\n');
    }
    return messageOfResult;
  }

  /// [Native] 调用 [Dart]
  ///
  /// arguments must be jsonString
  ///
  /// 使用[MessageCenterDelegate]抛至业务
  ///
  static Future _called(String method, [String arguments]) async {
    debugPrint('>>> '
        'native call dart | '
        '\nmethod = $method, \narguments = $arguments <<<\n\n');

    var jsonObjectOfArguments;
    try {
      jsonObjectOfArguments = jsonDecode(arguments); // json
    } catch (error) {
      debugPrint('>>>【ERROR in MessageCenter】 '
          'native call dart | '
          'arguments json string cast to json object failed, error = $error'
          '\nmethod = $method, \narguments = $arguments <<<\n\n');
    }

    var message;
    try {
      message = Message.fromJson(jsonObjectOfArguments); // Message
    } catch (error) {
      debugPrint('>>>【ERROR in MessageCenter】 '
          'native call dart | '
          'arguments json object cast to message failed, error = $error'
          '\nmethod = $method, \narguments = $arguments <<<\n\n');
    }

    var messageOfWillReturn;
    try {
      messageOfWillReturn = await _delegate.called(method, message);
    } catch (error) {
      debugPrint('>>>【ERROR in MessageCenter】'
          'native call dart | '
          'error when delegate calling, error = $error'
          '\nmethod = $method, \narguments = $arguments <<<\n\n');
    }

    var jsonObjectOfWillReturn;
    try {
      jsonObjectOfWillReturn = messageOfWillReturn.toJson();
    } catch (error) {
      debugPrint('>>>【ERROR in MessageCenter】'
          'native call dart | '
          'result message cast to json object failed, error = $error'
          '\nmethod = $method, \narguments = $arguments <<<\n\n');
    }

    debugPrint('>>> '
        'native call dart result | '
        '\nmethod = $method, \narguments = $arguments, \nresult json object = $jsonObjectOfWillReturn <<<\n\n');

    var jsonStringOfWillReturn;
    try {
      jsonStringOfWillReturn = jsonEncode(jsonObjectOfWillReturn);
    } catch (error) {
      debugPrint('>>>【ERROR in MessageCenter】'
          'native call dart | '
          'result json object cast to json string failed, error = $error'
          '\nmethod = $method, \narguments = $arguments <<<\n\n');
    }
    return jsonStringOfWillReturn;
  }
}
