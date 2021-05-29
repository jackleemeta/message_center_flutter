# message_center

消息中心，参数使用 ``Message``

## Usage

- 启动

```
delegate = MYMessageCenterDelegate();
MessageCenter.engine(delegate);
```

- 调Native

```
final message = await MessageCenter.call("callNative", returnMsg);

```

- 等待原生的调用

```
class MYMessageCenterDelegate extends MessageCenterDelegate {
  @override
  Future<Message> called(String method, Message messgae) {
    final returnMsg = Message();
    returnMsg.custom = {"result": "success"};
    return Future.value(returnMsg);
  }
}
```


